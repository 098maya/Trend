provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "trend_app" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 20.04 for ap-south-1
  instance_type = "t2.micro"
  key_name      = "your-key-name"

  tags = {
    Name = "TrendAppServer"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install docker.io -y",
      "sudo systemctl start docker"
    ]
  }
}

