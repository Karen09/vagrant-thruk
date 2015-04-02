class profiles::thruk {

  contain profiles::icinga
  
  contain profiles::mysql
  
  contain profiles::config
  
  contain ::thruk
  
  contain profiles::service

  contain profiles::packages

  Class['profiles::icinga']   ->
  Class['profiles::packages'] ->
  Class['profiles::mysql']    ->
  Class['profiles::config']   ->
  Class['::thruk']            ->
  Class['profiles::service']
}