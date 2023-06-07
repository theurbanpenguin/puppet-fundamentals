# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::package
class apache::package {
  if $facts['os']['family'] == 'Debian' {
    exec { 'chk_apache':
      command => 'ln -s /dev/null /etc/systemd/system/apache2.service',
      path    => '/usr/bin/',
      unless  => 'test -d /etc/apache2',
    }
  }

  package { lookup(apache::apache_pkg):
    ensure => 'present',
  }
}