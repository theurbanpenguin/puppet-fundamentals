class chrony (
String $ntp_server = 'time.apple.com',
)  {

  $ntp_conf = lookup('ntp_conf')
  $ntp_service = lookup('ntp_service')
  package { 'chrony':
    ensure => present,
    before => File[$ntp_conf],
  }

  file { $ntp_conf :
    ensure => present,
    content => epp('chrony/chrony.conf.epp'),
    notify => Service[$ntp_service],
  }

  service { 'chrony':
    ensure  => running,
    enable  => true,
    require => Package['chrony']
  }
}