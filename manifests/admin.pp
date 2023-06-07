# @summary
#   Creates admin user
#   create_user::admin
# @param password
#   allows custom encrypted password to passed
define create_user::admin (
  # Password is deliberately set with MD5 to keep short for demo
  $password = '$1$B3jRU5BS$tM/mD6.f1815uOr0ZORUM.',
  $create = true,
) {
    $homedir = "/home/${title}"
    #Puppet Selector to popular group based on os family
    $group = $facts['os']['family'] ? {
      'RedHat' => 'wheel',
      'Debian' => 'sudo',
    }

    if $create {
      $ensure_file = 'file'
      $ensure_user = 'present'
    } else {
      $ensure_file = 'absent'
      $ensure_user = 'absent'
    }

    user { $title:
      ensure     => $ensure_user,
      managehome => true,
      password   => $password,
      groups     => $group,
    }
    file { "${homedir}/.vimrc":
      ensure => $ensure_file,
      owner  => $title,
      group  => $title,
      mode   => '0600',
      source => 'puppet:///modules/create_user/vimrc',
    }

    file { "/etc/sudoers.d/$title":
      ensure    => $ensure_file,
      owner     => 'root',
      group     => 'root',
      mode      => '600',
      content   => epp('create_user/sudo.epp', { 'title' => $title } ),
    }
}