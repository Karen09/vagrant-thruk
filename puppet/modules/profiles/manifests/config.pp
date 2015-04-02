#config.pp
class profiles::config {

  file {'mklive-dir':
    path    => '/usr/local/icinga/var/rw/',
    ensure  => 'directory',
    owner   => "icinga",
  }

  service {'icinga':
    ensure  => running,
    require => File['mklive-dir'],
    notify  => Service['httpd'],
  }

  service {'httpd':
    ensure  => running,
    require => Service['icinga'],
  }
}