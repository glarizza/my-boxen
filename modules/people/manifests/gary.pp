class people::gary {

  package { 'Vagrant-1.0.5.dmg':
    ensure => installed,
    source => '/Users/glarizza/src/my-boxen/modules/people/files/Vagrant-1.0.5.dmg',
    provider => pkgdmg,
  }

  package { 'VirtualBox-4.1.23-80870-OSX.dmg':
    ensure => installed,
    source => '/Users/glarizza/src/my-boxen/modules/people/files/VirtualBox-4.1.23-80870-OSX.dmg',
    provider => pkgdmg,
  }

  package { 'tree':
    ensure => installed,
    provider => homebrew,
  }
}
