class people::glarizza::vagrant {
  require ::vagrant
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => 'puppet:///modules/people/fusion.lic',
  }
  vagrant::plugin { 'vagrant-auto_network':
    version => '1.0.2'
  }
  vagrant::plugin { 'vagrant-pe_build':
    version => '0.9.6'
  }
  vagrant::plugin { 'vagrant-oscar':
    version => '0.4.1'
  }
  vagrant::plugin { 'vagrant-login':
    version => '1.0.1'
  }
  vagrant::plugin { 'vagrant-multiprovider-snap':
    version => '0.0.14'
  }
  vagrant::plugin { 'vagrant-share':
    version => '1.1.2'
  }
  vagrant::plugin { 'vagrant-windows':
    version => '1.6.0'
  }
}
