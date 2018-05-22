# docker_fastai

Run a docker container with GPU support on Amazon EC2. Ships with fastai kernel and repository. This repository contains scripts to setup the EC2 instance and to create the docker container. This is not for beginners. Some knowledge of AWS and Docker is required.

## Step 1 Setup your EC2 Instance

Launch a p2.xlarge instance with Deep Learning Base AMI (Ubuntu) Version 5.0 (ami-4580a7ae)

Use the setup.sh bash script to setup Docker and Nvidia-Docker on the EC2 instance. 

## (Optional)

start a TMUX server.  `tmux new -s tmuxsession01`


## Step 2 Setup the Docker Container

SSH into your instance and run the nvidia-docker container:

`nvidia-docker run --name fastai -it -p 8888:8888 rutgerhofste/docker_fastai:ec2v02 bash`

Add `sudo` to this command if your user has insufficient permissions. You can change this [here](https://docs.docker.com/install/linux/linux-postinstall/).


## Step 3 Setup the Jupyter Notebook

### Step 3.1  
Create Credentials
`openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /.keys/mykey.key -out /.keys/mycert.pem`

Fill out the forms. It does not matter how you fill them out since you will likely trust your own certificate, don't you?


### Step 3.2 
Launch the Jupyter Notebook

`jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --certfile=/.keys/mycert.pem --keyfile=/.keys/mykey.key --notebook-dir= /volumes/repos/fastai/ --config=/volumes/repos/docker_fastai/jupyter_notebook_config.py`



