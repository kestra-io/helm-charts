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

# kestra

![Version: 0.24.1](https://img.shields.io/badge/Version-0.24.1-informational?style=flat-square) ![AppVersion: v0.24.1](https://img.shields.io/badge/AppVersion-v0.24.1-informational?style=flat-square)

Infinitely scalable, event-driven, language-agnostic orchestration and scheduling platform to manage millions of workflows declaratively in code.

**Homepage:** <https://kestra.io>

## Installing the Chart

To install the chart with the release name `my-kestra`:

```console
$ helm repo add kestra https://helm.kestra.io/
$ helm install my-kestra kestra/kestra --version 0.24.1
```

## Migration from 0.x.x to 1.0.0"

## Values

### common settings

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| common.affinity | object | `{}` | Affinity rules for pod scheduling. |
| common.annotations | object | `{}` | Annotations applied to all resources. |
| common.extraContainers | list | `[]` | Additional sidecar containers. |
| common.extraEnv | list | `[]` | Extra environment variables for containers. |
| common.extraEnvFrom | list | `[]` | Import environment variables from ConfigMaps/Secrets. |
| common.extraVolumeMounts | list | `[]` | Extra volume mounts to add to containers. |
| common.extraVolumes | list | `[]` | Extra volumes to add to pods. |
| common.initContainers | list | `[]` | Additional init containers to run before main container. |
| common.labels | object | `{}` | Labels applied to all resources. |
| common.livenessProbe | object | `{"failureThreshold":3,"httpGet":{"path":"/health/liveness","port":"management"},"initialDelaySeconds":0,"periodSeconds":5,"successThreshold":1,"timeoutSeconds":3}` | Liveness probe configuration for container health checks. |
| common.nodeSelector | object | `{}` | Node selector constraints for scheduling pods. |
| common.podAnnotations | object | `{}` | Annotations applied specifically to pods. |
| common.podLabels | object | `{}` | Labels applied specifically to pods. |
| common.podSecurityContext | object | `{}` | Security context settings for pods. |
| common.priorityClassName | string | `""` | Priority class for scheduling pods. |
| common.readinessProbe | object | `{"failureThreshold":3,"httpGet":{"path":"/health/readiness","port":"management"},"initialDelaySeconds":0,"periodSeconds":5,"successThreshold":1,"timeoutSeconds":3}` | Readiness probe configuration to determine pod availability. |
| common.replicas | int | `1` | Number of pod replicas to run. |
| common.resources | object | `{}` | Resource requests and limits for containers. |
| common.revisionHistoryLimit | int | `10` | Number of old ReplicaSets to retain for rollback. |
| common.securityContext | object | `{"runAsGroup":1000,"runAsUser":1000}` | Security context settings for containers. |
| common.startupProbe | object | `{"failureThreshold":120,"httpGet":{"path":"/health","port":"management"},"initialDelaySeconds":1,"periodSeconds":1,"successThreshold":1,"timeoutSeconds":1}` | Startup probe configuration to verify app starts correctly. |
| common.strategy | object | `{"rollingUpdate":{"maxSurge":1,"maxUnavailable":1},"type":"RollingUpdate"}` | Deployment update strategy (e.g., RollingUpdate, Recreate). |
| common.terminationGracePeriodSeconds | int | `60` | Grace period for pod termination. |
| common.tolerations | list | `[]` | Tolerations for scheduling pods on tainted nodes. |

### kestra configurations

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configurations.application | object | `{}` | Application configuration (Kestra settings, DB, storage, etc.). |
| configurations.configmaps | list | `[]` | Extra configmaps mounted as configuration files. |
| configurations.secrets | list | `[]` | Extra secrets mounted as configuration files. |

### kestra deployments

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployments.executor.enabled | bool | `false` | Enable executor in distributed mode. |
| deployments.executor.extraArgs | list | `[]` | Extra arguments to pass to the container. |
| deployments.indexer.enabled | bool | `false` | Enable indexer in distributed mode. |
| deployments.indexer.extraArgs | list | `[]` | Extra arguments to pass to the container. |
| deployments.scheduler.enabled | bool | `false` | Enable scheduler in distributed mode. |
| deployments.scheduler.extraArgs | list | `[]` | Extra arguments to pass to the container. |
| deployments.standalone.enabled | bool | `true` | Enable standalone Kestra deployment. |
| deployments.standalone.extraArgs | list | `[]` | Extra arguments to pass to the container. |
| deployments.standalone.workerThreads | int | `128` | Number of worker threads for standalone deployment. |
| deployments.webserver.enabled | bool | `false` | Enable webserver in distributed mode. |
| deployments.webserver.extraArgs | list | `[]` | Extra arguments to pass to the container. |
| deployments.worker.enabled | bool | `false` | Enable worker in distributed mode. |
| deployments.worker.extraArgs | list | `[]` | Extra arguments to pass to the container. |
| deployments.worker.workerThreads | int | `128` | Number of worker threads for worker deployment. |

### kestra dind insecure

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dind.base.insecure | object | `{"args":["--log-level=fatal"],"image":{"pullPolicy":"IfNotPresent","repository":"docker","tag":"dind-rootless"},"securityContext":{"allowPrivilegeEscalation":true,"capabilities":{"add":["SYS_ADMIN","NET_ADMIN","DAC_OVERRIDE","SETUID","SETGID"]},"privileged":true,"runAsGroup":0,"runAsUser":0}}` | Insecure dind configuration (privileged). |

### kestra dind rootless

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dind.base.rootless | object | `{"args":["--log-level=fatal","--group=1000"],"image":{"pullPolicy":"IfNotPresent","repository":"docker","tag":"dind-rootless"},"securityContext":{"privileged":true,"runAsGroup":1000,"runAsUser":1000}}` | Rootless dind configuration. |

### kestra dind

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dind.enabled | bool | `true` | Enable Docker-in-Docker (dind) sidecar. |
| dind.extraEnv | list | `[]` | Extra environment variables for dind container. |
| dind.mode | string | `"rootless"` | Dind mode (rootless or insecure). |
| dind.resources | object | `{}` | Resource requests and limits for dind sidecar. |
| dind.socketPath | string | `"/dind/"` | Path where dind socket is mounted. |
| dind.tmpPath | string | `"/tmp/"` | Path for temporary storage in dind. |

### image settings

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `"IfNotPresent"` | Policy for pulling container images (Always, IfNotPresent, Never). |
| image.repository | string | `"kestra/kestra"` | Image repository to use for deploying kestra. |
| image.tag | string | `""` | Overrides the image tag (defaults to chart appVersion). |
| imagePullSecrets | list | `[]` | References to secrets for pulling images from private registries. |

### kubernetes ingress

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ingress.annotations | object | `{}` | Annotations to add to the Ingress. |
| ingress.className | string | `""` | IngressClass name to use. |
| ingress.enabled | bool | `false` | Enable Ingress resource. |
| ingress.hosts | list | `[]` | Hosts and paths for Ingress routing. |
| ingress.tls | list | `[]` | TLS configuration for Ingress. |

### kestra service

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| service.annotations | object | `{}` | Annotations to apply to the Service. |
| service.labels | object | `{}` | Labels to apply to the Service. |
| service.ports.http | object | `{"containerPort":8080,"port":8080,"protocol":"TCP","targetPort":"http"}` | HTTP service port mapping. |
| service.ports.management | object | `{"containerPort":8081,"port":8081,"protocol":"TCP","targetPort":"management"}` | Management (metrics/health) service port mapping. |
| service.type | string | `"ClusterIP"` | Kubernetes Service type (ClusterIP, NodePort, LoadBalancer). |

### kubernetes serviceAccount

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| serviceAccount.annotations | object | `{}` | Annotations to add to the ServiceAccount. |
| serviceAccount.automount | bool | `true` | Automatically mount API credentials to pods. |
| serviceAccount.create | bool | `true` | Specifies whether to create a ServiceAccount. |
| serviceAccount.name | string | `""` | Name of the ServiceAccount to use. |

### kestra workerGroups

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| workerGroups | list | `[]` | EE only - Define additional worker groups with custom settings. |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraManifests | list | `[]` | Extra Kubernetes manifests to deploy with the chart. |
| fullnameOverride | string | `""` |  |
| nameOverride | string | `""` |  |

## Documentation
* Full documentation can be found under [kestra.io/docs](https://kestra.io/docs)
* Deployment on Kubernetes documentation can be found [here](https://kestra.io/docs/installation/kubernetes)

## License
Apache 2.0 © [Kestra Technologies](https://kestra.io)

## Stay up to date

We release new versions every month. Give the [main repository](https://github.com/kestra-io/kestra) a star to stay up to date with the latest releases and get notified about future updates.

![Star the repo](https://kestra.io/star.gif)
