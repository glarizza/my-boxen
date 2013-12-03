class people::glarizza (
  $my_username  = $people::glarizza::params::my_username,
  $my_homedir   = $people::glarizza::params::my_homedir,
  $my_sourcedir = $people::glarizza::params::my_sourcedir,
) inherits people::glarizza::params {
  ## Declare all subclasses
  include people::glarizza::applications
  include people::glarizza::repositories
  include people::glarizza::config
  include people::glarizza::puppet
  include people::glarizza::vagrant
}
