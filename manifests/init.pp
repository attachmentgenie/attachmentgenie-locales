# Class to install and configure locales.
#
# @example Declaring the class
#   include ::locales
#
# @example You can override the default locale and available locales
#   class { locales:
#     default_locale => "en_US.UTF-8",
#     locales        => ["en_US.UTF-8 UTF-8", "en_GB.UTF-8 UTF-8"],
#   }
#
# @param default_locale Default locale.
# @param localegenfile  location of config file.
# @param locales Locales to install.
# @param package_name Name of package to install.
# @param package_version Version of locales to install.
class locales (
  String[1] $default_locale,
  Stdlib::Absolutepath $localegenfile,
  Array[String[1]] $locales,
  String[1] $package_name,
  String[1] $package_version,
) {
  anchor { 'locales::begin': }
  -> class { 'locales::install': }
  -> class { 'locales::config': }
  -> anchor { 'locales::end': }
}
