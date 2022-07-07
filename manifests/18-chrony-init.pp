class chrony {

  $ntp_server = 'time.apple.com'

  package { 'chrony':
    ensure => present,
    before => File['/etc/chrony/chrony.conf'],
  }

  file { '/etc/chrony/chrony.conf':
    ensure => present,
    content => epp('chrony/chrony.conf.epp'),
    notify => Service['chrony'],
  }

  service { 'chrony':
    ensure  => running,
    enable  => true,
    require => Package['chrony']
  }
}
