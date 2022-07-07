class chrony {
  package { 'chrony':
    ensure => present,
    before => File['/etc/chrony/chrony.conf'],
  }

  file { '/etc/chrony/chrony.conf':
    ensure => present,
    source => 'puppet:///modules/chrony/chrony.conf',
    notify => Service['chrony'],
  }

  service { 'chrony':
    ensure  => running,
    enable  => true,
    require => Package['chrony']
  }
}