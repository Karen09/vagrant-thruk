class profiles::nagios{

  yumrepo  {'rpm':
    baseurl  => 'http://apt.sw.be/redhat/el6/en/$basearch/rpmforge',
    gpgcheck => '0',
    enabled  => '1',
  }

  package {'nagios-plugins':
    require =>Yumrepo['rpm'],
  }
}