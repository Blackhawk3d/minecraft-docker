FROM centos

RUN yum install -y java-1.8.0-openjdk \
 && adduser minecraft \
 && mkdir /server \
 && mkdir /data

WORKDIR /server

RUN curl https://www.minecraft.net/en-us/download/server/ | egrep -o "https:\/\/launcher.mojang.com\/v1\/objects\/[a-z0-9]+\/server.jar" | xargs curl -O \
 && ln -s /server/server.jar /data/server.jar \
 && echo "eula=true" > /data/eula.txt \
 && mkdir /data/world \
 && chown -R minecraft:minecraft /data

USER minecraft

WORKDIR /data

CMD java -jar -Xms1G -Xmx1G ./server.jar nogui
