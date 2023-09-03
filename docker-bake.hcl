group "default" {
  targets = ["iron", "humble", "rolling"]
}

target "base" {
  target = "build-stage"
  dockerfile = "Dockerfile.builder"
  tags = ["docker.io/wamvtan/ros2_pkg_builder:latest"]
  args = {
    "ROS_DISTRO" : "latest"
  }
  platforms = ["linux/amd64", "linux/arm64/v8"]
}


