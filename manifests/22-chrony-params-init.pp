class chrony (
String $ntp_server = 'time.apple.com',
)  {

  $ntp_service = $facts['os']['family'] ? {
    'RedHat' => 'chronyd',
    'Debian' => 'chrony',
  }
  $ntp_conf = $facts['os']['family'] ? {
    'RedHat' => '/etc/chrony.conf',
    'Debian' => '/etc/chrony/chrony.conf',
  }

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