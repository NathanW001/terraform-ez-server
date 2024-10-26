// Variables that need user definitions

// Available Regions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html#Concepts.RegionsAndAvailabilityZones.Regions
region = null

// AWS Keys: https://repost.aws/knowledge-center/create-access-key
access_key = null
secret_key = null
token      = null

// SSH Key: run "ssh-keygen -t rsa -b 4096 -f ./terraform-ez-server-key\" and use the .pub key, read more: https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key
public_key = null


// EC2 Setup:
// GitHub Repo URL (Optional): The repo to clone and run using Docker upon creation of the EC2 instance. Must have a Dockerfile.
github_url = null

// script
custom_setup_script = null

// set, map of inbound {port num -> protocol}, -1 = all protocols. For example, open_ports = {443: "tcp", 123: "udp", }
open_ports = null
