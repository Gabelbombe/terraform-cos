
job "fabio" {
  datacenters = ["public-services"]

  type = "system"
  update {
    stagger = "5s"
    max_parallel = 1
  }
  group "fabio" {
    task "fabio" {
      driver = "exec"
      config {
        command = "fabio-1.5.8-go1.10-linux_amd64"
      }

      artifact {
        source = "https://github.com/eBay/fabio/releases/download/v1.5.8/fabio-1.5.8-go1.10-linux_amd64"
      }

      resources {
        cpu = 500
        memory = 128
        network {
          mbits = 1

          port "http" {
            static = 9999
          }
          port "ui" {
            static = 9998
          }
        }
      }
    }
  }
}