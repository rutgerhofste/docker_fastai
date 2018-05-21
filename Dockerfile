FROM rutgerhofste/docker_conda_jupyter:cuda9.0
MAINTAINER Rutger Hofste <rutger.hofste@wri.org>

# Install dependencies

RUN apt-get update && apt-get install -y \
  install \
  libsm6 \
  libxrender1 \
  libfontconfig1
