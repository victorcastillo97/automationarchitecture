# -------------------------
# Define el provider de AWS
# -------------------------
provider "aws" {
    region = local.region
}

locals {
  region = "eu-west-1"
  ami    = var.ubuntu_ami[local.region]
}

# -----------------------------------------------
# Data source que obtiene el id del AZ eu-west-1a
# -----------------------------------------------
data "aws_subnet" "public_subnet" {
    for_each = var.servidores
    availability_zone = "${local.region}${each.value.az}" 
}


module "servidores-ec2" {
  source =  "./modulos/instancias-ec2"

  puerto_servidor = 8080
  tipo_instancia = "t2.micro"
  ami_id = local.ami

  servidores = {
    for id_serv,datos in var.servidores : 
      id_serv => {
        nombre = datos.nombre,
        subnet_id = data.aws_subnet.public_subnet[id_serv].id
      }
  }
}

module "loadbalancer"{
  source = "./modulos/loadbalancer"
  subnet_ids = [for subnet in data.aws_subnet.public_subnet : subnet.id]
  instanci_ids = module.servidores-ec2.instancia_ids
  puerto_servidor = 8080
  puerto_lb = 8080
}