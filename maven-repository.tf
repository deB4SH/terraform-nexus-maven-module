resource "nexus_repository_maven_hosted" "registry" {
  name   = "${var.name}"
  online = var.isOnline

  storage {
    blob_store_name                = "${var.blobStoreName}"
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }

  maven {
    version_policy      = "${var.mavenVersionPolicy}"
    layout_policy       = "${var.mavenLayoutPolicy}"
    content_disposition = "INLINE"
  }
}