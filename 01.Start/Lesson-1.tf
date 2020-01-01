provider "aws" {}

resource "aws_instance" "my_Ubuntu" {
	count = 0
	ami = "ami-1dab2163"
	instance_type = "t3.small"
  
  tags = {
    Owner = "Valera Peshkur"
    Name = "Linux_Ubuntu"
    Project = "Lesson_1"
  }
}

resource "aws_instance" "my_Amazon" {
  ami = "ami-6a1f9414"
  instance_type = "t3.small"


  tags = {
    Owner = "Valera Peshkur"
    Name = "Linux_Amazon"
    Project = "Lesson_1"
  }
}
