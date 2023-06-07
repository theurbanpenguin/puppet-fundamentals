# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::service
class apache::service {
  require apache::package
  service { lookup(apache::apache_svc):
    ensure => 'running',
    enable => true,
  }
}