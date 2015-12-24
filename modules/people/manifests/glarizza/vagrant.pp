class people::glarizza::vagrant {
  class { '::vagrant':
    version => '1.8.0',
  }

  Vagrant::Plugin {
    require => Class['::vagrant'],
  }

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => 'puppet:///modules/people/fusion.lic',
  }
  vagrant::plugin { 'vagrant-auto_network': }
  vagrant::plugin { 'vagrant-pe_build': }
  vagrant::plugin { 'vagrant-oscar': }
  vagrant::plugin { 'vagrant-login': }
  vagrant::plugin { 'vagrant-multiprovider-snap': }
  vagrant::plugin { 'vagrant-share': }
  vagrant::plugin { 'vagrant-windows': }
}
