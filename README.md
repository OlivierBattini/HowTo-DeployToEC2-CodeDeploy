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
- Add a tag to the instance : `Key = Name, Value = TestApp`
- Configure security group to allow HTTP 80 and TCP 3000
- Select or create an SSH key pair (allows you to access instance console)
- Start the instance

## 3. Create a CodeDeploy Pipeline

In the **CodeDeploy Console** :

- Create an Application :
    - Name : `TestApp`
    - Compute platform : `EC2/On-premise`
- Create a Deployment Group :
    - Name : `TestAppGroup`
    - Role : `CodeDeployRole`
    - Type : `In-place`
    - Environment : `Amazon EC2 instances`
    - Tags : `Name` => `TestApp`
    - Deployment settings : `CodeDeployDefault.AllAtOnce`
    - Disable load balancer if you use only one EC2 instance
- Create a Pipeline :
    - Name : `TestAppPipeline`
    - Source provider : `GitHub v2`
    - Connection => Connect to GitHub and select repository and branch to deploy on push, naming connection `TestAppGitHubConnection`
    - Skip build stage
    - Add deploy stage : `AWS CodeDeploy` and select corresponding app name and deployment group
