# Jane - Eventide Command Line Component Generator

## Summary

The `jane-evt-generator` creates a component skeleton. It generates placeholders for message handlers, messages, an entity, projection, and store. It generates a settings file for the Postgres database connection, a test directory with supporting files to initialize the component during testing, as well as placeholders for test controls.

## Usage

```
$ jane-evt component something_component
```

## Installation

```
$ gem install jane-evt-generator --source https://TOKEN@gem.fury.io/USERNAME/
```

## Development

To build a new version of the gem, use the following commands:

```bash
gem install gemfury # If never done before
fury login # If never done before
gem build jane-evt-generator.gemspec
fury push --as=iheartjane jane-evt-generator-*.gem
```
