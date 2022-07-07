user { 'joe' :
  ensure     => 'present',
  uid        => 2000,
  gid        => 10,
  comment    => 'Joe User',
  managehome => true,
}