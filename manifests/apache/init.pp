# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class apache {
  class { 'apache::package':
    before => Class['apache::service'],
  }
  class { 'apache::service':
    subscribe => Class['apache::package'],
  }
  class { 'apache::content':
    require => Class['apache::package'],
  }
}