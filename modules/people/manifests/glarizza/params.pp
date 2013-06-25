class people::glarizza::params {
  # $::luser and $::boxen_srcdir come from Boxen's custom facts
  $my_username  = $::luser
  $my_homedir   = "/Users/${my_username}"
  $my_sourcedir = $::boxen_srcdir
}
