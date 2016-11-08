# == Class borgbackup::install
#
# This class is called from borgbackup for install.
#
class borgbackup::install (
  $url = $::borgbackup::url,
  $package_name = $::borgbackup::package_name,
) {
  if $package_name {
    package { $package_name:
      ensure => 'latest',
    }
  } else {
    exec { "curl -o /usr/local/bin/borg ${url}":
      path    => '/usr/bin',
      creates => '/usr/local/bin/borg',
    }
  }
}
