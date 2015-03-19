class profiles::thruk {

  include profiles::icinga
  include profiles::nagios
  include profiles::mod_fcgid
  include profiles::mysql
  include profiles::install
  include profiles::config
  include profiles::service

  Class['profiles::icinga'] ->
  Class['profiles::nagios'] ->
  Class['profiles::mod_fcgid'] ->
  Class['profiles::install'] ->
  Class['profiles::mysql'] ->
  Class['profiles::config'] ->
  Class['profiles::service']
}
