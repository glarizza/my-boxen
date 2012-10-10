class people::gary {

  ############
  # Packages #
  ############

  package { 'Vagrant':
    ensure => installed,
    source => 'http://files.vagrantup.com/packages/be0bc66efc0c5919e92d8b79e973d9911f2a511f/Vagrant-1.0.5.dmg',
    provider => pkgdmg,
  }

  package { 'Virtualbox':
    ensure => installed,
    source => 'http://download.virtualbox.org/virtualbox/4.1.22/VirtualBox-4.1.23-80870-OSX.dmg',
    provider => pkgdmg,
  }

  package { 'tree':
    ensure => installed,
    provider => homebrew,
  }

  package { 'Dropbox':
    source   => 'https://ddr3luum8vl5r.cloudfront.net/Dropbox%201.4.3.dmg',
    provider => appdmg,
  }

  package { 'zsh': }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh'],
  }

  package { 'SizeUp':
    source   => 'http://www.irradiatedsoftware.com/download/SizeUp.zip',
    provider => compressed_app
  }

  package { 'Sparrow':
    source   => 'http://download.sparrowmailapp.com/appcast/Sparrow-latest.dmg',
    provider => appdmg,
  }

  package { 'Chrome':
    source   => 'http://dl.google.com/chrome/mac/stable/GoogleChrome.dmg',
    provider => appdmg,
  }

  File {
    owner  => 'glarizza',
    group  => 'staff',
  }

  ################
  # Repositories #
  ################
  file { '/Users/glarizza/src':
    ensure => directory,
    mode   => '0755',
  }

  git::config::global{ 'user.name':
    value => 'Gary Larizza',
  }

  git::config::global{ 'user.email':
    value => 'gary@puppetlabs.com',
  }

  repository { '/Users/glarizza/.vim':
    source => 'glarizza/vim-puppet'
  }

  repository { '/Users/glarizza/src/oh-my-zsh':
    source  => 'glarizza/oh-my-zsh',
    require => File['/Users/glarizza/src'],
  }

  repository { '/Users/glarizza/src/dotfiles':
    source => 'glarizza/',
    require => File['/Users/glarizza/src'],
  }

  file { '/Users/glarizza/.zshrc':
    ensure => link,
    mode   => '0644',
    target => '/Users/glarizza/src/dotfiles/zshrc',
  }
}
