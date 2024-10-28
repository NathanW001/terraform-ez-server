// Variables that need user definitions

// Available Regions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html#Concepts.RegionsAndAvailabilityZones.Regions
region = null

// AWS Keys: https://repost.aws/knowledge-center/create-access-key
access_key = null
secret_key = null
token      = null

// SSH Key: run "ssh-keygen -t rsa -b 4096 -f ./terraform-ez-server-key\" and use the .pub key, read more: https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key
public_key = null

// Filepath to the custom execution script used to provision and setup the instance, or null for the default setup. You can always SSH into the instance and set it up yourself after.
custom_setup_script = null

// A map of ports for inbound traffic and the protocol they use, following the format {port num -> protocol}, where -1 = all protocols. For example, open_ports = {443: "tcp", 123: "udp", 1000: "-1"}. Don't set this to null, if you want no public ports open (aside from 22 for ssh), leave it as {}. Dont forget to add any required ports, even things like HTTP requests need a port to be open.
open_ports = {}
