# insights-dashboards
Collection of Grafana dashboards for Okteto Insights

## Deploy Prometheus for Metric Scraping and Grafana for Dashboard Visualization

The following sections outline deployment steps for setting up a Prometheus and Grafana bundle that will scrape metrics from [Okteto Insights](https://www.okteto.com/docs/admin/okteto-insights/), covering both Okteto and standalone setups.

However, it's important to note that while the provided deployment solution is suitable for testing and development purposes, it may not be optimal for production scenarios.

If deployed via Okteto, it will be protected by default via [Private endpoints](https://www.okteto.com/docs/core/endpoints/private-endpoints/), but if deployed standalone it will be accessible by anyone with network access.

For production deployments, consider adjusting the settings to fit your security, scalability and persistence requirements.

| Environment Variable | Default Value | Description |
|-|-|-|
| `PROMETHEUS_CHART_VERSION` | `25.19.1` | The version of the Prometheus chart to be deployed. |
| `GRAFANA_CHART_VERSION` | `7.3.7` | The version of the Grafana chart to be deployed. |
| `PROMETHEUS_RELEASE_NAME` | `prometheus` | The name of the Prometheus release. |
| `GRAFANA_RELEASE_NAME` | `grafana` | The name of the Grafana release. |
| `PROMETHEUS_ARGS` | default helm chart installation flags | Main arguments for deploying the Prometheus chart. |
| `GRAFANA_ARGS` | default helm chart installation flags | Main arguments for deploying the Grafana chart. |
| `PROMETHEUS_EXTRA_ARGS` | | Extra arguments for the Helm upgrade command when deploying Prometheus. |
| `GRAFANA_EXTRA_ARGS` | | Extra arguments for the Helm upgrade command when deploying Grafana. |

### Okteto

#### Prerequisites

Before deploying with Okteto, make sure you have the following prerequisites:

- Okteto CLI installed and configured
- Access to the Okteto namespace where you want to deploy Prometheus and Grafana

#### Deployment Steps

1. Set up the `INSIGHTS_TOKEN` variable:
   - Create the `INSIGHTS_TOKEN` variable as a user or admin [Okteto variable](https://www.okteto.com/docs/core/okteto-variables/).
   
2. Run the deployment command or deploy the repository from the Okteto UI:
   ```bash
   okteto deploy
   ```

This will deploy Prometheus and Grafana using the values of the `INSIGHTS_TOKEN` variable from the Okteto environment.

### Standalone

#### Prerequisites

Before deploying standalone, make sure you have the following prerequisites:

- Access to the Kubernetes cluster where you want to deploy Prometheus and Grafana

#### Deployment Steps

1. Set up the environment variables:
   - Ensure both `INSIGHTS_TOKEN` and `DOMAIN` variables are exported.

2. Run the deployment command:
   ```bash
   make add-helm-repos
   ```
   ```bash
   make deploy-prometheus
   ```
   ```bash
   make deploy-grafana
   ```

This will deploy Prometheus and Grafana using the exported values of `INSIGHTS_TOKEN` and `DOMAIN` variables.
