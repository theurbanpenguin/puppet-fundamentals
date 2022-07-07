notify { 'Print fact':
  message => "This is a ${::facts['os']['family']} based system"
}