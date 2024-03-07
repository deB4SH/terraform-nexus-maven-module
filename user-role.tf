resource "nexus_security_role" "security-role-pull" {
  description = "Maven Pull Role for ${var.name}"
  name        = "mvn-${var.name}-pull-role"
  privileges = [
    "nx-repository-view-maven2-${var.name}-read",
    "nx-repository-view-maven2-${var.name}-browse",
  ]
  roleid = "mvn-${var.name}-pull-role"
  depends_on = [nexus_repository_maven_hosted.registry]
}

resource "nexus_security_role" "security-role-push" {
  description = "Maven Push Role for ${var.name}"
  name        = "mvn-${var.name}-push-role"
  privileges = [
    "nx-repository-view-maven2-${var.name}-read",
    "nx-repository-view-maven2-${var.name}-browse",
    "nx-repository-view-maven2-${var.name}-add",
  ]
  roleid = "mvn-${var.name}-push-role"
  depends_on = [nexus_repository_maven_hosted.registry]
}
