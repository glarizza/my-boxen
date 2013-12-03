class people::glarizza::config (
  $my_homedir   = $people::glarizza::params::my_homedir,
  $my_sourcedir = $people::glarizza::params::my_sourcedir,
  $my_username  = $people::glarizza::params::my_username
) {

  File {
    owner => $my_username,
    group => 'staff',
    mode  => '0644',
  }

  ###############
  # User Config #
  ###############

  # Changes the default shell to the zsh version we get from Homebrew
  # Uses the osx_chsh type out of boxen/puppet-osx
  osx_chsh { $my_username:
    shell   => '/opt/boxen/homebrew/bin/zsh',
    require => Package['zsh'],
  }

  ###################
  # Config Settings #
  ###################

  property_list_key { 'Disable Ducking Autocorrect':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
    key        => 'NSAutomaticSpellingCorrectionEnabled',
    value      => false,
    value_type => 'boolean',
  }

  file { '.GlobalPreferences Plist':
    ensure  => file,
    require => Property_list_key['Disable Ducking Autocorrect'],
    path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
    mode    => '0600',
  }

  # NOTE: Dock prefs only take effect when you restart the dock
  property_list_key { 'Hide the dock':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'autohide',
    value      => true,
    value_type => 'boolean',
    notify     => Exec['Restart the Dock'],
  }

  exec { 'Restart the Dock':
    command     => '/usr/bin/killall -HUP Dock',
    refreshonly => true,
  }

  property_list_key { 'Align the Dock Left':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'orientation',
    value      => 'left',
    notify     => Exec['Restart the Dock'],
  }

  property_list_key { 'Lower Right Hotcorner - Screen Saver':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-br-corner',
    value      => 10, 
    value_type => 'integer',
    notify     => Exec['Restart the Dock'],
  }

  property_list_key { 'Lower Right Hotcorner - Screen Saver - modifier':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'wvous-br-modifier',
    value      => 0,
    value_type => 'integer',
    notify     => Exec['Restart the Dock'],
  }

  file { 'Dock Plist':
    ensure  => file,
    require => [
                 Property_list_key['Lower Right Hotcorner - Screen Saver - modifier'],
                 Property_list_key['Hide the dock'],
                 Property_list_key['Align the Dock Left'],
                 Property_list_key['Lower Right Hotcorner - Screen Saver'],
                 Property_list_key['Lower Right Hotcorner - Screen Saver - modifier'],
               ],  
    path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    mode    => '0600',
    notify     => Exec['Restart the Dock'],
  }

  property_list_key { 'Disable "Are you sure you want to open this?" Messages':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
    key        => 'LSQuarantine',
    value      => false,
    value_type => 'boolean',
  }

  file { 'LaunchServices Plist':
    ensure  => file,
    require => Property_list_key['Disable "Are you sure you want to open this?" Messages'],
    path    => "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
    mode    => '0600',
  }

  property_list_key { 'Disable Gatekeeper':
    ensure => present,
    path   => '/var/db/SystemPolicy-prefs.plist',
    key    => 'enabled',
    value  => 'no',
  }

  file { "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist":
    ensure  => file,
    mode    => '0600',
    require => Property_list_key['Keymapping-internal', 'Keymapping-external'],
  }

  ## Because we need INTEGER values for that hash, we have to do this
  ## ugliness.  Yes, it IS ugly.  Sorry :(
  $two  = integer('2')
  $zero = integer('0')

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

  $recovery_message = "Gary Larizzas Macbook Air. If found, please email glarizza@me.com or call 567-623-9123."
  osx::recovery_message { $recovery_message: }
}
