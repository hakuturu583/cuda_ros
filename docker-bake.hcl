group "default" {
  targets = ["humble", "iron", "rolling"]
}

target "base" {
  target = "build-stage"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64/v8"]
}

locals = {
  # ubuntu22_02_cuda_version = ["12.2.0", "12.1.1", "12.1.0", "12.0.1", "12.0.0", "11.8.0", "11.7.1"]
  ubuntu22_02_cuda_version = ["12.2.0"]
}

target "humble" {
  inherits = ["base"]
  matrix = {
    cuda_version = "${locals.ubuntu22_02_cuda_version}"
    cuda_distro = ["devel", "runtime", "base"]
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
    cuda_distro = ["devel", "runtime", "base"]
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
    cuda_distro = ["devel", "runtime", "base"]
  }
  name = replace("rolling-${cuda_version}-${cuda_distro}", ".", "_")
  tags = ["docker.io/hakuturu583/cuda_ros:rolling-cuda-${cuda_version}-${cuda_distro}"]
  args = {
    "BASE_IMAGE" : "nvidia/cuda:${cuda_version}-${cuda_distro}-ubuntu22.04"
    "ROS_DISTRO" : "rolling"
  }
  group = ["rolling"]
}
