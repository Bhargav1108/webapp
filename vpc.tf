resource "aws_vpc" "webapp_vpc"{

    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
}

# create subnets 

resource "aws_subnet" "subnet" {

    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.webapp_vpc.id
    map_public_ip_on_launch = true
  
}

# create security group 

resource "aws_security_group" "security_group" {

    name = "security_group"
    vpc_id = aws_vpc.webapp_vpc.id

    ingress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "HTTPS"
      from_port = 443
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = [] 
      self = false
      to_port = 443
    } ,
    {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "HTTP"
      from_port = 80
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = [] 
      self = false
      to_port = 80
    }
    ]

    egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "all outgoing traffic"
      from_port = 0
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = [ ]
      protocol = "-1"
      security_groups = [ ]
      self = false
      to_port = 0
    } ]



}