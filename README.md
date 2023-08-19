# Introduction 
This project was done to automate the importation of repositories and granting permission to those repositories. 

# Getting Started
1. Terraform installation process
    To proceed with running this script you must first install Terraform. A link to download and install terraform is provided here (https://learn.hashicorp.com/tutorials/terraform/install-cli)

2. Software dependencies
    Terraform is compatible with OS X, Windows and various Linux distributions.


# Build and Test
1. Create a main.ft file that will contain your main terraform automation script.

2. Optional : Create a variable.tf and output.tf file to store local variables and allows you to export structured data about your resources respectively.

**Main.tf**
1. 1st Block
Shows the provider of the service being used. In this case the official azuredevops service.

2. 2nd Block
Shows the required credentials needed to login the specified organization on azure
* Organization's URL in Azure
* Password or PAT

3. 3rd and 4th Block 
Resource needed to import from a private repository
Requirements
* Project ID
* repository_url = URL of source repository to be imported
* username = username of account in source repository 
* password = password or PAT of account in source repository
* service_endpoint_name = Creation of Service Connection to ensure connection between the two source code managers -Azure & Bitbucket.
* source_url = URL of source repository to be imported

4. 5th Block
Resource needed to import from a public repository

5. 6th Block 
Azuredevops user group for repositories
Requirement
* Project id
* name = Name of specific user group to grant permission to

6. 7th Block 
Permission for user group per repository 
Requirement
* Project id
* Repository id 
* Principal id = User group id
Used For_each statement to iterate granting user groups permissions to multiple repository 


# Contribute
Contributors to this script can use the branch named Import_Repo to make changes