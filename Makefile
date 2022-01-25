#!make:
include .env

# dependencies: jq, sed, helm, docker
package:
	sed -i "s/^version:.*$$/version: $(APP_VERSION)/" umami/Chart.yaml
	sed -i "s/^appVersion:.*$$/appVersion: '$(APP_VERSION)'/" umami/Chart.yaml
	helm package umami
	helm repo index .