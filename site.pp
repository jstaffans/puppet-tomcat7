node default {

   tomcat7::webapp { "SimpleServlet":
      path => './java_src/SimpleServlet.war'
   }

   # repeat as desired for different servlets ...

}
