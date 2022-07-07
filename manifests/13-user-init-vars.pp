class users {
  $group_name = supergroup
  group { $group_name :
    ensure => present,
  }

  user { 'user1':
    ensure     => present,
    gid        => $group_name,
    managehome => true,
  }
  user { 'user2':
    ensure     => present,
    gid        => $group_name,
    managehome => true,
  }
}