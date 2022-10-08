# About this project

This project is meant as a tutorial to learn using Continuous Deployment to Amazon EC2 from a GitHub repository.

# Steps

## 1. Create IAM roles in AWS Console

In the **IAM Console** :

- Create an IAM role for **EC2 use case**
    - Attach permission policy : AmazonEC2RoleforAWSCodeDeploy
    - Name the role : `EC2CodeDeployRole`
- Create an IAM role for **CodeDeploy use case**
    - Attach permission policy : AWSCodeDeployRole
    - Name the role : `CodeDeployRole`

## 2. Create an EC2 instance in AWS Console

In the **EC2 Console** :

- Select a Linux machine image
- Set IAM role to `EC2CodeDeployRole`
- Setup and set startup script contents from `scripts/install_codedeploy_agent.sh`
- Add a tag to the instance : `Key = Name, Value = App`
- Configure security group to allow HTTP 80 and TCP 3000
- Select or create an SSH key pair (allows you to access instance console)
- Start the instance

<<<<<<< HEAD

=======
>>>>>>> bc353b8 (FEATURE Added AWS CodeDeploy & Pipeline)
