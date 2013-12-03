class people::glarizza::vagrant {
  require ::vagrant
  vagrant::plugin { 'vagrant-vmware-fusion':
    license => 'puppet:///modules/people/fusion.lic',
  }
}
