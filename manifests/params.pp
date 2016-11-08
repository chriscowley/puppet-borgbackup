# == Class borgbackup::params
#
# This class is meant to be called from borgbackup.
# It sets variables according to platform.
#
class borgbackup::params {
  $version = '1.0.8'
  $url = "https://github.com/borgbackup/borg/releases/download/${version}/borg-linux64"
  case $::osfamily {
    'Debian': {
      $package_name = undef
    }
    'RedHat', 'Amazon': {
      $package_name = 'borgbackup'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
