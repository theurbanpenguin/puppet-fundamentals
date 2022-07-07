class users {
  group { 'supergroup':
    ensure => present,
  }

  user { 'user1':
    ensure     => present,
    gid        => supergroup,
    managehome => true,
  }
  user { 'user2':
    ensure     => present,
    gid        => supergroup,
    managehome => true,
  }

}