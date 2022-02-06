# Graylog_test 

This is the readme file for my Graylog test. The solution comprises the following components:

VPC  
Internet Gateway  
Route table  
2 x Subnets  
S3 Bucket  
Application load balancer  
Autoscaling Group containing a launch configuration and an attachment to the Application Load balancer    

In this repository you will find a file called findip.sh. If you run this it will run a script that 
will output the public ip address of the instances in the autoscaling group.

e.g.  

❯ ./findip.sh
"35.178.7.234"
"18.170.40.130"

If you then paste either of these ip addresses into a browser you will recieve the Hello Graylog message.

All of the terraform code has been grouped into reusable modules and have been written to ensure maxiumum readability.
I have also made use of terraform fmt to ensure the code is easy to read and maintainable.

Each EC2 instance also comes enabled with SSM allowing you to quickly connect to them without use of SSH keys and putty.

However, for ease of use the Instance key is being backed up to an S3 bucket.

The EC2 web instances running are encapsulated in an ASG for High availability. These are all running Apache as the
webservice.

In order to run this Code on your PC/MAC you will need to have terraform and the AWS CLI installed.

https://learn.hashicorp.com/tutorials/terraform/install-cli  
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html  

Then you will need to download this repository from my github.

Navigate to the terraform directory within the solution and run the following commands

terraform init  
terraform plan  
terraform apply  

This should then start creating the resources. If you dont have any AWS credentials configured on your computer you
will need to create an access key in your AWS account.

https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/

You can then configure this on your computer by running AWS configure.

