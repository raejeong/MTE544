# MTE544

# Install

Install docker

Install nvidia-docker

Clone this repo

```cd MTE544```

```mkdir src```

# Run
```sudo docker build . -t robotics_ws ```

```sudo nvidia-docker run -it --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v $(pwd)/src:/workspace --privileged --net=host --name mte544 mte544```

- to run additional terminal 

```sudo docker exec -it mte544 bash```

- for lazy, to kill all docker

```sudo docker stop $(sudo docker ps -aq); sudo docker rm $(sudo docker ps -aq)```
