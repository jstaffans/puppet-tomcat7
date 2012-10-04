define tomcat7::webapp($path) {

  include tomcat7
  notice("Establishing http://$hostname:${tomcat7::tomcat7_port}/$name/")

  file { "/var/lib/tomcat7/webapps/${name}.war":
    owner => 'root',
    source => $path,
  }

}
