class people::glarizza::applications {
  include sublime_text_2
  include gitx
  include caffeine
  include iterm2::stable
  include onepassword
  include dropbox
  include sizeup
  include chrome

  $homebrew_packages = [
    'tree',
    'curl',
    'gawk',
    'wget',
    'zsh',
    'nmap',
    'tmux',
    'rust',
    'imagemagick'
  ]

  ## Declare all Homebrew packages at once
  package { $homebrew_packages: }

  package { 'Virtualbox':
    ensure => installed,
    source => 'http://download.virtualbox.org/virtualbox/4.1.22/VirtualBox-4.1.23-80870-OSX.dmg',
    provider => pkgdmg,
  }

  package { 'Skitch':
    ensure   => installed,
    source   => 'http://cdn1.evernote.com/skitch/mac/release/Skitch-2.0.4.zip',
    provider => compressed_app,
  }

  package { 'Cyberduck':
    source   => 'http://c315635.r35.cf1.rackcdn.com/Cyberduck-4.2.1.zip',
    provider => compressed_app
  }

  package { 'iStat Menus':
    source   => 'http://s3.amazonaws.com/bjango/files/istatmenus3/istatmenus3.27.zip',
    provider => compressed_app
  }

  package { 'Github for Mac':
    source   => 'https://github-central.s3.amazonaws.com/mac%2FGitHub%20for%20Mac%20124.zip',
    provider => compressed_app
  }

  package { 'Gephi':
    source   => 'https://launchpadlibrarian.net/98903476/gephi-0.8.1-beta.dmg',
    provider => appdmg,
  }

  package { 'Pacifist':
    source   => 'http://www.charlessoft.com/pacifist_download/Pacifist_3.0.10.dmg',
    provider => appdmg,
  }

  package { 'A Better Finder Renamer':
    source   => 'http://d3k6s0oeufjjjn.cloudfront.net/download0_126e6b5/ABFRX8.dmg',
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

  package { 'Pandoc':
    source   => 'https://pandoc.googlecode.com/files/pandoc-1.12.1-1.dmg',
    provider => pkgdmg,
  }

  package { 'Kindlegen':
    source   => 'http://kindlegen.s3.amazonaws.com/KindleGen_Mac_i386_v2_9.zip',
    provider => compressed_app,
  }

  package { 'Yorufukurou':
    source   => 'http://aki-null.net/yf/YoruFukurou_SL.zip',
    provider => compressed_app,
  }

  package { 'Transmission':
    source   => 'http://download.transmissionbt.com/files/Transmission-2.73.dmg',
    provider => appdmg
  }

  package { 'Timer':
    source   => 'http://www.apimac.com/download/timer.dmg',
    provider => appdmg,
  }
}
