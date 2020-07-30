job "r2-periodic-backup" {
  datacenters = ["dc1"]
  type        = "batch"

  periodic {
    cron             = "*/20 * * * * * ?"
    prohibit_overlap = true
    time_zone        = "Asia/Tokyo"
  }

  group "periodic-backup" {
    count = 1
    task "periodic-backup" {
      driver = "raw_exec"
      config {
        command = "/Users/kabu/hashicorp/nomad/snapshots-r2-demo/dump-mysql.sh"
      }
    }
  }
}
