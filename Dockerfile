FROM centos

RUN yum install -y java-1.8.0-openjdk \
 && adduser minecraft

WORKDIR /home/minecraft

RUN mkdir minecraft_server \
 && curl https://www.minecraft.net/en-us/download/server/ | egrep -o "https:\/\/launcher.mojang.com\/v1\/objects\/[a-z0-9]+\/server.jar" | xargs curl -O \
 && echo "eula=true" > ./minecraft_server/eula.txt \
 && chown minecraft:minecraft ./minecraft_server

WORKDIR /home/minecraft/minecraft_server

USER minecraft

CMD java -jar -Xms1G -Xmx1G ../server.jar nogui
