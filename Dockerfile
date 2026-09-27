FROM p4ndxn/microros-agent:latest
WORKDIR /microros_ws/src/

# Make sure all packages have the latest versions
RUN apt-get update && apt-get install -y --no-install-recommends python3-colcon-common-extensions

# add sourcing command to shell startup to avoid sourcing every time
RUN echo source /opt/ros/$ROS_DISTRO/setup.bash >> ~/.bashrc
RUN echo source /microros_ws/install/local_setup.bash >> ~/.bashrc

# add the src folder into the docker image
ADD src/ .

EXPOSE 8888/udp

