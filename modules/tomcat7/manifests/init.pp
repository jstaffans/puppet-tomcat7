class tomcat7 {

  $tomcat7_port = 735
  $tomcat7_password = 'badwolf' 
  
  notice("Establishing http://$hostname:$tomcat7_port/")

  Package { # defaults
    ensure => installed,
  }

  package { 'tomcat7':
  }

  package { 'tomcat7-user':
    require => Package['tomcat7'],
  }
 
  package { 'tomcat7-admin':
    require => Package['tomcat7'],
  }

  file { "/etc/tomcat7/tomcat-users.xml":
    owner => 'root',
    require => Package['tomcat7'],
    notify => Service['tomcat7'],
    content => template('tomcat7/tomcat-users.xml.erb')
  }

  file { '/etc/tomcat7/server.xml':
     owner => 'root',
     require => Package['tomcat7'],
     notify => Service['tomcat7'],
     content => template('tomcat7/server.xml.erb'),
  }

  service { 'tomcat7':
    ensure => running,
    require => Package['tomcat7'],
  }   

}

define tomcat7::deployment($path) {

  include tomcat7
  notice("Establishing http://$hostname:${tomcat7::tomcat7_port}/$name/")

  file { "/var/lib/tomcat7/webapps/${name}.war":
    owner => 'root',
    source => $path,
  }

}

