#!/bin/bash
# Downloads the helmchart CRD from URL
# Adds it to RKE2 Deployments folder /var/lib/rancher/rke2/server/manifests

install_chart () {
MANIFEST_URL=${BASE_URL}/${CHART_REPO}/${CHART_VERSION}/${CHART_NAME}
rm /var/lib/rancher/rke2/server/manifests/${CHART_NAME}.yaml
curl -sfL $MANIFEST_URL >> /var/lib/rancher/rke2/server/manifests/${CHART_NAME}.yaml
echo "${CHART_NAME} ${CHART_VERSION} Installed"
}

BASE_URL=https://raw.githubusercontent.com/william86370/rke2-tools/main/rke2-helm

#Install Cert-manager-CRDS v1.6.1
CHART_REPO=cert-manager
CHART_VERSION=v1.6.1
CHART_NAME=rke2-cert-manager-crds
install_chart 

#Install Cert-manager v1.6.1
CHART_REPO=cert-manager
CHART_VERSION=v1.6.1
CHART_NAME=rke2-cert-manager
install_chart

# curl -sfL https://raw.githubusercontent.com/william86370/rke2-tools/main/rke2-helm/cert-manager/cert-manager.sh | sh -
# Delete The new addon
# kubectl delete -n kube-system addon rke2-cert-manager-crds