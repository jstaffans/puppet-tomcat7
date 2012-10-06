# This file is used by the cloud-init magic.
node default {

   class { 'tomcat7':
      jre => 'openjdk-7',
   }

   # Put your wars into the files directory.  Works with small wars only due
   # to the user-data size limitation.
   #tomcat7::webapp { "ROOT":
   #   path => '/var/cache/cloud/puppet/site/files/example.war'
   #}

}
