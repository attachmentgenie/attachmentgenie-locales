# Class to configure locales.
#
# @api private
class locales::config inherits locales {
  $_available_join = $::locales::locales.join("\n")

  file {
    'locale genfile':
      content => "${_available_join}\n",
      path    => $::locales::localegenfile;
    'locale defaults':
      content => epp('locales/locale.epp', {
        'locale' => $::locales::default_locale,
      }),
      path    =>  '/etc/default/locale';
  }

  exec {
    'generate locales':
      command     => '/usr/sbin/locale-gen',
      subscribe   => File['locale genfile', 'locale defaults'],
      refreshonly => true;
    'update locale':
      command     => '/usr/sbin/update-locale',
      subscribe   => File['locale genfile', 'locale defaults'],
      refreshonly => true;
  }
}