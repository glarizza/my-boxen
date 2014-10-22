class people::glarizza::config (
  $my_homedir   = $people::glarizza::params::my_homedir,
  $my_sourcedir = $people::glarizza::params::my_sourcedir,
  $my_username  = $people::glarizza::params::my_username
) {

  include osx::dock::autohide
  include osx::no_network_dsstores
  include osx::keyboard::capslock_to_control
  include osx::software_update
  include osx::global::key_repeat_rate
  include osx::disable_app_quarantine
  include osx::global::disable_autocorrect
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  include osx::finder::unhide_library
  include osx::finder::show_all_on_desktop
  include osx::finder::enable_quicklook_text_selection

  class { 'osx::dock::position':
    position => 'left',
  }

  osx::dock::hot_corner { 'Show the desktop':
    position => 'Bottom Right',
    action => 'Put Display to Sleep'
  }

  $recovery_message = "Gary Larizzas Macbook Air. If found, please email glarizza@me.com or call 567-623-9123."
  osx::recovery_message { $recovery_message: }

  ###############
  # User Config #
  ###############
  ## Because we need INTEGER values for that hash, we have to do this
  ## ugliness.  Yes, it IS ugly.  Sorry :(
  $two  = integer('2')
  $zero = integer('0')


  # Changes the default shell to the zsh version we get from Homebrew
  # Uses the osx_chsh type out of boxen/puppet-osx
  osx_chsh { $my_username:
    shell   => '/opt/boxen/homebrew/bin/zsh',
    require => Package['zsh'],
  }

  exec { 'Restart the Dock':
    command     => '/usr/bin/killall -HUP Dock',
    refreshonly => true,
  }

  file { 'Dock Plist':
    ensure  => file,
    owner   => $::my_username,
    path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    mode    => '0600',
    notify     => Exec['Restart the Dock'],
  }

}
