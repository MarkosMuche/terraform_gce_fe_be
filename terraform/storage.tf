resource "google_storage_bucket" "built_code" {
  name          = "fancy-store-${var.project_id}"
  location      = var.region
}
