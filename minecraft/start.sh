#!/bin/sh

echo eula=true > eula.txt
echo "By using this Dockerfile, you agree to the Minecraft EULA."

java $@ -jar ../server.jar

