# Class to install locales.
#
# @api private
class locales::install inherits locales {

  package { 'locales':
    ensure => $::locales::package_version,
    name   => $::locales::package_name
  }
}