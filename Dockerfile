FROM phusion/baseimage:latest                                         
MAINTAINER Chris Nowicki <chris.nowicki@gmail.com>

RUN dpkg --add-architecture i386; apt-get update; apt-get dist-upgrade -y; apt-get install -y mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386 libsdl1.2debian binutils

# variablize this
RUN useradd -ms /bin/bash ut99server
# wget http://download.fileplanet.com/ftp1/action/unrealtournament/official/ut-server-436.tar.gz
# tar xzf ut-server-436.tar.gz
RUN su - ut99server -c "curl -O https://raw.githubusercontent.com/GameServerManagers/LinuxGSM/master/UnrealTournament99/ut99server"
# RUN curl -O https://raw.githubusercontent.com/GameServerManagers/LinuxGSM/master/UnrealTournament99/ut99server
RUN su - ut99server -c "chmod +x ut99server"
RUN su - ut99server -c "/bin/bash ut99server auto-install"