FROM rutgerhofste/docker_conda_jupyter:cuda9.0
MAINTAINER Rutger Hofste <rutger.hofste@wri.org>

# Install dependencies

RUN apt-get update && apt-get install -y \
  libsm6 \
  libxrender1 \
  libfontconfig1

RUN git clone https://github.com/fastai/fastai.git /volumes/repos/fastai
RUN conda env update -f /volumes/repos/fastai/environment.yml
RUN /opt/anaconda3/envs/fastai/bin/python -m ipykernel install --name fastai --display-name "fastai"

COPY jupyter_notebook_config.py .


