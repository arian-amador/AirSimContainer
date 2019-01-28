AirSim Container
================

A Linux container running Unity3D & AirSim.

# Building the Unity3D Docker Container

Building the container will take a while.

*Note: This step is not required. A pre-built container is downloaded on the first run.*

```
$] git clone https://github.com/thomasquintana/AirSimContainer.git
$] sudo docker build -t thomasquintana/unity3d-airsim:latest AirSimContainer
```

# Running the Unity3D Docker Container

For a GUI Application to run, an XServer is needed which is not available inside the container.

In order to share the hosts XServer with the container use the following flags.
--volume="$HOME/.Xauthority:/root/.Xauthority:rw"
--env="DISPLAY"

In order to share the hosts network stack with the container use the following flag.
--net=host

```
$] sudo docker run -i -i --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" thomasquintana/unity3d-airsim:latest
```
