class garys_custom_setup {

  # These declarations require a VPN connection back to PuppetLabs,
  # which is why they're in an entirely separate module.

  ############
  # Packages #
  ############

  # Truecrypt requires you to accept a license, so I had to pull out the
  # mpkg, repackage it into a new DMG, and throw it up on Faro
  package { 'Truecrypt':
    source   => 'http://faro.puppetlabs.lan/gary/TrueCrypt-7.1a.dmg',
    provider => pkgdmg,
  }

  package { 'VMware Fusion':
    source   => 'http://faro.puppetlabs.lan/gary/VMware-Fusion-5.0.1-825449-light.dmg',
    provider => 'appdmg',
  }

  ################
  # Repositories #
  ################

  # In order to do this, we need an ssh key...which is proving troublesome
  #vcsrepo { "${my_sourcedir}/saleseng_soupkitchen":
  #  ensure   => present,
  #  provider => git,
  #  source   => 'git@git.puppetlabs.com:puppetlabs/saleseng_soupkitchen',
  #}

}
