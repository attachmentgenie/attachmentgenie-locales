# attachmentgenie-locales

[![](https://img.shields.io/puppetforge/pdk-version/attachmentgenie/locales.svg?style=popout)](https://forge.puppetlabs.com/attachmentgenie/locales)
[![](https://img.shields.io/puppetforge/v/attachmentgenie/locales.svg?style=popout)](https://forge.puppetlabs.com/attachmentgenie/locales)
[![](https://img.shields.io/puppetforge/dt/attachmentgenie/locales.svg?style=popout)](https://forge.puppetlabs.com/attachmentgenie/locales)
[![](https://travis-ci.org/attachmentgenie/attachmentgenie-locales.svg?branch=master)](https://travis-ci.org/attachmentgenie/attachmentgenie-locales)
[![License](https://img.shields.io/github/license/attachmentgenie/attachmentgenie-locales?stype=popout)](https://github.com/attachmentgenie/attachmentgenie-locales/blob/master/LICENSE)

Deploy and configure attachmentgenie's locales on a node.

- [Description](#description)
- [Usage](#usage)
- [Reference](#reference)
- [Changelog](#changelog)
- [Limitations](#limitations)
- [Development](#development)

## Description

This project serves as my starter project

## Usage

All options and configuration can be done through interacting with the parameters
on the main locales class.
These are now documented via [Puppet Strings](https://github.com/puppetlabs/puppet-strings)

You can view locales usage in [REFERENCE](REFERENCE.md).

## Reference

See [REFERENCE](REFERENCE.md).

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

### Running tests

This project contains tests for both rspec-puppet and litmus to verify functionality. For detailed information on using these tools, please see their respective documentation.

#### Testing quickstart:

```
pdk bundle install
pdk bundle exec rake 'litmus:provision_list[puppet6]'
pdk bundle exec rake 'litmus:install_agent[puppet6]'
pdk bundle exec rake litmus:install_module
pdk bundle exec rake litmus:acceptance:parallel
pdk bundle exec rake litmus:tear_down
