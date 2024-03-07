# terraform-nexus-maven-module
Terraform Module to create a maven registry in nexus with pull and push user.

NOTE: The provider is configured within the main terraform file.

## Example Usage:

The following listing shows a sample usage of this module.
```
module "maven-registry" {
  source = "github.com/deB4SH/terraform-nexus-maven-module?ref=1.0.0"

  for_each = { for repo in var.maven_repository : repo.name => repo}

  name = each.key
  isOnline = each.value.isOnline
  mavenVersionPolicy = each.value.mavenVersionPolicy
  mavenLayoutPolicy = each.value.mavenLayoutPolicy
  blobStoreName = each.value.blobStoreName
}
```
This uses an array definiton for all maven repositories that should be created.
```
variable "maven_repository" {
  type = list(object({
    name = string
    isOnline = bool
    mavenVersionPolicy = string
    mavenLayoutPolicy = string
    blobStoreName = string
  }))
}
```

Where an example input may look like the following
```
maven_repository = [ 
    {
        name="mvn-public"
        isOnline = true
        mavenVersionPolicy = "RELEASE"
        mavenLayoutPolicy = "STRICT"
        blobStoreName = "default"
    }, 
    {
        name="mvn-release"
        isOnline = true
        mavenVersionPolicy = "RELEASE"
        mavenLayoutPolicy = "STRICT"
        blobStoreName = "default"
    }
]
```

This will result in the following objects within nexus.
* maven repository: mvn-public
* maven repository: mvn-release
* role for maven pull on registry mvn-public: mvn-mvn-public-pull-role
* role for maven push on registry mvn-public: mvn-mvn-public-push-role
* role for maven pull on registry mvn-release: mvn-mvn-release-pull-role
* role for maven push on registry mvn-release: mvn-mvn-release-push-role
* user for pull on maven registry mvn-public: mvn-mvn-public-pull
* user for push on maven registry mvn-public: mvn-mvn-public-push
* user for pull on maven registry mvn-release: mvn-mvn-release-pull
* user for push on maven registry mvn-release: mvn-mvn-release-push