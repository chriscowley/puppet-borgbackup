# Class: borgbackup
# ===========================
#
# Full description of class borgbackup here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class borgbackup (
  $package_name = $::borgbackup::params::package_name,
  $url          = $::borgbackup::params::url
  $borg_user    = $::borgbackup::params::borg_user
  $borg_repo    = $::borgbackup::params::borg_repo
  $passphrase   = $::borgbackup::params::passphrase
) inherits ::borgbackup::params {

  # validate parameters here

  class { '::borgbackup::install': } ->
  class { '::borgbackup::createrepo': } ~>
  Class['::borgbackup']
}
