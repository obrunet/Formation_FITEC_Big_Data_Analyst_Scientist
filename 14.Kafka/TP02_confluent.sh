# change java version to 8 // choice 2
sudo update-alternatives --config java
  Sélection   Chemin                                          Priorité  État
------------------------------------------------------------
* 0            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1111      mode automatique
  1            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1111      mode manuel
  2            /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java   1081      mode manuel

# start confluent
~/confluent-5.1.2/bin$ ./confluent start

# connect to localhost
http://localhost:9021/


