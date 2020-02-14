terraform {
  version = "0.12.20"
}

# Define which provider plugins are to be included
providers {
  oci = ["~> 3.62"]
  chef = ["~> 0.2"]
  vault = ["~> 2.8"]
  null = ["~> 2.1"]
  postgresql = ["~> 1.4"]
  random = ["~> 2.2"]
}
