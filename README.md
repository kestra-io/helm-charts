# Kestra Helm Charts

<p align="center">
  <img width="460" src="https://kestra.io/logo.svg"  alt="Kestra workflow orchestrator" />
</p>

![Kestra orchestrator](https://kestra.io/adding-tasks.gif)

## Documentation

* The official [Kestra documentation](https://kestra.io/docs)
* The installation [guide](https://kestra.io/docs/installation/kubernetes) for Kubernetes deployments.

## Install the chart

Use the following commands to install the Helm chart:

```bash
helm repo add kestra https://helm.kestra.io/
helm install kestra kestra/kestra
```

By default, the chart will deploy one standalone Kestra service with one replica i.e. all Kestra server components will be deployed in a single pod. You can change that default behavior and deploy each service independently using the following [Helm chart values](https://github.com/kestra-io/helm-charts/blob/master/charts/kestra/values.yaml):

```yaml
deployments:
  webserver:
    enabled: true
  executor:
    enabled: true
  indexer:
    enabled: true
  scheduler:
    enabled: true
  worker:
    enabled: true
  standalone:
    enabled: false
```

The chart can also deploy the following related services:

* A Kafka cluster and Zookeeper using `kafka.enabled: true`
* An Elasticsearch cluster using `elasticsearch.enabled: true`
* A MinIO standalone using `minio.enabled: true`
* A PostgreSQL using `postgresql.enabled: true`

## Configuration

Here is how you can adjust the Kestra configuration:

* Using a Kubernetes `ConfigMap` via the `configuration` Helm value.
* Using a Kubernetes `Secret` via the `secrets` Helm value.

Both must be valid YAML that will be merged as the Kestra configuration file.

Here is an example showing how to enable Kafka as the queue implementation and configure its `bootstrap.servers` property using a secret:

```yaml
configuration:
  kestra:
    queue:
      type: kafka

secrets:
  kestra:
    kafka:
      client:
        properties:
          bootstrap.servers: "localhost:9092"
```

## Docker in Docker (DinD) Worker sidecar

By default, Docker in Docker (DinD) is installed on the worker in the `rootless` version. This can be restricted in some environments due to security limitations. Here is how:

* On Google Kubernetes Engine (GKE), use a node pool based on `UBUNTU_CONTAINERD` that works well with Docker DinD, even rootless
* Some Kubernetes clusters support only a root version of DinD; to make your Kestra deployment work, [disable the rootless version](https://github.com/kestra-io/helm-charts/blob/master/charts/kestra/values.yaml#L102-L106) using the following Helm chart values:

```yaml
dind:
  image:
    image: docker
    tag: dind
  args:
    - --log-level=fatal
```

## License
Apache 2.0 © [Kestra Technologies](https://kestra.io)
