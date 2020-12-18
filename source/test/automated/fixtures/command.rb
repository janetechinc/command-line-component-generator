module Fixtures
  class Command
    include TestBench::Fixture
    include Initializer

    extend Forwardable

    def_delegators :message_fixture, :message_type, :assert_attributes_assigned, :assert_follows, :assert_attribute_value
    def_delegators :writer_fixture, :assert_stream_name, :assert_reply_stream_name
    def_delegator :writer_fixture, :message, :command_message

    def title_context_name
      if @title_context_name.nil?
        @title_context_name = "Command Message"

        if not command_message.nil?
          @title_context_name = "#{@title_context_name}: #{message_type}"
        end
      end

      @title_context_name
    end

    initializer :command, :message_class, :previous_message, na(:title_context_name), :test_block

    def self.build(command, message_class:, previous_message: nil, title_context_name: nil, &test_block)
      new(command, message_class, previous_message, title_context_name, test_block)
    end

    def writer_fixture
      @writer_fixture ||= TestBench::Fixture.build(
        Messaging::Fixtures::Writer,
        command.write,
        message_class,
        session: test_session
      )
    end

    def message_fixture
      @message_fixture ||= TestBench::Fixture.build(
        Messaging::Fixtures::Message,
        command_message,
        previous_message,
        session: test_session
      )
    end

    def call
      context_name = title_context_name

      context context_name do
        if test_block.nil?
          raise Error, "Message fixture must be executed with a block"
        end

        test_block.call(self)

        if not previous_message.nil?
          context "Metadata" do
            assert_follows
          end
        end
      end
    end

    def assert_attribute_values(control_values)
      control_values.each do |attribute, control_value|
        assert_attribute_value(attribute, control_value)
      end
    end
  end
end
