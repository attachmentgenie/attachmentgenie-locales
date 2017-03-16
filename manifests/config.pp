class locales::config inherits locales {
  $_available_join = $::locales::available.join("\n")

  file {
    $::locales::localegenfile:
      content => "${_available_join}\n";
    '/etc/default/locale':
      content => epp('locales/locale.epp', {
        'default_value' => $::locales::default_value
      });
  }

  exec {
    '/usr/sbin/locale-gen':
      subscribe   => File[$::locales::localegenfile, '/etc/default/locale'],
      refreshonly => true;
    '/usr/sbin/update-locale':
      subscribe   => File[$::locales::localegenfile, '/etc/default/locale'],
      refreshonly => true;
  }
}