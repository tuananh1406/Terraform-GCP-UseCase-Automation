provider "google" {
  project     = var.project
  credentials = file("#########################.json")  // your credentials.json to be used here
}

#--------------------------------------------
# Creating GCS Bucket
#--------------------------------------------

resource "google_storage_bucket" "bucket" {
  name                        = var.name
  project                     = var.project
  location                    = var.location
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.bucket_policy_only
  labels                      = var.labels
  force_destroy               = var.force_destroy

  versioning {
    enabled = var.versioning
  }

 dynamic "retention_policy" {
   for_each = var.retention_policy == null ? [] : [var.retention_policy]
   content {
     is_locked        = var.retention_policy.is_locked
     retention_period = var.retention_policy.retention_period
   }
 }

 dynamic "encryption" {
   for_each = var.encryption == null ? [] : [var.encryption]
   content {
     default_kms_key_name = var.encryption.default_kms_key_name
   }
 }

 lifecycle_rule {
     action {
       type          = "SetStorageClass"
       storage_class = "NEARLINE"
     }
     condition {
         age = 7
     }
   }
 lifecycle_rule {
     action {
       type          = "SetStorageClass"
       storage_class = "COLDLINE"
     }
     condition {
       age = 30
     }
   }
}
