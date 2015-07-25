# 

Brocade vTM (Formerly Riverbed SteelApp / Stingray )
----------------------------------------------------------------------

This is a container for the Brocade Virtual Traffic Manager. 

http://www.brocade.com/en/products-services/application-delivery-controllers.html


This container is supplied without a license key and will run in developer mode out of the box. You can run with: 

    $ docker run -e ZEUS_EULA=accept --privileged -t -d brocade-vtm

You must set ZEUS_EULA=accept to indicate that you accept the license agreement, otherwise the software will not start. You may also specify a License file to download over HTTP using ZEUS_LIC, and a password using ZEUS_PASS. Eg:

    $ docker run -e ZEUS_EULA=accept -e ZEUS_LIC=http://10.1.1.1/fla.lic ZEUS_PASS=t3llNo0n3 --privileged -t -d brocade-vtm

If you don't specify a ZEUS_PASS or you set ZEUS_PASS=RANDOM, then a password will be randomly generated for you. The password is printed to the console after start up.

#

Usage with Brocade Service Director (Formerly SSC)
----------------------------------------------------------------------

The docker instance needs a FQDN in order for the SSC to license it. You can either provide the container a fully qualified name at launch using -h, or you can specify the domain in an environment variable called ZEUS_DOM. 

    $ docker run -e ZEUS_EULA=accept -e ZEUS_LIC=http://10.1.1.1/fla.lic ZEUS_PASS=t3llNo0n3 -e ZEUS_DOM=demo.local --privileged -t -d brocade-vtm

If you use ZEUS_DOM it will override the domain part of the host name set by docker . However, the run script can not update /etc/hosts, so you must ensure that the FQDN is resolvable by the container. 

#

Accessing the Instance
-------------------------------

Once started, point your web browser at port 9090 to access the web interface, or your rest client at port 9070.

#

Building a docker image
-----------------------

    cd <docker folder>
    docker build -t <tag> .

