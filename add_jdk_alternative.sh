#!/bin/bash
# You can get any rpm or tarball for JDK from Oracle
# Then you can add the contents to the alternatives by tweaking this script a little
# Note that this is just for JDK not JRE!
VER=1.8.0_131

# use sudo update-alternatives --remove javac /usr/java/jdkx.y.z_w to remove an alternative

# zip the man files
for manfile in /usr/java/jdk${VER}/man/man1/*.1
do
	sudo gzip $(readlink -f ${manfile})
done

# add all the related files one by one
sudo /usr/sbin/update-alternatives --install /usr/bin/javac javac /usr/java/jdk${VER}/bin/javac 3 \
	--slave /usr/bin/appletviewer appletviewer /usr/java/jdk${VER}/bin/appletviewer \
	--slave /usr/share/man/man1/appletviewer.1.gz appletviewer.1.gz /usr/java/jdk${VER}/man/man1/appletviewer.1.gz \
	--slave /usr/bin/extcheck extcheck /usr/java/jdk${VER}/bin/extcheck \
	--slave /usr/share/man/man1/extcheck.1.gz extcheck.1.gz /usr/java/jdk${VER}/man/man1/extcheck.1.gz \
	--slave /usr/bin/jar jar /usr/java/jdk${VER}/bin/jar \
	--slave /usr/share/man/man1/jar.1.gz jar.1.gz /usr/java/jdk${VER}/man/man1/jar.1.gz \
	--slave /usr/bin/jarsigner jarsigner /usr/java/jdk${VER}/bin/jarsigner \
	--slave /usr/share/man/man1/jarsigner.1.gz jarsigner.1.gz /usr/java/jdk${VER}/man/man1/jarsigner.1.gz \
	--slave /usr/lib64/jvm/java java_sdk /usr/java/jdk${VER} \
	--slave /usr/share/man/man1/javac.1.gz javac.1.gz /usr/java/jdk${VER}/man/man1/javac.1.gz \
	--slave /usr/bin/javadoc javadoc /usr/java/jdk${VER}/bin/javadoc \
	--slave /usr/share/man/man1/javadoc.1.gz javadoc.1.gz /usr/java/jdk${VER}/man/man1/javadoc.1.gz \
	--slave /usr/bin/javah javah /usr/java/jdk${VER}/bin/javah \
	--slave /usr/share/man/man1/javah.1.gz javah.1.gz /usr/java/jdk${VER}/man/man1/javah.1.gz \
	--slave /usr/bin/javap javap /usr/java/jdk${VER}/bin/javap \
	--slave /usr/share/man/man1/javap.1.gz javap.1.gz /usr/java/jdk${VER}/man/man1/javap.1.gz \
	--slave /usr/share/man/man1/jcmd.1.gz jcmd.1.gz /usr/java/jdk${VER}/man/man1/jcmd.1.gz \
	--slave /usr/bin/jconsole jconsole /usr/java/jdk${VER}/bin/jconsole \
	--slave /usr/share/man/man1/jconsole.1.gz jconsole.1.gz /usr/java/jdk${VER}/man/man1/jconsole.1.gz \
	--slave /usr/bin/jdb jdb /usr/java/jdk${VER}/bin/jdb \
	--slave /usr/share/man/man1/jdb.1.gz jdb.1.gz /usr/java/jdk${VER}/man/man1/jdb.1.gz \
	--slave /usr/bin/jhat jhat /usr/java/jdk${VER}/bin/jhat \
	--slave /usr/share/man/man1/jhat.1.gz jhat.1.gz /usr/java/jdk${VER}/man/man1/jhat.1.gz \
	--slave /usr/bin/jinfo jinfo /usr/java/jdk${VER}/bin/jinfo \
	--slave /usr/share/man/man1/jinfo.1.gz jinfo.1.gz /usr/java/jdk${VER}/man/man1/jinfo.1.gz \
	--slave /usr/bin/jmap jmap /usr/java/jdk${VER}/bin/jmap \
	--slave /usr/share/man/man1/jmap.1.gz jmap.1.gz /usr/java/jdk${VER}/man/man1/jmap.1.gz \
	--slave /usr/bin/jps jps /usr/java/jdk${VER}/bin/jps \
	--slave /usr/share/man/man1/jps.1.gz jps.1.gz /usr/java/jdk${VER}/man/man1/jps.1.gz \
	--slave /usr/bin/jrunscript jrunscript /usr/java/jdk${VER}/bin/jrunscript \
	--slave /usr/share/man/man1/jrunscript.1.gz jrunscript.1.gz /usr/java/jdk${VER}/man/man1/jrunscript.1.gz \
	--slave /usr/bin/jsadebugd jsadebugd /usr/java/jdk${VER}/bin/jsadebugd \
	--slave /usr/share/man/man1/jsadebugd.1.gz jsadebugd.1.gz /usr/java/jdk${VER}/man/man1/jsadebugd.1.gz \
	--slave /usr/bin/jstack jstack /usr/java/jdk${VER}/bin/jstack \
	--slave /usr/share/man/man1/jstack.1.gz jstack.1.gz /usr/java/jdk${VER}/man/man1/jstack.1.gz \
	--slave /usr/bin/jstat jstat /usr/java/jdk${VER}/bin/jstat \
	--slave /usr/share/man/man1/jstat.1.gz jstat.1.gz /usr/java/jdk${VER}/man/man1/jstat.1.gz \
	--slave /usr/bin/jstatd jstatd /usr/java/jdk${VER}/bin/jstatd \
	--slave /usr/share/man/man1/jstatd.1.gz jstatd.1.gz /usr/java/jdk${VER}/man/man1/jstatd.1.gz \
	--slave /usr/bin/native2ascii native2ascii /usr/java/jdk${VER}/bin/native2ascii \
	--slave /usr/share/man/man1/native2ascii.1.gz native2ascii.1.gz /usr/java/jdk${VER}/man/man1/native2ascii.1.gz \
	--slave /usr/bin/pack200 pack200 /usr/java/jdk${VER}/bin/pack200 \
	--slave /usr/share/man/man1/pack200.1.gz pack200.1.gz /usr/java/jdk${VER}/man/man1/pack200.1.gz \
	--slave /usr/bin/rmic rmic /usr/java/jdk${VER}/bin/rmic \
	--slave /usr/share/man/man1/rmic.1.gz rmic.1.gz /usr/java/jdk${VER}/man/man1/rmic.1.gz \
	--slave /usr/bin/schemagen schemagen /usr/java/jdk${VER}/bin/schemagen \
	--slave /usr/share/man/man1/schemagen.1.gz schemagen.1.gz /usr/java/jdk${VER}/man/man1/schemagen.1.gz \
	--slave /usr/bin/serialver serialver /usr/java/jdk${VER}/bin/serialver \
	--slave /usr/share/man/man1/serialver.1.gz serialver.1.gz /usr/java/jdk${VER}/man/man1/serialver.1.gz \
	--slave /usr/bin/unpack200 unpack200 /usr/java/jdk${VER}/bin/unpack200 \
	--slave /usr/share/man/man1/unpack200.1.gz unpack200.1.gz /usr/java/jdk${VER}/man/man1/unpack200.1.gz \
	--slave /usr/bin/wsgen wsgen /usr/java/jdk${VER}/bin/wsgen \
	--slave /usr/share/man/man1/wsgen.1.gz wsgen.1.gz /usr/java/jdk${VER}/man/man1/wsgen.1.gz \
	--slave /usr/bin/wsimport wsimport /usr/java/jdk${VER}/bin/wsimport \
	--slave /usr/share/man/man1/wsimport.1.gz wsimport.1.gz /usr/java/jdk${VER}/man/man1/wsimport.1.gz \
	--slave /usr/bin/xjc xjc /usr/java/jdk${VER}/bin/xjc \
	--slave /usr/share/man/man1/xjc.1.gz xjc.1.gz /usr/java/jdk${VER}/man/man1/xjc.1.gz && \
sudo /usr/sbin/update-alternatives --set javac /usr/java/jdk${VER}/bin/javac
