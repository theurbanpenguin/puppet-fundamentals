user { 'andrew':
  ensure   => 'present',
  comment  => 'Andrew M',
  gid      => 10,
  home     => '/home/andrew',
  provider => 'useradd',
  shell    => '/bin/sh',
  uid      => 2001,
}
