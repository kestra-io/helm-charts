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

### serviceAccount

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| common.affinity | object | `{}` |  |
| common.annotations | object | `{}` | common annotations to be added to all deployments types |
| common.extraContainers | list | `[]` |  |
| common.extraEnv | list | `[]` |  |
| common.extraEnvFrom | list | `[]` |  |
| common.extraVolumeMounts | list | `[]` |  |
| common.extraVolumes | list | `[]` |  |
| common.initContainers | list | `[]` |  |
| common.labels | object | `{}` |  |
| common.livenessProbe.failureThreshold | int | `3` |  |
| common.livenessProbe.httpGet.path | string | `"/health/liveness"` |  |
| common.livenessProbe.httpGet.port | string | `"management"` |  |
| common.livenessProbe.initialDelaySeconds | int | `0` |  |
| common.livenessProbe.periodSeconds | int | `5` |  |
| common.livenessProbe.successThreshold | int | `1` |  |
| common.livenessProbe.timeoutSeconds | int | `3` |  |
| common.nodeSelector | object | `{}` |  |
| common.podAnnotations | object | `{}` | common annotations to be added to all pods from deployments types |
| common.podLabels | object | `{}` |  |
| common.podSecurityContext | object | `{}` |  |
| common.readinessProbe.failureThreshold | int | `3` |  |
| common.readinessProbe.httpGet.path | string | `"/health/readiness"` |  |
| common.readinessProbe.httpGet.port | string | `"management"` |  |
| common.readinessProbe.initialDelaySeconds | int | `0` |  |
| common.readinessProbe.periodSeconds | int | `5` |  |
| common.readinessProbe.successThreshold | int | `1` |  |
| common.readinessProbe.timeoutSeconds | int | `3` |  |
| common.replicas | int | `1` |  |
| common.resources | object | `{}` |  |
| common.securityContext.runAsGroup | int | `1000` |  |
| common.securityContext.runAsUser | int | `1000` |  |
| common.startupProbe.failureThreshold | int | `120` |  |
| common.startupProbe.httpGet.path | string | `"/health"` |  |
| common.startupProbe.httpGet.port | string | `"management"` |  |
| common.startupProbe.initialDelaySeconds | int | `1` |  |
| common.startupProbe.periodSeconds | int | `1` |  |
| common.startupProbe.successThreshold | int | `1` |  |
| common.startupProbe.timeoutSeconds | int | `1` |  |
| common.strategy.rollingUpdate.maxSurge | int | `1` |  |
| common.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| common.strategy.type | string | `"RollingUpdate"` |  |
| common.terminationGracePeriodSeconds | int | `60` |  |
| common.tolerations | list | `[]` |  |
| deployments.workerGroups.enabled | bool | `false` |  |
| deployments.workerGroups.items | list | `[]` |  |
| dind.args[0] | string | `"--log-level=fatal"` |  |
| dind.args[1] | string | `"--group=1000"` |  |
| dind.enabled | bool | `true` |  |
| dind.extraEnv | list | `[]` |  |
| dind.extraVolumeMounts | list | `[]` |  |
| dind.image.pullPolicy | string | `"IfNotPresent"` |  |
| dind.image.repository | string | `"docker"` |  |
| dind.image.tag | string | `"dind-rootless"` |  |
| dind.resources | object | `{}` |  |
| dind.securityContext.runAsGroup | int | `1000` |  |
| dind.securityContext.runAsUser | int | `1000` |  |
| dind.socketPath | string | `"/dind/"` |  |
| dind.tmpPath | string | `"/tmp/"` |  |
| extraManifests | list | `[]` | You can specify extra manifests to be deployed with this chart. |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. |
| image.repository | string | `"kestra/kestra"` | Image repository to use for deploying kestra |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| operator.apiKey | string | `""` |  |
| operator.basicAuth | string | `""` |  |
| operator.enabled | bool | `false` |  |
| operator.image | string | `"registry.kestra.io/docker/kestra-operator"` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.ports.http.containerPort | int | `8080` |  |
| service.ports.http.port | int | `8080` |  |
| service.ports.http.protocol | string | `"TCP"` |  |
| service.ports.http.targetPort | string | `"http"` |  |
| service.ports.management.containerPort | int | `8081` |  |
| service.ports.management.port | int | `8081` |  |
| service.ports.management.protocol | string | `"TCP"` |  |
| service.ports.management.targetPort | string | `"management"` |  |
| service.type | string | `"ClusterIP"` |  |

