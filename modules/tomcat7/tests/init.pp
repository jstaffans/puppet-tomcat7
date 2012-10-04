node default {

   tomcat7::webapp { "SimpleServlet":
      path => 'puppet:///modules/tomcat7/tests/SimpleServlet.war'
   }

   # repeat as desired for different servlets ...

}
