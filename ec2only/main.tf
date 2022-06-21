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
    "Ec2Instance": {
      "Type" : "AWS::EC2::Instance",
      "Properties" : {
        "ImageId" : "ami-079b5e5b3971bd10d",
        "InstanceType" : "t2.micro"
      }      
    }
  }
}
STACK
}