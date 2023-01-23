locals {
  enable_ebs_csi = true
}
module "ebs_csi" {
  source              = "github.com/massdriver-cloud/terraform-modules//k8s/aws-ebs-csi-driver?ref=1961370"
  count               = local.enable_ebs_csi ? 1 : 0
  kubernetes_version  = var.k8s_version
  eks_cluster_arn     = data.aws_eks_cluster.cluster.arn
  eks_oidc_issuer_url = local.oidc_issuer_url
}
