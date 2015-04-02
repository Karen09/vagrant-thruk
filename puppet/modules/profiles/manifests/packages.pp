class profiles::packages {
	
  yumrepo  {'rpm':
    baseurl  => 'http://apt.sw.be/redhat/el6/en/$basearch/rpmforge',
    gpgcheck => '0',
    enabled  => '1',
  }

  package {'nagios-plugins':
    require => Yumrepo['rpm'],
  }

  yumrepo  {'livestatus':
    baseurl  => 'https://pulp.inuits.eu/upstream/',
    gpgcheck => '0',
    enabled  => '1',
    require  => Package['nagios-plugins'],
  }

  package {'livestatus':
    require => Yumrepo['livestatus'],
  }
}