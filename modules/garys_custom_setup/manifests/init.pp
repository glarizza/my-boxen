class garys_custom_setup {

  # These declarations require a VPN connection back to PuppetLabs,
  # which is why they're in an entirely separate module.

  ############
  # Packages #
  ############

  package { 'VMware Fusion':
    source   => 'http://faro.puppetlabs.lan/gary/VMware-Fusion-5.0.1-825449-light.dmg',
    provider => 'appdmg',
  }

  ################
  # Repositories #
  ################

  repository { "${my_sourcedir}/saleseng_soupkitchen":
    source => 'git@git.puppetlabs.com:puppetlabs/saleseng_soupkitchen',
  }

}
