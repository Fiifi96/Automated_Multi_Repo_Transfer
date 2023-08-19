######################### SETTING PROVIDER ####################################

terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "=0.2.1"
    }
  }
}

provider "azuredevops" {
  org_service_url = var.azure_org_service_url
  personal_access_token = var.azure_personal_access_token
}

################################### END ############################################

######################### Import Private Repo ######################################

resource "azuredevops_serviceendpoint_generic_git" "example-serviceendpoint" {
  project_id            = var.project_id
  repository_url        = "{Repository URL}" 
  username              = "{Username}"
  password              = "{PAT}"       #PAT
  service_endpoint_name = "{Name of Service Endpoint}"
  description           = "Managed by Terraform"
}

resource "azuredevops_git_repository" "example-import-source-1" {
  project_id = var.project_id
  for_each = {
    repo_1       = ""
    repo_2       = ""
   repo_3       = ""
   repo_4       = ""
   repo_5       = "" 
   repo_6       = ""
   repo_7       = ""
   repo_8       = ""
   repo_9       = ""
   repo_10      = ""
   repo_11      = ""
   repo_12      = ""
   repo_13      = ""
   repo_14      = "" 
   repo_15      = ""
   repo_16      = ""
   repo_17      = ""
   repo_18      = ""
   repo_19      = "" 
   repo_20      = "" 
   
  }
  name = each.value

  initialization {
    init_type             = "Import"
    source_type           = "Git"
    source_url            = "{Source URL}${each.value}"
    service_connection_id = azuredevops_serviceendpoint_generic_git.example-serviceendpoint.id
  }
}


############################ END #################################################

######################### Import Public Repo #####################################

#resource "azuredevops_git_repository" "example-import-source" {
#  project_id = var.project_id
#  for_each = {
#    repo_1       =  "Terraform"
#    repo_2       = "Wordpress_Automation"
#    repo_3       = "Fiifi96"
#    repo_4       = "EC2_Linux2"
#  }
#  name = each.value
#
#  initialization {
#    init_type   = "Import"
#    source_type = "Git"
#    source_url  = "https://github.com/Fiifi96/${each.value}"
#  }
#}

############################### END ################################################


############################### SETTING PERMISSIONS TO REPOSITORY #################################
##### Per User group
data "azuredevops_group" "GroupName" {
  project_id = var.project_id
  name       = "GroupName"
}


resource "azuredevops_git_permissions" "User-permissions" {
  project_id    = var.project_id                                             #Object ProjectName
  principal     = data.azuredevops_group.Groupname.id                     #Object GroupName
#  repository_id = azuredevops_git_repository.example-import-source-1.id               #Using for just one Repo
    for_each = azuredevops_git_repository.example-import-source-1                      #Using multiple Repos
  permissions = {
    RemoveOthersLocks        = "NotSet"             ### Remove others' locks
    ManagePermissions        = "NotSet"             ### Manage permissions
    CreateTag                = "Allow"              ### Create tag
    CreateBranch             = "Allow"              ### Create branch
    Administer               = "NotSet"             ### Administer
    GenericRead              = "Allow"              ### Read
    GenericContribute        = "Allow"              ### Contribute
    ForcePush                = "NotSet"             ### Force push (rewrite history, delete branches and tags)
    ManageNote               = "Allow"              ### Manage notes
    PolicyExempt             = "NotSet"             ### Bypass policies when pushing
    CreateRepository         = "NotSet"             ### Create repository
    DeleteRepository         = "NotSet"               ### Delete repository
    RenameRepository         = "NotSet"             ### Rename repository
    EditPolicies             = "NotSet"             ### Edit policies
    PullRequestContribute    = "Allow"              ### Contribute to pull requests
    PullRequestBypassPolicy  = "NotSet"             ### Bypass policies when completing pull requests
  }
}

################################## END #####################################################


##### Per User group
data "azuredevops_group" "GroupName2" {
  project_id = var.project_id
  name       = "GroupName2"
}


resource "azuredevops_git_permissions" "User-permissions_groupname" {
  project_id    = var.project_id                                             #Object ProjectName
  principal     = data.azuredevops_group.GroupName2.id                     #Object GroupName
  #  repository_id = azuredevops_git_repository.example-import-source-1.id               #Using for just one Repo
  for_each = azuredevops_git_repository.example-import-source-1                      #Using multiple Repos
  permissions = {
    RemoveOthersLocks        = "NotSet"             ### Remove others' locks
    ManagePermissions        = "NotSet"             ### Manage permissions
    CreateTag                = "Allow"              ### Create tag
    CreateBranch             = "Allow"              ### Create branch
    Administer               = "NotSet"             ### Administer
    GenericRead              = "Allow"              ### Read
    GenericContribute        = "Allow"              ### Contribute
    ForcePush                = "NotSet"             ### Force push (rewrite history, delete branches and tags)
    ManageNote               = "Allow"              ### Manage notes
    PolicyExempt             = "NotSet"             ### Bypass policies when pushing
    CreateRepository         = "NotSet"             ### Create repository
    DeleteRepository         = "NotSet"             ### Delete repository
    RenameRepository         = "NotSet"             ### Rename repository
    EditPolicies             = "NotSet"             ### Edit policies
    PullRequestContribute    = "Allow"              ### Contribute to pull requests
    PullRequestBypassPolicy  = "NotSet"             ### Bypass policies when completing pull requests
  }
}

################################## END #####################################################