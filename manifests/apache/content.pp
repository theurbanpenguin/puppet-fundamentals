cat content.pp
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::content
class apache::content {
  require apache::package
  file { '/var/www/html/index.html':
    ensure  => 'file',
    content => epp('apache/index.epp'),
  }
}