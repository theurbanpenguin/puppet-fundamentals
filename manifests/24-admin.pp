define users::admin {
  $homedir = "/home/${title}"
  #Puppet Selector to popular group based on os family
  $group = $facts['os']['family'] ? {
      'RedHat' => 'wheel',
      'Debian' => 'sudo',
  }
  user { $title:
    ensure     => present,
    managehome => true,
    groups     => $group,
  }
  file { "${homedir}/.vimrc":
    ensure  => file,
    owner   => $title,
    group   => $title,
    mode    => '0600',
    content => "set bg=dark\n",
  }
}