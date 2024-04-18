resource "google_storage_bucket" "built_code" {
  name          = "fancy-store-${var.project_id}"
  location      = var.region
  force_destroy = true # This enables the deletion of the bucket with objects inside it

}
