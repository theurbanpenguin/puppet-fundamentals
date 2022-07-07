class chrony {

  package { 'chrony':
    ensure => present,
  }

  file { '/etc/chrony/chrony.conf':
    ensure => present,
    source => 'puppet:///modules/chrony/chrony.conf',
  }

  service { 'chrony':
    ensure => running,
    enable => true
  }
}