# kestra-starter

![Version: 0.24.1](https://img.shields.io/badge/Version-0.24.1-informational?style=flat-square) ![AppVersion: v0.24.1](https://img.shields.io/badge/AppVersion-v0.24.1-informational?style=flat-square)

Infinitely scalable, event-driven, language-agnostic orchestration and scheduling platform to manage millions of workflows declaratively in code.

**Homepage:** <https://kestra.io>

## Installing the Chart

To install the chart with the release name `my-kestra-starter`:

```console
$ helm repo add kestra https://helm.kestra.io/
$ helm install my-kestra-starter kestra/kestra-starter --version 0.24.1
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.min.io/ | minio | 5.4.0 |
| https://groundhog2k.github.io/helm-charts/ | postgres | 1.5.7 |
| https://helm.kestra.io/ | kestra | 0.24.1 |

## Values

### PostgreSQL Configuration --

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
| kestra.common.revisionHistoryLimit | int | `5` |  |
| kestra.configurations.application.datasources.postgres.driverClassName | string | `"org.postgresql.Driver"` |  |
| kestra.configurations.application.datasources.postgres.password | string | `"ChangeMe#1234"` |  |
| kestra.configurations.application.datasources.postgres.url | string | `"jdbc:postgresql://kestra-starter-postgres:5432/kestra"` |  |
| kestra.configurations.application.datasources.postgres.username | string | `"kestra"` |  |
| kestra.configurations.application.kestra.queue.type | string | `"postgres"` |  |
| kestra.configurations.application.kestra.repository.type | string | `"postgres"` |  |
| kestra.configurations.application.kestra.storage.minio.access-key | string | `"kestra"` |  |
| kestra.configurations.application.kestra.storage.minio.bucket | string | `"kestra"` |  |
| kestra.configurations.application.kestra.storage.minio.endpoint | string | `"kestra-starter-minio"` |  |
| kestra.configurations.application.kestra.storage.minio.port | string | `"9000"` |  |
| kestra.configurations.application.kestra.storage.minio.secret-key | string | `"kestra-1234"` |  |
| kestra.configurations.application.kestra.storage.minio.secure | string | `"false"` |  |
| kestra.configurations.application.kestra.storage.type | string | `"minio"` |  |
| kestra.configurations.application.kestra.tutorialFlows.enabled | bool | `true` |  |
| kestra.dind.enabled | bool | `true` |  |
| kestra.dind.mode | string | `"insecure"` |  |
| kestra.fullnameOverride | string | `"kestra-starter"` |  |
| minio.buckets[0].name | string | `"kestra"` |  |
| minio.buckets[0].policy | string | `"public"` |  |
| minio.deploymentUpdate.type | string | `"Recreate"` |  |
| minio.fullnameOverride | string | `"kestra-starter-minio"` |  |
| minio.mode | string | `"standalone"` |  |
| minio.policies[0].name | string | `"KestraWritePolicy"` |  |
| minio.policies[0].statements[0].actions[0] | string | `"s3:*"` |  |
| minio.policies[0].statements[0].effect | string | `"Allow"` |  |
| minio.policies[0].statements[0].resources[0] | string | `"arn:aws:s3:::kestra/*"` |  |
| minio.replicas | int | `1` |  |
| minio.resources | object | `{}` |  |
| minio.rootPassword | string | `"SuperChangeMe#1234"` |  |
| minio.rootUser | string | `"root"` |  |
| minio.svcaccts[0].accessKey | string | `"kestra-svcacct"` |  |
| minio.svcaccts[0].secretKey | string | `"kestra-svcacct-1234"` |  |
| minio.svcaccts[0].user | string | `"kestra"` |  |
| minio.users[0].accessKey | string | `"console"` |  |
| minio.users[0].policy | string | `"consoleAdmin"` |  |
| minio.users[0].secretKey | string | `"console-1234"` |  |
| minio.users[1].accessKey | string | `"kestra"` |  |
| minio.users[1].policy | string | `"KestraWritePolicy"` |  |
| minio.users[1].secretKey | string | `"kestra-1234"` |  |
