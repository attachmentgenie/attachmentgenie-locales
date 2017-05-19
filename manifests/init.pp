class locales (
  Array[String]        $available      = $::locales::params::available,
  String               $default_value  = $::locales::params::default_value,
  Stdlib::Absolutepath $localegenfile  = $::locales::params::localegenfile,
  String               $package_ensure = $::locales::params::package_ensure,
  String               $package_name   = $::locales::params::package_name,
) inherits locales::params {

  anchor { 'locales::begin': }
  -> class { 'locales::install': }
  -> class { 'locales::config': }
  -> anchor { 'locales::end': }
}
