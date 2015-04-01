#config.pp
class profiles::config {

  file {'mklive-dir':
    path    => '/usr/local/icinga/var/rw/',
    ensure  => 'directory',
    owner   => "icinga",
    notify  => Service['icinga'],
  }

  service {'icinga':
    ensure  => running,
  }

  file {'thruk.conf':
    path    => '/etc/thruk/thruk.conf',
    ensure  => 'file',
    content => template('profiles/thruk.conf.erb'),
  }

}