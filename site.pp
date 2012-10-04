node default {

   tomcat7::deployment { "SimpleServlet":
      path => './java_src/SimpleServlet.war'
   }

   # repeat as desired for different servlets ...

}
