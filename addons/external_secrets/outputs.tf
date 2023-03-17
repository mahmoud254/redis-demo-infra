output "grafana" {
    value = helm_release.external_secret.status
}