# About this project

This project is my learning journey in the world of **CI/CD** and **Cloud Computing**.

## Roadmap

- [ ] Add unit tests
- [x] Create simple application deploy to EC2
- [ ] Add GitHub action for test and 
- [x] Display of host name and simple stats (for identifying instances)
- [ ] Load balancer configuration for multiple instances
- [ ] 

# Steps

## 1. Create IAM roles in AWS Console

In the **IAM Console** :

| Select IAM role use case | Attach permission policy | Set role name |
| --- | --- | --- |
| EC2 use case | `AmazonEC2RoleforAWSCodeDeploy` | `ProjectName-EC2CodeDeployRole` |
| CodeDeploy use case | `AWSCodeDeployRole` | `ProjectName-CodeDeployRole` |

## 2. Create an EC2 instance in AWS Console

In the **EC2 Console** :

- Select a Linux machine image
- Set IAM role to `ProjectName-EC2CodeDeployRole`
- Setup and set startup script contents from `scripts/instance_init.sh`
- Add a tag to the instance : `Key = Name, Value = ProjectName`
- Configure security group to allow TCP 8080 (application HTTP port)
- Select or create an SSH key pair (allows you to access instance console)
- Start the instance

## 3. Create a CodeDeploy Pipeline

In the **CodeDeploy Console** :

- Create an Application :
    - Name : `ProjectName`
    - Compute platform : `EC2/On-premise`
- Create a Deployment Group :
    - Name : `ProjectName-DeploymentGroup`
    - Role : `ProjectName-CodeDeployRole`
    - Type : `In-place`
    - Environment : `Amazon EC2 instances`
    - Tags : `Name` => `ProjectName`
    - Deployment settings : `CodeDeployDefault.AllAtOnce`
    - Disable load balancer if you use only one EC2 instance
- Create a Pipeline :
    - Name : `ProjectName-Pipeline`
    - Source provider : `GitHub v2`
    - Connection => Connect to GitHub and select repository and branch to deploy on push, naming connection `ProjectName-GitHubConnection`
    - Skip build stage
    - Add deploy stage : `AWS CodeDeploy` and select corresponding app name and deployment group
