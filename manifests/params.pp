# Class to manage locales parameters.
#
# Dont include this class directly.
#
class locales::params {
  $default_locale  = 'en_US.UTF-8'
  $locales         = ['en_US.UTF-8 UTF-8']
  $package_name    = 'locales'
  $package_version = present
  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        ubuntu: {
          case $::lsbdistcodename {
            xenial: { $localegenfile = '/etc/locale.gen' }
            default: { $localegenfile = '/var/lib/locales/supported.d/local' }
          }
        }
        default: { $localegenfile = '/etc/locale.gen' }
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports the Debian osfamily.")
    }
  }
}