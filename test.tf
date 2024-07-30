resource "aws_instance" "test" {
  ami = "ami-0862be96e41dcbf74"
  instance_type = "t2.medium"
  key_name = "praveen"
  vpc_security_group_ids = [ "sg-0e7783eb3e866cde2" ]
  tags = {
    Name = "test"
  }
  
provisioner "remote-exec" {
    inline = [
        "sudo apt-get update",
        "sudo apt-get upgrade -y",
        "sudo apt install python3-pip -y",
        "sudo apt install python3-venv -y",
        "sudo apt install python3-virtualenv -y",
        "python3 -m venv /home/ubuntu/eminem",
        ". /home/ubuntu/eminem/bin/activate",
        "git clone https://github.com/Praveenchinna14/teerdha20.git",
        "cd teerdha20",
        "sudo apt install libmysqlclient-dev -y",
        "sudo apt install pkg-config -y",
        "pip install -r requirements.txt",
        "pip install django",
        "pip install django-crsipy-forms",
        "pip install django-rest-framework",
        "pip install requests",
        "pip install pyscopg2-binary",
        "pip install wheel",
        "pip install pillow",
        "pip install easy-pil",
        "python /home/ubuntu/teerdha20/manage.py makemgrations",
        "python /home/ubuntu/teerdha20/manage.py migrate",
        "python /home/ubuntu/teerdha20/manage.py runserver 0.0.0.0:8000"     
    ]
    connection {
      type     = "ssh"
      user     = "ubuntu"  
      private_key = file("praveen.pem")  
      host     = self.public_ip  
    }
 }
}


