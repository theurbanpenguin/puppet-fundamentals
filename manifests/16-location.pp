notify { 'Print custom fact':
  message => "This is a ${::facts['location']} based system"
}