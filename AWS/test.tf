##########################
# Define Ye Old Provider #
##########################



#####################
# Variables Go Here #
#####################

locals {
  yaml_test = yamldecode(file("${path.module}/yaml_data.yaml"))
}

resource null_resource null {
  count = 1
}

output yaml_data {
  value = local.yaml_test
}