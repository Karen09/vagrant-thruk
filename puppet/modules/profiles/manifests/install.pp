#thruk.pp
class profiles::install {

  yumrepo  {'thruk':
    baseurl  => 'https://pulp.inuits.eu/upstream/',
    gpgcheck => '0',
    enabled  => '1',
  }

  package {'livestatus':
    require =>Yumrepo['thruk'],
  }

  package {'thruk':
    require =>Yumrepo['thruk'],
  }
}