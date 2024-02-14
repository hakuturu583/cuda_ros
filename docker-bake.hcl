group "default" {
  targets = [
    "humble",
    "iron",
    "rolling",
    "l4t-humble-devel",
    "l4t-humble-runtime",
    "l4t-iron-devel",
    "l4t-iron-runtime",
    "l4t-rolling-devel",
    "l4t-rolling-runtime"]
}

target "base" {
  target = "build-stage"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64/v8"]
}

locals = {
  # ubuntu22_02_cuda_version = ["12.2.0", "12.1.1", "12.1.0", "12.0.1", "12.0.0", "11.8.0", "11.7.1"]
  ubuntu22_02_cuda_version = ["12.2.0", "11.8.0"]
  cuda_distro = ["devel", "runtime", "base"]
  l4t_base_devel = "nvcr.io/nvidia/l4t-tensorrt:r8.6.2-devel"
  l4t_base_runtime = "nvcr.io/nvidia/l4t-tensorrt:r8.6.2-runtime"
}

target "humble" {
  inherits = ["base"]
  matrix = {
    cuda_version = "${locals.ubuntu22_02_cuda_version}"
    cuda_distro = "${locals.cuda_distro}"
  }
  name = replace("humble-${cuda_version}-${cuda_distro}", ".", "_")
  tags = ["docker.io/hakuturu583/cuda_ros:humble-cuda-${cuda_version}-${cuda_distro}"]
  args = {
    "BASE_IMAGE" : "nvidia/cuda:${cuda_version}-${cuda_distro}-ubuntu22.04"
    "ROS_DISTRO" : "humble"
  }
  group = ["humble"]
}

target "iron" {
  inherits = ["base"]
  matrix = {
    cuda_version = "${locals.ubuntu22_02_cuda_version}"
    cuda_distro = "${locals.cuda_distro}"
  }
  name = replace("iron-${cuda_version}-${cuda_distro}", ".", "_")
  tags = ["docker.io/hakuturu583/cuda_ros:iron-cuda-${cuda_version}-${cuda_distro}"]
  args = {
    "BASE_IMAGE" : "nvidia/cuda:${cuda_version}-${cuda_distro}-ubuntu22.04"
    "ROS_DISTRO" : "iron"
  }
  group = ["iron"]
}

target "rolling" {
  inherits = ["base"]
  matrix = {
    cuda_version = "${locals.ubuntu22_02_cuda_version}"
    cuda_distro = "${locals.cuda_distro}"
  }
  name = replace("rolling-${cuda_version}-${cuda_distro}", ".", "_")
  tags = ["docker.io/hakuturu583/cuda_ros:rolling-cuda-${cuda_version}-${cuda_distro}"]
  args = {
    "BASE_IMAGE" : "nvidia/cuda:${cuda_version}-${cuda_distro}-ubuntu22.04"
    "ROS_DISTRO" : "rolling"
  }
  group = ["rolling"]
}

target "l4t-base" {
  inherits = ["base"]
  platforms = ["linux/arm64/v8"]
}

target "l4t-humble-devel" {
  inherits = ["l4t-base"]
  matrix = {}
  name = "l4t-humble-12_2_2-devel"
  tags = ["docker.io/hakuturu583/cuda_ros:lt4-humble-cuda-tensorrt-12.2.12-devel"]
  args = {
    "BASE_IMAGE" : "${locals.l4t_base_devel}"
    "ROS_DISTRO" : "humble"
  }
  group = ["l4t-humble"]
}

target "l4t-humble-runtime" {
  inherits = ["l4t-base"]
  matrix = {}
  name = "l4t-humble-12_2_12-runtime"
  tags = ["docker.io/hakuturu583/cuda_ros:lt4-humble-cuda-tensorrt-12.2.12-runtime"]
  args = {
    "BASE_IMAGE" : "${locals.l4t_base_runtime}"
    "ROS_DISTRO" : "humble"
  }
  group = ["l4t-humble"]
}

target "l4t-iron-devel" {
  inherits = ["l4t-base"]
  matrix = {}
  name = "l4t-iron-12_2_2-devel"
  tags = ["docker.io/hakuturu583/cuda_ros:lt4-iron-cuda-tensorrt-12.2.12-devel"]
  args = {
    "BASE_IMAGE" : "${locals.l4t_base_devel}"
    "ROS_DISTRO" : "iron"
  }
  group = ["l4t-iron"]
}

target "l4t-iron-runtime" {
  inherits = ["l4t-base"]
  matrix = {}
  name = "l4t-iron-12_2_12-runtime"
  tags = ["docker.io/hakuturu583/cuda_ros:lt4-iron-cuda-tensorrt-12.2.12-runtime"]
  args = {
    "BASE_IMAGE" : "${locals.l4t_base_runtime}"
    "ROS_DISTRO" : "iron"
  }
  group = ["l4t-iron"]
}

target "l4t-rolling-devel" {
  inherits = ["l4t-base"]
  matrix = {}
  name = "l4t-rolling-12_2_2-devel"
  tags = ["docker.io/hakuturu583/cuda_ros:lt4-rolling-cuda-tensorrt-12.2.12-devel"]
  args = {
    "BASE_IMAGE" : "${locals.l4t_base_devel}"
    "ROS_DISTRO" : "rolling"
  }
  group = ["l4t-rolling"]
}

target "l4t-rolling-runtime" {
  inherits = ["l4t-base"]
  matrix = {}
  name = "l4t-rolling-12_2_12-runtime"
  tags = ["docker.io/hakuturu583/cuda_ros:lt4-rolling-cuda-tensorrt-12.2.12-runtime"]
  args = {
    "BASE_IMAGE" : "${locals.l4t_base_runtime}"
    "ROS_DISTRO" : "rolling"
  }
  group = ["l4t-rolling"]
}
