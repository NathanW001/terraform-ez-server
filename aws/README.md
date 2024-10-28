# Terraform EZ Server: AWS

This is the subdirectory for hosting on Amazon Web Services. The hosting is done on a t2.micro EC2 instance, which is included in the free tier for 750hrs per month (this is enough to run a single EC2 instance for the whole month.) The EC2 instance also automaticaly uses an Elastic Block Storage, of which you have 30GB for free.

## How To Setup

First, run `terraform init` to do the initial setup with terraform.
From here, there is some configuring you must do. In `./config.tfvars`, there are several variables that you need to fill out, each with explaniations of how to fill them out. Of them, `region`, `access_key`, `secret_key`, `token` and `public_key` are required.
If you would like to have a script execute on startup of the machine, you can use the template at `./custom_script_template.sh` to modify and fit your needs. Then assign `custom_setup_script = "./custom_script_template.sh"`.

**IMPORTANT**: Do not forget to assign the proper ports in the config.tfvars file. If you host an application that takes HTTP requests, you need to have port 80 open, for example (`open_ports = {80: "tcp"}`). If you have issues accessing the hosted content this should be something you check is configured correctly.

Once those are filled out, you can check if everything is configured correctly by running `terraform plan -var-file="config.tfvars"`. It should display the resources that will be created.

If everything looks good, run `terraform apply -var-file="config.tfvars"`. This should create all the requested resources and return to you the instance ID, public IP and an SSH command to access the machine. (Note: with the ssh command you need to provide the path to the file in which the private key that was created earier was stored. If you have trouble passing in this file, you may need to switch the extension to be a .pem file)

If you are done using the machine, run `terraform destroy -var-file="config.tfvars"` to remove all of the resources.