job "r2-parameterized-toUpper" {
  datacenters = ["dc1"]

  type = "batch"

  parameterized {
    payload = "optional"
  }

  group "parameterized-toUpper" {
    count = 1
    task "toUpper" {
      driver = "raw_exec"
      config {
        command = "/Users/kabu/hashicorp/nomad/snapshots-r2-demo/func.sh"
      }
      dispatch_payload {
        file = "payload.txt"
      }
    }
  }
}
