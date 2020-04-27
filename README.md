# Docker Image antonsurv/xcfem

This is an xcfem (https://github.com/xcfem/xc.git) docker image, built on Ubuntu 18.04 Linux System.

# Feature
You can run xcfem (https://github.com/xcfem/xc.git) or bash in the container.

# User Guidelines:
First, install docker on your platform. See https://docs.docker.com/install/

Then, Change directory (```cd```) to your working directory, where ```.py``` files are located

To run a ```.py``` file, type in your terminal:
```
docker run --rm -v $(pwd):/home/docker antonsurv/xcfem python xxxx.py
```
Note:

```--rm```: remove the container after execution finishes.

```-v```: mount your current directory (```pwd```) to ```/home/docker``` (the default working space)

```antonsurv/xcfem```: this image.

```python xxxx.py```: your command.


Now, please enjoy :)
