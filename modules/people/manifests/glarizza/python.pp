class people::glarizza::python {

  exec { 'install pip':
    command => '/usr/bin/easy_install pip',
    unless  => 'which pip',
  }

  exec { 'install the_fuck':
    command => '/usr/local/bin/pip install thefuck',
    unless  => 'which fuck',
    require => Exec['install pip'],
  }

}
