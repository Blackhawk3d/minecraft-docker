FROM centos

RUN yum install -y java-1.8.0-openjdk \
 && adduser minecraft

USER minecraft

WORKDIR /home/minecraft

RUN mkdir minecraft_server \
 && cd minecraft_server \
 && curl https://minecraft.net/en-us/download/server/ | egrep -o "https:\/\/launcher.mojang.com\/v1\/objects\/[a-z0-9]+\/server.jar" | xargs curl -O \
 && echo "eula=true" > eula.txt \
 && mkdir world \
 && chown minecraft:minecraft world

WORKDIR /home/minecraft/minecraft_server

CMD java -jar -Xms1G -Xmx1G ./server.jar nogui
