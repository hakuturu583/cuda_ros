# What is it?
CUDA friendly docker image for ROS 2.  
Docker Images are currently available on [dockerhub](https://hub.docker.com/r/hakuturu583/cuda_ros/tags).  

# Support status

All images support `linux/amd64` and `linux/arm64/v8` platform

## Table for rosdistro and OS

| rosdistro | OS           |
|-----------|--------------|
| iron      | ubuntu 22.04 |
| humble    | ubuntu 22.04 |
| rolling   | ubuntu 22.04 |

## Table for OS and cuda

| OS           | cuda   |
|--------------|--------|
| ubuntu 22.04 | 12.2.0 |
| ubuntu 22.04 | 12.1.1 |
| ubuntu 22.04 | 12.1.0 |
| ubuntu 22.04 | 12.0.1 |
| ubuntu 22.04 | 12.2.0 |
| ubuntu 22.04 | 12.2.0 |

## How to use?

```
docker buildx bake -f docker-bake.hcl
```
