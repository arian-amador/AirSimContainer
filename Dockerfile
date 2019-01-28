FROM nvidia/cuda:10.0-base

LABEL maintainer="quintana.thomas@gmail.com"

# Install Dependencies
RUN apt update
RUN apt install -y gconf-service \
                   git-core \
                   lib32gcc1 \
                   lib32stdc++6 \
                   libasound2 \
                   libboost-all-dev \
                   libc6-i386 \
                   libcairo2 \
                   libcap2 \
                   libcups2 \
                   libdbus-1-3 \
                   libfontconfig1 \
                   libgconf-2-4 \
                   libgdk-pixbuf2.0-0 \
                   libgl1 \
                   libgl1-mesa-glx \
                   libglu1 \
                   libgtk2.0-0 \
                   libnspr4 \
                   libnss3 \
                   libpango1.0-0 \
                   libpq5 \
                   libx11-6 \
                   libxcomposite1 \
                   libxcursor1 \
                   libxdamage1 \
                   libxext6 \
                   libxfixes3 \
                   libxi6 \
                   libxrandr2 \
                   libxrender1 \
                   libxtst6 \
                   lsb-release \
                   npm \
                   rsync \
                   sudo \
                   wget \
                   xdg-utils

# Install Unity Editor
WORKDIR /tmp
RUN wget http://beta.unity3d.com/download/fd37f3680b5f/unity-editor_amd64-2017.2.0b11.deb
RUN dpkg -i unity-editor_amd64-2017.2.0b11.deb
RUN rm unity-editor_amd64-2017.2.0b11.deb

# Install AirSim
WORKDIR /usr/src
RUN git clone https://github.com/arian-amador/AirSim.git
WORKDIR AirSim
RUN ./setup.sh && ./build.sh
WORKDIR Unity
RUN ./build.sh

# Set the working directiory to the root's home directory.
WORKDIR /root

# Start Unity3D
CMD /opt/Unity/Editor/Unity