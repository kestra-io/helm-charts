<p align="center">
  <a href="https://www.kestra.io">
    <img src="https://kestra.io/banner.png"  alt="Kestra workflow orchestrator" />
  </a>
</p>

<h1 align="center" style="border-bottom: none">
    Event-Driven Declarative Orchestrator
</h1>

<br />

<p align="center">
    <a href="https://twitter.com/kestra_io"><img height="25" src="https://kestra.io/twitter.svg" alt="twitter" /></a> &nbsp;
    <a href="https://www.linkedin.com/company/kestra/"><img height="25" src="https://kestra.io/linkedin.svg" alt="linkedin" /></a> &nbsp;
<a href="https://www.youtube.com/@kestra-io"><img height="25" src="https://kestra.io/youtube.svg" alt="youtube" /></a> &nbsp;
</p>

<br />
<p align="center">
    <a href="https://go.kestra.io/video/product-overview" target="_blank">
        <img src="https://kestra.io/startvideo.png" alt="Get started in 4 minutes with Kestra" width="640px" />
    </a>
</p>
<p align="center" style="color:grey;"><i>Get started with Kestra in 4 minutes.</i></p>

# kestra-starter

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![AppVersion: v1.0.1](https://img.shields.io/badge/AppVersion-v1.0.1-informational?style=flat-square)

Infinitely scalable, event-driven, language-agnostic orchestration and scheduling platform to manage millions of workflows declaratively in code.

**Homepage:** <https://kestra.io>

## Installing the Chart

To install the chart with the release name `my-kestra-starter`:

```console
$ helm repo add kestra https://helm.kestra.io/
$ helm install my-kestra-starter kestra/kestra-starter --version 1.0.3
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.min.io/ | minio | 5.4.0 |
| https://groundhog2k.github.io/helm-charts/ | postgres | 1.5.7 |
| https://helm.kestra.io/ | kestra | 1.0.3 |

## Values

### Kestra Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kestra.common | object | `{"revisionHistoryLimit":5}` | see https://artifacthub.io/packages/helm/kestra/kestra for all available configurations |
| kestra.configurations | object | `{"application":{"datasources":{"postgres":{"driverClassName":"org.postgresql.Driver","password":"ChangeMe#1234","url":"jdbc:postgresql://kestra-starter-postgres:5432/kestra","username":"kestra"}},"kestra":{"queue":{"type":"postgres"},"repository":{"type":"postgres"},"storage":{"minio":{"access-key":"kestra","bucket":"kestra","endpoint":"kestra-starter-minio","port":"9000","secret-key":"kestra-1234","secure":"false"},"type":"minio"},"tutorialFlows":{"enabled":true}}}}` | see https://artifacthub.io/packages/helm/kestra/kestra for all available configurations |
| kestra.dind | object | `{"enabled":true,"mode":"insecure"}` | see https://artifacthub.io/packages/helm/kestra/kestra for all available configurations |
| kestra.fullnameOverride | string | `"kestra-starter"` | see https://artifacthub.io/packages/helm/kestra/kestra for all available configurations |

### MinIO Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| minio.buckets | list | `[{"name":"kestra","policy":"public"}]` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.deploymentUpdate | object | `{"type":"Recreate"}` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.fullnameOverride | string | `"kestra-starter-minio"` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.mode | string | `"standalone"` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.policies | list | `[{"name":"KestraWritePolicy","statements":[{"actions":["s3:*"],"effect":"Allow","resources":["arn:aws:s3:::kestra/*"]}]}]` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.replicas | int | `1` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.resources | object | `{}` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.rootPassword | string | `"SuperChangeMe#1234"` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.rootUser | string | `"root"` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.svcaccts | list | `[{"accessKey":"kestra-svcacct","secretKey":"kestra-svcacct-1234","user":"kestra"}]` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |
| minio.users | list | `[{"accessKey":"console","policy":"consoleAdmin","secretKey":"console-1234"},{"accessKey":"kestra","policy":"KestraWritePolicy","secretKey":"kestra-1234"}]` | see https://artifacthub.io/packages/helm/minio-official/minio for all available configurations |

### PostgreSQL Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgres.fullnameOverride | string | `"kestra-starter-postgres"` | see https://artifacthub.io/packages/helm/groundhog2k/postgres for all available configurations |
| postgres.revisionHistoryLimit | int | `5` | see https://artifacthub.io/packages/helm/groundhog2k/postgres for all available configurations |
| postgres.serviceAccount | object | `{"create":true}` | see https://artifacthub.io/packages/helm/groundhog2k/postgres for all available configurations |
| postgres.settings | object | `{"superuser":{"value":"postgres"},"superuserPassword":{"value":"SuperChangeMe#1234"}}` | see https://artifacthub.io/packages/helm/groundhog2k/postgres for all available configurations |
| postgres.userDatabase | object | `{"name":{"value":"kestra"},"password":{"value":"ChangeMe#1234"},"user":{"value":"kestra"}}` | see https://artifacthub.io/packages/helm/groundhog2k/postgres for all available configurations |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| minio.persistence.size | string | `"10Gi"` |  |
| minio.resources.requests.memory | string | `"2Gi"` |  |

## Documentation
* Full documentation can be found under [kestra.io/docs](https://kestra.io/docs)
* Deployment on Kubernetes documentation can be found [here](https://kestra.io/docs/installation/kubernetes)

## License
Apache 2.0 © [Kestra Technologies](https://kestra.io)

## Stay up to date

We release new versions every month. Give the [main repository](https://github.com/kestra-io/kestra) a star to stay up to date with the latest releases and get notified about future updates.

![Star the repo](https://kestra.io/star.gif)
