#!/bin/bash
# Downloads the helmchart CRD from URL
# Adds it to RKE2 Deployments folder /var/lib/rancher/rke2/server/manifests
CHART_VERSION=cert-manager/v1.6.1
CHART_NAME=cert-manager-crd.yaml

MANIFEST_URL=https://raw.githubusercontent.com/william86370/rke2-tools/main/rke2-helm/${CHART_VERSION}/${CHART_NAME}
curl -sfL $MANIFEST_URL >> /var/lib/rancher/rke2/server/manifests/${CHART_NAME}
echo "${CHART_VERSION} Installed"