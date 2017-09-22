# Class to install and configure locales.
#
# Use this module to install and configure locales.
#
# @example Declaring the class
#   include ::locales
#
# @param default_locale Default locale.
# @param localegenfile  location of config file.
# @param locales Locales to install.
# @param package_name Name of package to install.
# @param package_version Version of locales to install.
class locales (
  String $default_locale  = $::locales::params::default_locale,
  Stdlib::Absolutepath $localegenfile = $::locales::params::localegenfile,
  Array[String] $locales = $::locales::params::locales,
  String $package_name = $::locales::params::package_name,
  String $package_version = $::locales::params::package_version,
) inherits locales::params {
  anchor { 'locales::begin': }
  -> class { 'locales::install': }
  -> class { 'locales::config': }
  -> anchor { 'locales::end': }
}
