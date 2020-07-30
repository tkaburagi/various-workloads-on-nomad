job "r2-api-go" {
  datacenters = ["dc1"]

  type = "service"

  group "front-api-go" {
    count = 1
    task "front-api.go" {
      driver = "raw_exec"
      config {
        command = "/usr/local/bin/go"
        args = [
          "run",
        "/Users/kabu/hashicorp/nomad/snapshots-r2-demo/front-api.go"]
      }
    }
  }
}
