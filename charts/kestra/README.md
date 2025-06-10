# kestra

![Version: 0.22.5](https://img.shields.io/badge/Version-0.22.5-informational?style=flat-square) ![AppVersion: v0.22.5](https://img.shields.io/badge/AppVersion-v0.22.5-informational?style=flat-square)

Infinitely scalable, event-driven, language-agnostic orchestration and scheduling platform to manage millions of workflows declaratively in code.

**Homepage:** <https://kestra.io>

## Installing the Chart

To install the chart with the release name `kestra`:

```console
$ helm repo add kestra https://helm.kestra.io/
$ helm install my-kestra kestra/kestra --version 0.22.5
```

## Migration from 0.x.x to 1.0.0"

## Values

### common settings

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| common.affinity | object | `{}` | ... |
| common.annotations | object | `{}` | ... |
| common.extraContainers | list | `[]` | ... |
| common.extraEnv | list | `[]` | ... |
| common.extraEnvFrom | list | `[]` | ... |
| common.extraVolumeMounts | list | `[]` | ... |
| common.extraVolumes | list | `[]` | ... |
| common.initContainers | list | `[]` | ... |
| common.labels | object | `{}` | ... |
| common.livenessProbe | object | `{"failureThreshold":3,"httpGet":{"path":"/health/liveness","port":"management"},"initialDelaySeconds":0,"periodSeconds":5,"successThreshold":1,"timeoutSeconds":3}` | ... |
| common.nodeSelector | object | `{}` | ... |
| common.podAnnotations | object | `{}` | ... |
| common.podLabels | object | `{}` | ... |
| common.podSecurityContext | object | `{}` | ... |
| common.readinessProbe | object | `{"failureThreshold":3,"httpGet":{"path":"/health/readiness","port":"management"},"initialDelaySeconds":0,"periodSeconds":5,"successThreshold":1,"timeoutSeconds":3}` | ... |
| common.replicas | int | `1` | ... |
| common.resources | object | `{}` | ... |
| common.securityContext | object | `{"runAsGroup":1000,"runAsUser":1000}` | ... |
| common.startupProbe | object | `{"failureThreshold":120,"httpGet":{"path":"/health","port":"management"},"initialDelaySeconds":1,"periodSeconds":1,"successThreshold":1,"timeoutSeconds":1}` | ... |
| common.strategy | object | `{"rollingUpdate":{"maxSurge":1,"maxUnavailable":1},"type":"RollingUpdate"}` | ... |
| common.terminationGracePeriodSeconds | int | `60` | ... |
| common.tolerations | list | `[]` | ... |

### kestra configurations

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configurations.application | object | `{}` | ... |
| configurations.configmaps | list | `[]` | ... |
| configurations.secrets | list | `[]` | ... |

### kestra deployments

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployments.executor.enabled | bool | `false` | Whether to deploy kestra in distributed mode, executor will be deployed. |
| deployments.indexer.enabled | bool | `false` | Whether to deploy kestra in distributed mode, indexer will be deployed. |
| deployments.scheduler.enabled | bool | `false` | Whether to deploy kestra in distributed mode, scheduler will be deployed. |
| deployments.standalone.enabled | bool | `true` | Whether to deploy kestra in standalone mode. |
| deployments.standalone.workerThreads | int | `128` | By default, we start a number of threads of two times the number of available processors, use 'workerThreads' to configure a different value. |
| deployments.webserver.enabled | bool | `false` | Whether to deploy kestra in distributed mode, webserver will be deployed. |
| deployments.worker.enabled | bool | `false` | Whether to deploy kestra in distributed mode, worker will be deployed. |
| deployments.worker.workerThreads | int | `128` | By default, we start a number of threads of two times the number of available processors, use 'workerThreads' to configure a different value. |
| deployments.workerGroups | object | `{"enabled":false,"items":[]}` | EE only - Define additional group of workers. Must be used in addition to default workers (in standalone or separate worker deployment). |

### kestra dind

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dind.args | list | `["--log-level=fatal","--group=1000"]` | ... |
| dind.enabled | bool | `true` | ... |
| dind.extraEnv | list | `[]` | ... |
| dind.extraVolumeMounts | list | `[]` | ... |
| dind.image.pullPolicy | string | `"IfNotPresent"` | ... |
| dind.image.repository | string | `"docker"` | ... |
| dind.image.tag | string | `"dind-rootless"` | ... |
| dind.resources | object | `{}` | ... |
| dind.securityContext | object | `{"runAsGroup":1000,"runAsUser":1000}` | ... |
| dind.socketPath | string | `"/dind/"` | ... |
| dind.tmpPath | string | `"/tmp/"` | ... |

### image settings

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. |
| image.repository | string | `"kestra/kestra"` | Image repository to use for deploying kestra. |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | ... |

### kubernetes ingress

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ingress.annotations | object | `{}` | ... |
| ingress.className | string | `""` | ... |
| ingress.enabled | bool | `false` | ... |
| ingress.hosts | list | `[]` | ... |
| ingress.tls | list | `[]` | ... |

### kestra service

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| service.annotations | object | `{}` | ... |
| service.labels | object | `{}` | ... |
| service.ports.http | object | `{"containerPort":8080,"port":8080,"protocol":"TCP","targetPort":"http"}` | ... |
| service.ports.management | object | `{"containerPort":8081,"port":8081,"protocol":"TCP","targetPort":"management"}` | ... |
| service.type | string | `"ClusterIP"` | ... |

### kubernetes serviceAccount

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployments.executor.extraArgs | list | `[]` |  |
| deployments.indexer.extraArgs | list | `[]` |  |
| deployments.scheduler.extraArgs | list | `[]` |  |
| deployments.standalone.extraArgs | list | `[]` |  |
| deployments.webserver.extraArgs | list | `[]` |  |
| deployments.worker.extraArgs | list | `[]` |  |
| extraManifests | list | `[]` | You can specify extra manifests to be deployed with this chart. |
| fullnameOverride | string | `""` |  |
| nameOverride | string | `""` |  |

