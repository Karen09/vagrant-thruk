class profiles::icinga{

  yumrepo  {'icinga':
    baseurl  => 'http://packages.icinga.org/epel/6Server/release/',
    gpgcheck => '0',
    enabled  => '1',
  }

  package {'icinga':
    require =>Yumrepo['icinga'],
  }

  package {'icinga-debuginfo':
    require =>Package['icinga'],
  }

  package {'icinga-devel':
    require =>Package['icinga-debuginfo'],
  }

  package {'icinga-doc':
    require =>Package['icinga-devel'],
  }

  package {'icinga-gui-config':
    require =>Package['icinga-doc'],
  }

  package {'icinga-gui':
    require =>Package['icinga-gui-config'],
  }

  package {'icinga-idoutils-libdbi-mysql':
    require =>Package['icinga-gui'],
  }

  package {'icinga-idoutils':
    require =>Package['icinga-idoutils-libdbi-mysql'],
  }

  file {'thruk.cfg':
    path    => '/etc/icinga/modules/thruk.cfg',
    ensure  => 'file',
    owner   => 'icinga',
    content => template('/tmp/vagrant-puppet/modules-251f4c8fee528187fce2a500fc206569/profiles/template/thruk.cfg.erb'),
    require => package['icinga-idoutils'],
  }
}