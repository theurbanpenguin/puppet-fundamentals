node 'ubuntu.eu-west-2.compute.internal' {
  include users
  class { 'chrony':
    ntp_server => 'uk.pool.ntp.org',
  }
}