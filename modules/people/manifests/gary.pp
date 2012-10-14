class people::gary {

  include sublime_text_2
  include gitx
  include caffeine
  #include imagemagick
  #include xquartz          # <--Source in xquartz is broken
  include iterm2::stable
  include onepassword

  #############
  # Variables #
  #############

  $my_username  = 'glarizza'
  $my_homedir   = "/Users/${my_username}"
  $my_sourcedir = "${my_homedir}/src"


  ############
  # Defaults #
  ############

  File {
    owner  => $my_username,
    group  => 'staff',
  }


  ###############
  # User Config #
  ###############

  # Changes the default shell to the zsh version we get from Homebrew
  # Uses the osx_chsh type out of boxen/puppet-osx
  osx_chsh { 'glarizza':
    shell   => '/opt/boxen/homebrew/bin/zsh',
    require => Package['zsh'],
  }

  ############
  # Packages #
  ############

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

  package { 'gawk': }
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

  package { 'Tunnelblick':
    source   => 'http://tunnelblick.googlecode.com/files/Tunnelblick_3.3beta21a.dmg',
    provider => appdmg,
  }

  package { 'CoRD':
    source   => 'http://iweb.dl.sourceforge.net/project/cord/cord/0.5.7/CoRD_0.5.7.zip',
    provider => compressed_app,
  }

  package { 'Crashplan':
    source   => 'http://download.crashplan.com/installs/mac/install/CrashPlan/CrashPlan_3.2.1_Mac.dmg',
    provider => pkgdmg,
  }

  package { 'Yorufukurou':
    source   => 'http://aki-null.net/yf/YoruFukurou_SL.zip',
    provider => compressed_app,
  }


  ###############################
  # Git config and repositories #
  ###############################

  git::config::global{ 'user.name':
    value => 'Gary Larizza',
  }

  git::config::global { 'alias.lg':
    value => "log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order",
  }

  git::config::global { 'alias.review':
    value => 'log -p --reverse -M -C -C --patience --no-prefix',
  }

  git::config::global{ 'user.email':
    value => 'gary@puppetlabs.com',
  }

  repository { "${my_sourcedir}/saleseng-demo-environment":
    source => 'puppetlabs/saleseng-demo-environment',
  }

  repository { "/Users/${my_username}/.vim":
    source => 'glarizza/vim-puppet'
  }

  repository { "/Users/${my_username}/.vim/bundle/vim-colors-solarized":
    source  => 'altercation/vim-colors-solarized.git',
    require => Repository["/Users/${my_username}/.vim"],
  }

  repository { "${my_sourcedir}/oh-my-zsh":
    source  => 'glarizza/oh-my-zsh',
  }

  repository { "${my_sourcedir}/dotfiles":
    source => 'glarizza/dotfiles',
  }

  file { "/Users/${my_username}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dotfiles/zshrc",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

  file { "/Users/${my_username}/.vimrc":
    ensure => link,
    mode   => '0644',
    target => "${my_sourcedir}/dotfiles/vimrc",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

  file { "/Users/${my_username}/.oh-my-zsh":
    ensure  => link,
    target  => "${my_sourcedir}/oh-my-zsh",
    require => Repository["${my_sourcedir}/oh-my-zsh"],
  }


  ##################################
  ## Facter, Puppet, and Envpuppet##
  ##################################

  repository { "${my_sourcedir}/puppet":
    source => 'puppetlabs/puppet',
  }

  repository { "${my_sourcedir}/facter":
    source => 'puppetlabs/facter',
  }

  file { '/bin/envpuppet':
    ensure  => link,
    mode    => '0755',
    target  => "${my_sourcedir}/puppet/ext/envpuppet",
    require => Repository["${my_sourcedir}/puppet"],
  }
}
