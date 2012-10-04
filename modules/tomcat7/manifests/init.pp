class tomcat7 ($enable = true, $ensure = running) {

  $http_port = 8080
  $https_port = 8443
  
  Package { # defaults
    ensure => installed,
  }

  package { 'tomcat7':
    require => [
      Package['authbind'],
      Package['libtcnative'],
    ],
  }

  package { 'tomcat7-admin':
    require => Package['tomcat7'],
  }

  package { 'libtcnative':
    name => 'libtcnative-1',
  }

  package { 'authbind':
  }

  file { '/etc/tomcat7/server.xml':
     owner => 'root',
     require => Package['tomcat7'],
     notify => Service['tomcat7'],
     content => template('tomcat7/server.xml.erb'),
  }

  service { 'tomcat7':
    ensure => $ensure,
    enable => $enable,
    require => Package['tomcat7'],
  }   

}
