terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

output "s3_data_yaml" {
  value = local.s3_data_raw_yaml
}

output "s3_data_json" {
  value = local.s3_data_raw_json
}

locals {
  s3_data_raw_yaml =    yamldecode(file("${path.module}/s3_data.yaml"))
  s3_data_raw_json    = jsondecode(file("${path.module}/s3_data.json"))
}

resource "aws_s3_bucket" "s3" {
  for_each = { for b in local.s3_data_raw_yaml.buckets : b.bucket_name => b }

  acl           = local.s3_data_raw_yaml.acl
  bucket        = each.value.bucket_name
  force_destroy = each.value.force_destroy

  dynamic "lifecycle_rule" {
    for_each = each.value.lifecycle_rule[*]

    content {
      id      = lifecycle_rule.value.id
      enabled = lifecycle_rule.value.enabled
      prefix  = lifecycle_rule.value.prefix

      dynamic "transition" {
        for_each = lifecycle_rule.value.transition[*]

        content {
          days          = transition.value.days
          storage_class = transition.value.storage_class
        }
      }
    }
  }
}
