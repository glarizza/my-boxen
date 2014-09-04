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

  property_list_key { 'Lower Right Hotcorner - Screen Saver':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-br-corner',
    value      => '10', 
    value_type => 'integer',
    notify     => Exec['Restart the Dock'],
  }

  property_list_key { 'Lower Right Hotcorner - Screen Saver - modifier':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-br-modifier',
    value      => $zero,
    value_type => 'integer',
    notify     => Exec['Restart the Dock'],
  }

  file { 'Dock Plist':
    ensure  => file,
    owner   => $::my_username,
    require => [
                 Property_list_key['Lower Right Hotcorner - Screen Saver - modifier'],
                 Property_list_key['Lower Right Hotcorner - Screen Saver'],
               ],  
    path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    mode    => '0600',
    notify     => Exec['Restart the Dock'],
  }

  #boxen::osx_defaults { 'Lower Right Hotcorner - Screen Saver':
  #  user   => $::boxen_user,
  #  domain => 'com.apple.dock',
  #  key    => 'wvous-br-corner',
  #  value  => 10,
  #  notify => Exec['Restart the Dock'],
  #}
  #
  #boxen::osx_defaults { 'Lower Right Hotcorner - Screen Saver - modifier':
  #  user   => $::boxen_user,
  #  domain => 'com.apple.dock',
  #  key    => 'wvous-br-corner-modifier',
  #  value  => 0,
  #  notify => Exec['Restart the Dock'],
  #}
  
  boxen::osx_defaults { 'Disable Gatekeeper':
    user   => $::boxen_user,
    domain => '/var/db/SystemPolicy-prefs.plist',
    key    => 'enabled',
    value  => 'no',
    notify => Exec['Restart the Dock'],
  }
  
  file { "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist":
    ensure  => file,
    mode    => '0600',
    require => Property_list_key['Keymapping-internal', 'Keymapping-external'],
  }

  property_list_key { 'Keymapping-internal':
    ensure => present,
    path   => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist",
    key    => 'com.apple.keyboard.modifiermapping.1452-566-0',
    value  => {
                'HIDKeyboardModifierMappingDst' => $two,
                'HIDKeyboardModifierMappingSrc' => $zero,
              },
    value_type => array,
  }

  property_list_key { 'Keymapping-external':
    ensure => present,
    path   => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist",
    key    => 'com.apple.keyboard.modifiermapping.1452-544-0',
    value  => {
                'HIDKeyboardModifierMappingDst' => $two,
                'HIDKeyboardModifierMappingSrc' => $zero,
              },
    value_type => array,
  }
}
