FROM jarvice/app-cuda-9.1:9.1-cudnn7-devel-ubuntu16.04
ENV ANACONDA=/opt/anaconda3
ENV CUDA_PATH=/usr/local/cuda
ENV PATH=${ANACONDA}/bin:${CUDA_PATH}/bin:$PATH
ENV LD_LIBRARY_PATH=${ANACONDA}/lib:${CUDA_PATH}/lib64:$LD_LIBRARY_PATH
ENV C_INCLUDE_PATH=${CUDA_PATH}/include

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    axel \
    imagemagick \
    libopencv-dev \
    python-opencv \
    build-essential \
    cmake \
    git \
    curl \
    ca-certificates \
    libjpeg-dev \
    libpng-dev \
    axel \
    zip \
    unzip \
    libsuitesparse-dev \
    swig

RUN wget --no-check-certificate https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -P /tmp
RUN bash /tmp/Anaconda3-5.0.1-Linux-x86_64.sh -b -p $ANACONDA
RUN rm -rf /tmp/Anaconda3-5.0.1-Linux-x86_64.sh

RUN conda config --set ssl_verify false

RUN conda install -y pytorch=0.4.1 torchvision cuda91 -c pytorch
RUN conda install -y -c anaconda pip 
RUN conda install -y -c menpo opencv3
RUN pip install scikit-umfpack
RUN pip install cupy-cuda91
RUN pip install pynvrtc
RUN conda install -y numpy=1.14.5 scipy
RUN pip install yacs