# Class to install locales.
#
# Dont include this class directly.
#
class locales::install inherits locales {

  package { 'locales':
    ensure => $::locales::package_version,
    name   => $::locales::package_name
  }
}