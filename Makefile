.PHONY: deploy-prometheus deploy-grafana add-helm-repos

PROMETHEUS_CHART_VERSION ?= 25.19.1
GRAFANA_CHART_VERSION ?= 7.3.7

PROMETHEUS_RELEASE_NAME ?= prometheus
GRAFANA_RELEASE_NAME ?= grafana

PROMETHEUS_CHART_NAME ?= prometheus/prometheus
GRAFANA_CHART_NAME ?= grafana/grafana

PROMETHEUS_ARGS ?= --version $(PROMETHEUS_CHART_VERSION) -f deploy/values-prometheus-rendered.yml
GRAFANA_ARGS ?= --version $(GRAFANA_CHART_VERSION) -f deploy/values-grafana.yml

deploy-prometheus:
	@envsubst < deploy/values-prometheus.yml > deploy/values-prometheus-rendered.yml
	@helm upgrade --install $(PROMETHEUS_RELEASE_NAME) $(PROMETHEUS_CHART_NAME) $(PROMETHEUS_ARGS) $(PROMETHEUS_EXTRA_ARGS)

deploy-grafana: 
	@helm upgrade --install $(GRAFANA_RELEASE_NAME) $(GRAFANA_CHART_NAME) $(GRAFANA_ARGS) $(GRAFANA_EXTRA_ARGS)

add-helm-repos:
	@helm repo add prometheus https://prometheus-community.github.io/helm-charts
	@helm repo add grafana https://grafana.github.io/helm-charts
