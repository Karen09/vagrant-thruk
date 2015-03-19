class profiles::nagios{

  exec {'rpm-forge':
    command  => 'yum localinstall -y http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm',
    path     => '/usr/bin',
    provider => shell,
    creates => '/etc/yum.repos.d/rpmforge.repo',
  }

  package {'nagios-plugins':
    require =>Exec['rpm-forge'],
  }
}