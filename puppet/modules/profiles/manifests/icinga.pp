class profiles::icinga {

  yumrepo  {'icinga-repo':
    baseurl  => 'http://packages.icinga.org/epel/6Server/release/',
    gpgcheck => '0',
    enabled  => '1',
  }

  package {'icinga':
    require => Yumrepo['icinga-repo'],
  }

  package {'icinga-idoutils-libdbi-mysql':
    require => Package['icinga'],
  }

  package {'icinga-gui-config':
    require => Package['icinga-idoutils-libdbi-mysql'],
  }

  package {'icinga-doc':
    require => Package['icinga-gui-config'],
  }

  package {'icinga-gui':
    require => Package['icinga-doc'],
  }

  package {'icinga-idoutils':
    require => Package['icinga-gui'],
  }

  package {'icinga-devel':
    require => Package['icinga-idoutils'],
  }

  package {'icinga-debuginfo':
    require => Package['icinga-devel'],
  }

  file {'thruk.cfg':
    path    => '/etc/icinga/modules/thruk.cfg',
    ensure  => 'file',
    owner   => 'icinga',
    content => template('profiles/thruk.cfg.erb'),
    require => Package['icinga-debuginfo'],
    notify  => Service['icinga'],
  }

}