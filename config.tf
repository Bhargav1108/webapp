
terraform {

  required_version = ">=0.13"
  
  required_providers{
      aws ={
        source = "hashicorp/aws"
      }
  }

}

provider "aws" {
   
   region = "us-east-1"
   access_key = "AKIAQHUP7G63FNTAI7FH"
   secret_key = "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"
}
