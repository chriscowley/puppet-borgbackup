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
  $url         = $::borgbackup::params::url
) inherits ::borgbackup::params {

  # validate parameters here

  class { '::borgbackup::install': } ->
  class { '::borgbackup::config': } ~>
  Class['::borgbackup']
}
