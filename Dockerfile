# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.18
MAINTAINER David West <david.b.west@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update

# install essential packages for building bitcoin
RUN apt-get install --yes \
  autoconf \ 
  autotools-dev \ 
	bsdmainutils \ 
	build-essential \ 
	gcc \ 
	git \ 
	libboost-all-dev \ 
	libssl-dev \ 
  libevent-dev \
	libtool \ 
  make \
	pkg-config \ 
	sudo \
  vim  

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose two rpc ports for the nodes to allow outside container access
EXPOSE 19001 19011
CMD ["/bin/bash"]