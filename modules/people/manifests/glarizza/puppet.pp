class people::glarizza::puppet (
  $my_sourcedir = $people::glarizza::params::my_sourcedir,
) {
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
