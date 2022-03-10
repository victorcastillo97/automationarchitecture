variable "ubuntu_ami" {
  description = "AMI por region"
  type        = map(string)

  default = {
    eu-west-1 = "ami-0aef57767f5404a3c" # Ubuntu en Dublin
    us-west-2 = "ami-005383956f2e5fb96" # Ubuntu en London
  }
}


variable "servidores" {
    description = "Mapa de servidores"

    type = map(object({
        nombre = string,
        az = string
    })
    )

    default = {
      "ser-1" = {
        az = "a"
        nombre = "servidor-1"
      },
      "ser-2" = {
        az = "b"
        nombre = "servidor-2"
      }
      "ser-3" = {
        az = "c"
        nombre = "servidor-3"
      }
    }
}

