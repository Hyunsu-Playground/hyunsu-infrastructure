provider "helm" {
  kubernetes {
    host                   = module.eksv2.cluster_endpoint
    cluster_ca_certificate = module.eksv2.cluster_ca_certificate
    token                  = module.eksv2.cluster_auth_token
  }
}

locals {
  k8s-resource-repository = "https://hyunsu-playground.github.io/kubernetes-resource/"

  // argocd
  argocd-name      = "argocd"
  argocd-version   = "4.8.12"
  argocd-namespace = "argocd"

  //istio
  istio-name      = "istio"
  istio-version   = "1.0.45"
  istio-namespace = "istio-system"

  // hyunsu application
  hyunsu-application-name = "hyunsu-application"
  hyunsu-application-version = "1.0.5"
  hyunsu-application-namespace = "hyunsu-application"
}

module "argocd" {
  source        = "./modules/helm"
  name          = local.argocd-name
  namespace     = local.argocd-namespace
  repository    = local.k8s-resource-repository
  chart         = local.argocd-name
  chart_version = local.argocd-version
}

module "istio" {
  source        = "./modules/helm"
  name          = local.istio-name
  namespace     = local.istio-namespace
  repository    = local.k8s-resource-repository
  chart         = local.istio-name
  chart_version = local.istio-version
}

module "hyunsu-application" {
  source        = "./modules/helm"
  name          = local.hyunsu-application-name
  namespace     = local.hyunsu-application-namespace
  repository    = local.k8s-resource-repository
  chart         = local.hyunsu-application-name
  chart_version = local.hyunsu-application-version
}