#!/bin/bash

version=$1
cd /var/minecraft/spigot/${version}
java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot-${version}.jar --world-dir "worlds"
