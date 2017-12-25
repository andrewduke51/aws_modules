# provider

provider "aws" {
  profile                 = "${var.profile}"
  shared_credentials_file = "${var.cred_path}"
  region                  = "${var.default_region}"
}
