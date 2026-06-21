variable "environment" {
  description = "Environment name (used in labels)."
  type        = string
  default     = "production"
}

variable "namespace" {
  description = "Kubernetes namespace to create and deploy into."
  type        = string
}

variable "registry" {
  description = "DOCR registry path, e.g. registry.digitalocean.com/elias-interconnect-cr1."
  type        = string
}

variable "image_tag" {
  description = "Floor image tag the Deployment is created with (CD overrides with :<tag>-<sha>)."
  type        = string
  default     = "production"
}

variable "replicas" {
  description = "Number of web pod replicas."
  type        = number
  default     = 2
}

variable "hostname" {
  description = "Public hostname served by the ingress (TLS cert SAN)."
  type        = string
}

variable "cluster_issuer" {
  description = "cert-manager ClusterIssuer name that already exists on the cluster."
  type        = string
  default     = "letsencrypt-http01"
}

# --- DigitalOcean Spaces -----------------------------------------------------------------------
variable "do_spaces_bucket" {
  description = "DO Spaces bucket name."
  type        = string
}

variable "do_spaces_region" {
  description = "DO Spaces region, e.g. nyc3."
  type        = string
}

variable "do_spaces_endpoint" {
  description = "DO Spaces S3 endpoint URL."
  type        = string
}

variable "do_spaces_key" {
  description = "DO Spaces access key."
  type        = string
  sensitive   = true
}

variable "do_spaces_secret" {
  description = "DO Spaces secret key."
  type        = string
  sensitive   = true
}

# --- DOCR image pull ---------------------------------------------------------------------------
variable "docr_pull_token" {
  description = "DigitalOcean API token used as the DOCR image-pull credential."
  type        = string
  sensitive   = true
}
