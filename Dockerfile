# Start with Ubuntu base image
FROM ubuntu:14.04
# nvidia-docker hooks
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}
# set up environment
ENV DEBIAN_FRONTEND noninteractive
# Install wget
RUN apt-get update && apt-get install -y wget
# Set up sources and keys
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
  apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
# Install ROS base with rosinstall
RUN apt-get update && apt-get install -y \
  ros-indigo-ros-base \
  python-rosinstall
# Initialise rosdep
RUN rosdep init && rosdep update
# Install gazebo
RUN apt-get install -y ros-indigo-turtlebot ros-indigo-turtlebot-apps ros-indigo-turtlebot-interactions ros-indigo-turtlebot-simulator ros-indigo-kobuki-ftdi ros-indigo-rocon-remocon ros-indigo-rocon-qt-library ros-indigo-ar-track-alvar-msgs
# Set up environment
RUN echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc

