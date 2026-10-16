# Kubernetes CRDs

Kubernetes is extensible with `CustomResourceDefinition`s (CRDs).
To cover all usage of Kubernetes, pkl-k8s must also be extended to support custom resources.

This demo illustrates how to generate schemas for CRDs and use them like any other resource schema from pkl-k8s.

## Schema generation

The `k8s.contrib.crd` package provides a [Pkl code generator for CRDs](https://pkl-lang.org/package-docs/pkg.pkl-lang.org/pkl-pantry/k8s.contrib.crd/current/generate/index.html).

If we want to generate Pkl schemas for the CRDs belonging to [prometheus-operator](https://github.com/prometheus-operator/prometheus-operator), we can run:
```bash
pkl eval @k8s.contrib.crd/generate.pkl \
  -m schemas \
  -p source="https://github.com/prometheus-operator/prometheus-operator/releases/download/v0.95.1/stripped-down-crds.yaml" \
  -p k8sImportPath=@k8s \
  -p baseApiGroup=monitoring.coreos.com
```

Once the schemas are generated, the example `ServiceMonitor` can be evaluated:
```bash
pkl eval example-service-monitor.pkl
```
