FROM ubuntu:20.04
MAINTAINER gjoe
ENV TAG v.1.1
ENV DEBIAN_FRONTEND=noniteractive
RUN apt-get update && apt-get install -y sudo wget bash cmake make git gcc g++ gfortran libboost-all-dev && \
useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo && \

cd /home/docker && \

apt-get install -y libarpack2-dev libarpack++2-dev libcgal-dev libdb-dev libf2c2-dev libglib2.0-dev libgmp3-dev libgtk2.0-dev libgtkgl2.0-dev libgtkglextmm-x11-1.2-dev libgtkmm-2.4-dev libgts-bin libgts-dev liblapack-dev libmpfr-dev libmysql++-dev libplot-dev libsqlite3-dev libsuperlu-dev libsuitesparse-dev libvtk6-dev libx11-dev libmetis-dev && \
apt-get install -y cimg-dev petsc-dev tcl-dev && \
apt-get install -y python3-vtk7 python3-scipy python3-sympy python3-matplotlib python3-pandas python3-sklearn python3-pip && \
apt-get install -y gnuplot bc && \
apt-get clean && \

pip install mayavi ezdxf dxfwrite pycairo && \

rm -rf build_xc && \
mkdir build_xc && \
cd build_xc && \
base_dir=`pwd`&& \

# clone xc_utils and XC
cd $base_dir && \
git clone https://github.com/xcfem/xc_utils/ xc_utils && \
git clone https://github.com/xcfem/xc/ xc && \

# build xc_utils
cd $base_dir && \
mkdir build-xc_utils && \
cd build-xc_utils && \
cmake ../xc_utils/src && \
make -j 2 && \
make install && \
cd $base_dir/xc_utils/python_modules  && \
bash ./local_install.sh && \

# build  XC
cd $base_dir && \
mkdir build-xc && \
cd build-xc && \
cmake ../xc/src && \
make -j 2 && \
make install && \
cd $base_dir/xc/python_modules && \
bash ./local_install.sh && \

# run unit tests
cd $base_dir/xc_utils/verif && \
bash ./run_verif.sh && \

cd $base_dir/xc/verif && \
bash ./run_verif.sh && \

cd /home/docker

#USER docker
#WORKDIR /home/docker
#ENV HOME /home/docker
VOLUME ["/home/docker"]
#ENTRYPOINT ["python"]
CMD ["bin/bash"]

 
