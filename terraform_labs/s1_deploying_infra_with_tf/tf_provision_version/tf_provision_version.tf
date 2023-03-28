terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}




# There is syntax for describing versions:
# >=1.0 - Greater than or equal to the version
# <=1.0 - Less than or equal to the version
# ~>2.0 - Any version in the 2.X range
# >=2.10, <=2.30 - Any version between 2.10 and 2.30
