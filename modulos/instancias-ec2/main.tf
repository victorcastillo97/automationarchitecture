
resource "aws_instance" "servidor" {
    ami = var.ami_id
    for_each            = var.servidores
    instance_type          = var.tipo_instancia
    subnet_id = each.value.subnet_id
    
    vpc_security_group_ids = [aws_security_group.mi_grupo_de_seguridad.id]

    // Escribimos un "here document" que es
    // usado durante la inicialización
    user_data = <<-EOF
                #!/bin/bash
                echo "Hola Terraformers! ${each.value.nombre}" > index.html
                nohup busybox httpd -f -p ${var.puerto_servidor} &
                EOF

    tags = {
        Name = each.value.nombre
    }
}

# ------------------------------------------------------
# Define un grupo de seguridad con acceso al puerto 8080
# ------------------------------------------------------
resource "aws_security_group" "mi_grupo_de_seguridad" {
  name = "primer-servidor-sg"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description     = "Acceso al puerto 8080 desde el exterior"
    from_port       = var.puerto_servidor
    to_port         = var.puerto_servidor
    protocol        = "TCP"
  }
}
