#-----------------------------------------
#WebServer
#
#Build WebServer during Bootstrap
#
#Made by Valera Peshkur
#----------------------------------------

provider "aws" {}

resource "aws_instance" "my_webserver" {

  ami                     = "ami-0c947472aff72870d" #Amazon Linux AMI
  instance_type           = "t3.small"
  vpc_security_group_ids  = [aws_security_group.my_webserver.id]
  user_data               = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform!" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF

  tags    = {
    Name  = "Web Bootstrap"
    Owner = "Valera Peshkur"
  }

}

resource "aws_security_group" "my_webserver" {
  name              = "WebServer Security Group"

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"] 
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  tags    = {
    Name  = "Web Server Security Group"
    Owner = "Valera Peshkur"
  }
}