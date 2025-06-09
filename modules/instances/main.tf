# modules/instances/main.tf
resource "aws_key_pair" "mean_keypair" {
  key_name   = "mean-keypair"
  public_key = var.public_key_path == "" ? file("~/.ssh/id_rsa.pub") : file(var.public_key_path)
}

resource "aws_instance" "mongodb_instance" {
  ami                    = var.mongodb_ami
  instance_type          = var.instance_type
  subnet_id              = element(var.public_subnet_ids, 0)
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.mean_keypair.key_name

  tags = {
    Name = "mongodb-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install mongodb -y
              sudo systemctl start mongodb
              sudo systemctl enable mongodb
              EOF
}

resource "aws_instance" "nodejs_instance" {
  ami                    = var.nodejs_ami
  instance_type          = var.instance_type
  subnet_id              = element(var.public_subnet_ids, 1)
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.mean_keypair.key_name

  tags = {
    Name = "nodejs-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nodejs npm
              echo "Creando servidor Hola Mundo..."

              cat <<'EOT' > /home/ubuntu/app.js
              const http = require('http');
              const server = http.createServer((req, res) => {
                res.writeHead(200, {'Content-Type': 'text/plain'});
                res.end('Hola Mundo\\n');
              });
              server.listen(80, '0.0.0.0', () => {
                console.log('Servidor escuchando en puerto 80');
              });
              EOT

              node /home/ubuntu/app.js &
              EOF
}
#Generar clave ssh
#ssh-keygen -t rsa -b 4096 -C "lider.tecnico.dos@correounivalle.edu.co"
