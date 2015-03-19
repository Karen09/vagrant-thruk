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
    content => template('/tmp/vagrant-puppet/modules-251f4c8fee528187fce2a500fc206569/profiles/template/thruk.conf.erb'),
  }

}