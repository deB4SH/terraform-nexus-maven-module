variable "name" {
    type = string
    description = "Name of the docker registry"

}

variable "isOnline" {
    type = bool
    default = true
    description = "Toggle switch to enable or disable online usage of this repository"

}

variable "blobStoreName" {
    type = string
    default = "default"
    description = "Blob Storage wihin nexus to use"

}

variable "mavenVersionPolicy" {
  type = string
  default = "RELEASE"
  description = "What type of artifacts does this repository store? Possible Value: RELEASE, SNAPSHOT or MIXED"
}

variable "mavenLayoutPolicy" {
  type = string
  default = "STRICT"
  description = " Validate that all paths are maven artifact or metadata paths. Possible Value: STRICT or PERMISSIVE"
}