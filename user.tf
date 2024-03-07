resource "random_password" "pull-user-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_password" "push-user-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "nexus_security_user" "pull-user" {
  userid     = "mvn-${var.name}-pull"
  firstname  = "Maven Pull"
  lastname   = "${var.name}"
  email      = "svc.mvn.${var.name}-pull@local.lan"
  password   = random_password.pull-user-password.result
  roles      = ["mvn-${var.name}-pull-role"]
  status     = "active"
  depends_on = [nexus_repository_maven_hosted.registry, nexus_security_role.security-role-pull]
}

resource "nexus_security_user" "push-user" {
  userid     = "mvn-${var.name}-push"
  firstname  = "Maven Push"
  lastname   = "${var.name}"
  email      = "svc.mvn.${var.name}-push@local.lan"
  password   = random_password.push-user-password.result
  roles      = ["mvn-${var.name}-push-role"]
  status     = "active"
  depends_on = [nexus_repository_maven_hosted.registry, nexus_security_role.security-role-push]
}