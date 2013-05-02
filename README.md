[![Build Status](https://secure.travis-ci.org/attachmentgenie/puppet-module-locales.png)](http://travis-ci.org/attachmentgenie/puppet-module-locales)

Puppet Locales Module
=====================

Module for configuring locales.

Tested on Debian GNU/Linux 6.0 Squeeze and Ubuntu 10.4 LTS with
Puppet 2.6. Patches for other operating systems are welcome.


Installation
------------

Clone this repo to a locales directory under your Puppet modules directory:

    git clone git://github.com/uggedal/puppet-module-locales.git locales

If you don't have a Puppet Master you can create a manifest file
based on the notes below and run Puppet in stand-alone mode
providing the module directory you cloned this repo to:

    puppet apply --modulepath=modules test_locales.pp


Usage
-----

If you include the locales class the standard available locale list and
default locale will be build and configured:

    include locales

You can override the default locale and available locales by including
the module with this special syntax:

    class { locales:
      default_value  => "nb_NO.UTF-8",
      available      => ["nb_NO.UTF-8 UTF-8", "en_GB.UTF-8 UTF-8"]
    }
