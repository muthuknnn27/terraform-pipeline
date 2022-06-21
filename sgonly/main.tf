terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0" 
      }
    }  
}

provider "aws" {
  region     = "ap-south-1"
}


resource "aws_cloudformation_stack" "ec2-depends-on-sg-stack" {
  name = "ec2-depends-on-sg-stack"
  template_body = <<STACK
{
  "Resources" : {
    "InstanceSecurityGroup": {
      "Type" : "AWS::EC2::SecurityGroup",
      "Properties" : {
        "GroupDescription" : "Allow all traffic",
        "SecurityGroupIngress" : [{
            "IpProtocol" : "-1",
            "CidrIp" : "0.0.0.0/0"
        }],
        "SecurityGroupEgress" : [{
            "IpProtocol" : "-1",
            "CidrIp" : "0.0.0.0/0"
        }],
        "VpcId" : "vpc-35ab7d5e"
      }
    }
  }
}
STACK
}