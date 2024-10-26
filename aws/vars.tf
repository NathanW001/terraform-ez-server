variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = null

  validation {
    condition     = contains(["us-east-1", "us-east-2", "us-west-1", "us-west-2", "af-south-1", "ap-east-1", "ap-southeast-3", "ap-southeast-5", "ap-southeast-4", "ap-south-1", "ap-northeast-3", "ap-northeast-2", "ap-southeast-1", "ap-southeast-2", "ap-northeast-1", "ca-central-1", "ca-west-1", "eu-central-1", "eu-west-1", "us-east-1", "eu-west-2", "eu-south-1", "eu-west-3", "eu-south-2", "eu-north-1", "eu-central-2", "il-central-1", "me-south-1", "me-central-1", "sa-east-1"], var.region)
    error_message = "Please enter a valid AWS region in the config.tfvars file. Valid regions can be found here: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html#Concepts.RegionsAndAvailabilityZones.Regions"
  }
}

variable "access_key" {
  type      = string
  default   = null
  sensitive = true

  validation {
    condition     = (var.access_key != null)
    error_message = "Please assign your access key to the access_key variable in config.tfvars. You can read more about making access keys here: https://repost.aws/knowledge-center/create-access-key"
  }
}

variable "secret_key" {
  type      = string
  default   = null
  sensitive = true

  validation {
    condition     = (var.secret_key != null)
    error_message = "Please assign your secret access key to the secret_key variable in config.tfvars. You can read more about making access keys here: https://repost.aws/knowledge-center/create-access-key"
  }
}

variable "token" {
  type      = string
  default   = null
  sensitive = true

  validation {
    condition     = (var.token != null)
    error_message = "Please assign your security token to the token variable in config.tfvars. You can read more about making access keys here: https://repost.aws/knowledge-center/create-access-key"
  }
}

variable "public_key" {
  type    = string
  default = null

  validation {
    condition     = (var.public_key != null)
    error_message = "Please assign your SSH public key to the public_key variable in config.tfvars. To quickly generate a key pair, simply use \"ssh-keygen -t rsa -b 4096 -f ./terraform-ez-server-key\" if you have Git installed. You can read more about keys here https://en.wikipedia.org/wiki/Key_exchange and how they are generated here https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key., "
  }
}

variable "open_ports" {
  type = map(string)
  default = null

  validation {
    condition = (alltrue([for value in values(var.open_ports) : value == "tcp" || value == "udp" || value == "-1"]) &&
                 alltrue([for key in keys(var.open_ports): can(tonumber(key)) &&
                                                     (tonumber(key) >= 0 && 
                                                      tonumber(key) <= 65535 &&
                                                      tonumber(key) != 22)])) // explicitly disallow ssh port, it will already be open
    error_message = "One or more user defined inbound ports is malformed, please ensure that they are all correct. Please don't use port 22 if you have, SSH is automatically configured"
  }
}