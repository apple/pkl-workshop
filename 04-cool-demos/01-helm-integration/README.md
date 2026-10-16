# [Helm](https://helm.sh) Integration

This demo illustrates how to integrate an existing deployment of Prometheus using [prometheus-community's `prometheus` Helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus) with Pkl using the [pkl-reader-helm](https://github.com/apple/pkl-readers/tree/main/helm) [external resource reader](https://pkl-lang.org/main/current/language-reference/index.html#external-readers).

> [!NOTE]
> This `pkl-reader-helm` binary is currently only published for macOS and Linux systems.
> Binaries for other operating systems and architectures may be built locally and [pkl-readers](https://github.com/apple/pkl-readers) is open for contributions!

## Setup

This demo requires the `pkl-reader-helm` binary to be available to the Pkl evaluator:

```bash
# determine version to install (executable must match Pkl library version)
VERSION=$(pkl eval PklProject -x 'dependencies["helm"].uri.split("@").last')

# determine target OS/arch
if [ "$(uname)" = "Darwin" ]; then
  TARGET=macos
else
  TARGET="linux-${${$(uname -m)//x86_64/amd64}//arm64/aarch64}"
fi

# download and install
mkdir -p bin
curl -L -o ./bin/pkl-reader-helm "https://github.com/apple/pkl-readers/releases/download/helm%40$VERSION/pkl-reader-helm-$TARGET.bin"
chmod +x ./bin/pkl-reader-helm

# validate
./bin/pkl-reader-helm --version
```

## Converting values

First, generate a Pkl schema from the chart's values schema:

```bash
pkl eval @org.json_schema.contrib/generate.pkl -m . \
  -p source='https://raw.githubusercontent.com/prometheus-community/helm-charts/refs/heads/main/charts/prometheus/values.schema.json'
```

This generates `ValuesSchema.pkl`, providing a Pkl schema for the chart's values.

Next, convert the existing `values.yaml` to a `values.pkl`:

```bash
pkl eval convert-values.pkl -o values.pkl
```

This resulting module amends `ValuesSchema.pkl`, so we get validation that it matches the schema.

## Rendering resources

Finally, we can put everything together in `prometheus.pkl` and wire up our Pkl-schema-validated values to "import" the templated chart output.

```bash
# output as a YAML stream
pkl eval prometheus.pkl

# output to one file per resource
pkl eval -m output prometheus.pkl
```
