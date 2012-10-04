class tomcat7 (
    $enable = true,
    $ensure = running,
    $http_port = 8080,
    $https_port = 8443,
    $jre = 'default',
    $install_admin = true,
) {
  $jre_package = "${jre}-jre-headless"

  package { 'tomcat7':
    ensure => installed,
    require => [
      Package[$jre_package],
      Package['authbind'],
      Package['libtcnative'],
    ],
  }

  if ($install_admin) {
    package { 'tomcat7-admin':
      ensure => installed,
      require => Package['tomcat7'],
    }
  }

  package { $jre_package:
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
