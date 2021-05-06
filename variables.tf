variable assumed_role {
  type        = string
  default     = "arn:aws:iam::911376987430:role/pdx-d01-support-tf-controller"
  description = "AWS Delegated Role for Cross Account Access. Blank for using the Instance profile"
}
