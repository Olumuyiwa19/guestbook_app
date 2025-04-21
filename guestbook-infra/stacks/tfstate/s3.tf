module "tf_state" {
  source         = "../../modules/remote-state"
  bucket_name    = var.bucket_name
  environment    = var.environment
  key_alias      = var.key_alias
  region         = var.region
  shared_profile = var.shared_profile
}
