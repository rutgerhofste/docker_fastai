# docker_fastai

Run a docker container with GPU support on Amazon EC2. This repository contains scripts to setup the EC2 instance and to create the docker container. This is not for beginners. Advanced knowledge of AWS and Docker is assumed.

## Step 1 Setup your EC2 Instance

Launch a p2.xlarge instance with Deep Learning Base AMI (Ubuntu) Version 5.0 (ami-4580a7ae)

Use the setup.sh bash script to setup Docker and Nvidia-Docker on the EC2 instance. 


## Step 2 Setup the Docker Container

SSH into your instance and run the nvidia-docker container:

`nvidia-docker run -it -p 8888:8888 rutgerhofste/docker_conda_jupyter:cuda9.0 bash`

## Step 3 Setup the Jupyter Notebook

### Step 3.1  
Create Credential

### Step 3.2 
Launch the Jupyter Notebook

`jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --certfile=/.keys/mycert.pem --keyfile=/.keys/mykey.key --notebook-dir= /volumes/repos/fastai/ --config=/volumes/repos/docker_fastai/jupyter_notebook_config.py`


## TODO:  
allow TMUX support

