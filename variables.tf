# variable "azure_org_service_url" {
#   description = "The URL of location where repo is imported to" #Sandbox
#   type = string
#   default = "https://dev.azure.com/orgname"
# }

variable "azure_org_service_url" {
  description = "The URL of location where repo is imported to" #Actual Workplace
  type = string
  default = "https://dev.azure.com/{ProjectName}"
}

variable "azure_personal_access_token" { #Live ADO
  description = "PAT of destination"
  type = string
  default = "{PAT}"
}

# variable "azure_personal_access_token" {  #SANDBOX PAT
#   description = "PAT of destination"
#   type = string
#   default = "{PAT}"
# }


# variable "project_id" {
#   description = "Project ID" #ProjectName(Sandbox)
#   type = string
#   default = "{PAT}"

# }

variable "project_id" {
  description = "Project ID"  #ProjectName (actual workplace )
  type = string
  default = "{PAT}"

}