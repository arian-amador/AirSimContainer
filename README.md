AirSim Container
================

A Linux container running Unity3D & AirSim.

*Note: nvidia-docker2 and cuda >= 10.0 is required to run this container.*

# Building the Unity3D Docker Container

Building the container will take a while.

*Note: This step is not required. A pre-built container is downloaded on the first run.*

```
$] git clone https://github.com/thomasquintana/AirSimContainer.git
$] sudo docker build -t thomasquintana/unity3d-airsim:latest AirSimContainer
```

# Running the Unity3D Docker Container

For a GUI Application to run, an XServer is needed which is not available inside the container.

In order to share the host's XServer with the container use the following flags.

 - --volume="$HOME/.Xauthority:/root/.Xauthority:rw"
 - --env="DISPLAY"

In order to share the host's network stack with the container use the following flag.
 - --net=host

```
$] sudo docker run --runtime=nvidia -i -t --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" thomasquintana/unity3d-airsim:latest
```
