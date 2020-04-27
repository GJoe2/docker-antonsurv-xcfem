# Docker Image antonsurv/xcfem

This is an xcfem (https://github.com/xcfem/xc.git) docker image, built on Ubuntu 18.04 Linux System.

# Feature
You can run xcfem (https://github.com/xcfem/xc.git) or bash in the container.

# User Guidelines:
First, install docker on your platform. See https://docs.docker.com/install/

Enter the docker environment:
run command ```docker run -it antonsurv/xcfem```

Example usage:
```
[antman@my-pc]$ docker run -it antonsurv/xcfem
root@d818fba1fb71:/# cd /home/docker/
root@d818fba1fb71:/home/docker# ls
build_xc
root@d818fba1fb71:/home/docker# git clone https://github.com/xcfem/xc_examples.git
Cloning into 'xc_examples'...
remote: Enumerating objects: 31, done.
remote: Counting objects: 100% (31/31), done.
remote: Compressing objects: 100% (27/27), done.
remote: Total 324 (delta 11), reused 16 (delta 4), pack-reused 293
Receiving objects: 100% (324/324), 3.83 MiB | 369.00 KiB/s, done.
Resolving deltas: 100% (186/186), done.
root@d818fba1fb71:/home/docker# ls
build_xc  xc_examples
root@d818fba1fb71:/home/docker# cd xc_examples/
root@d818fba1fb71:/home/docker/xc_examples# ls
LICENSE          XC_tutorial_003                           calculix_cantilever_example_2D_mitc9.py
README.md        calculix_cantilever_example_1D_beam2d.py  dxf_import
XC_tutorial_001  calculix_cantilever_example_1D_beam3d.py  fan_truss_example.py
XC_tutorial_002  calculix_cantilever_example_2D_mitc4.py   preprocessor_display_surfaces
root@d818fba1fb71:/home/docker/xc_examples# cd XC_tutorial_001
root@d818fba1fb71:/home/docker/xc_examples/XC_tutorial_001# ls
tutorial001_meshgen.py  tutorial001_truss_temp.pdf
root@d818fba1fb71:/home/docker/xc_examples/XC_tutorial_001# python tutorial001_meshgen.py 
N= -10079.9983066
```

# Future work:
Accessing host directory:

Change directory (```cd```) to your working directory, where ```.py``` files are located

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
