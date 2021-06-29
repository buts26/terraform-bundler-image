terraform {
  version = "0.12.21"
}

# Define which provider plugins are to be included
providers {
  oci = ["~> 3.62"]
  chef = ["~> 0.2"]
  postgresql = ["~> 1.4"]
  random = ["~> 2.2"]
  vsphere = ["~> 1.26.0"]
}
