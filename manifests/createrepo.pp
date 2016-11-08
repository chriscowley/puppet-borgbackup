# Class called from borgbackup to initialise the repository

class borgbackup::createrepo {
  exec { 'Initialize repo':
    command     => "borg init ${borg_repo}",
    environment => "BORG_PASSPHRASE=${::borgbackup::passphrase}",
    creates     => ${borg_repo},
    path        => ['/usr/bin/', '/bin'],
    user        => ${borg_user},
  }
}
