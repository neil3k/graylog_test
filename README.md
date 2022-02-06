# Graylog_test 

This is the readme file for my Graylog test. The solution comprises the following components

VPC  
Internet Gateway  
Route table  
2 x Subnets  
S3 Bucket  
Application load balancer.  
Autoscaling Group containing a launch configuration and an attachment to the Application Load balancer.  

Also, in this repository you will find a file called findip.sh. If you run this it will run a script that 
will output the public ip address of the instances in the autoscaling group.

e.g.  

❯ ./findip.sh
"35.178.7.234"
"18.170.40.130"

If you then paste either of these ip addresses into a browser you will recieve the Hello Graylog message.

All of the terraform code has been grouped into reusable modules and have been written to ensure mexiumum readability.
I have also made use of terraform fmt to ensure the code is easy to read and maintanable.

Each EC2 instance also comes enabled with SSM allowing you to quickly connect to them without use of SSH keys and putty.

The EC2 web instances running are encapsulated in an ASG for High availability. These are all running Aoache as the
webservice.

In order to run this Code on your PC/MAC you will need to have terraform installed.

https://learn.hashicorp.com/tutorials/terraform/install-cli



