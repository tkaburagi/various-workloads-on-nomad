job "r2-ui-java" {
  datacenters = ["dc1"]

  type = "service"

  group "ui-java" {
    count = 1
    task "ui-java" {
      driver = "java"
      artifact {
        source = "https://jar-tkaburagi.s3-ap-northeast-1.amazonaws.com/nomad-snapshots-r2.jar"
      }
      config {
        jar_path    = "local/nomad-snapshots-r2.jar"
        jvm_options = ["-Xmx2048m", "-Xms256m"]
      }
      resources {
        cpu    = 500
        memory = 512
        network {
          port "http" {}
        }
      }
      env {
        "MYSQL_HOST" = "jdbc:mysql://127.0.0.1:3306/handson?useSSL=false"
      }
    }
  }
}
