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

## Values

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>common.affinity</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>common annotations to be added to all deployments types</td>
		</tr>
		<tr>
			<td>common.extraContainers</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.extraEnv</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.extraEnvFrom</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.extraVolumeMounts</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.extraVolumes</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.initContainers</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.labels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.livenessProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.livenessProbe.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/health/liveness"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.livenessProbe.httpGet.port</td>
			<td>string</td>
			<td><pre lang="json">
"management"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.livenessProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
0
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.livenessProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.livenessProbe.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.livenessProbe.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>common annotations to be added to all pods from deployments types</td>
		</tr>
		<tr>
			<td>common.podLabels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.podSecurityContext</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.readinessProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.readinessProbe.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/health/readiness"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.readinessProbe.httpGet.port</td>
			<td>string</td>
			<td><pre lang="json">
"management"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.readinessProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
0
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.readinessProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.readinessProbe.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.readinessProbe.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.replicas</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.securityContext.runAsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.securityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.startupProbe.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
120
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.startupProbe.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/health"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.startupProbe.httpGet.port</td>
			<td>string</td>
			<td><pre lang="json">
"management"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.startupProbe.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.startupProbe.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.startupProbe.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.startupProbe.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.strategy.rollingUpdate.maxSurge</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.strategy.rollingUpdate.maxUnavailable</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.strategy.type</td>
			<td>string</td>
			<td><pre lang="json">
"RollingUpdate"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.terminationGracePeriodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
60
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>common.tolerations</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>configurations.application</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>configurations.configmaps</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>configurations.secrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>deployments.executor.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Whether to deploy kestra in distributed mode, executor will be deployed.</td>
		</tr>
		<tr>
			<td>deployments.indexer.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Whether to deploy kestra in distributed mode, indexer will be deployed.</td>
		</tr>
		<tr>
			<td>deployments.scheduler.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Whether to deploy kestra in distributed mode, scheduler will be deployed.</td>
		</tr>
		<tr>
			<td>deployments.standalone.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>deployments.standalone.workerThreads</td>
			<td>int</td>
			<td><pre lang="json">
128
</pre>
</td>
			<td>By default, we start a number of threads of two times the number of available processors, use 'workerThreads' to configure a different value.</td>
		</tr>
		<tr>
			<td>deployments.webserver.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Whether to deploy kestra in distributed mode, webserver will be deployed.</td>
		</tr>
		<tr>
			<td>deployments.worker.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Whether to deploy kestra in distributed mode, worker will be deployed.</td>
		</tr>
		<tr>
			<td>deployments.worker.workerThreads</td>
			<td>int</td>
			<td><pre lang="json">
128
</pre>
</td>
			<td>By default, we start a number of threads of two times the number of available processors, use 'workerThreads' to configure a different value.</td>
		</tr>
		<tr>
			<td>deployments.workerGroups.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>deployments.workerGroups.items</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.args[0]</td>
			<td>string</td>
			<td><pre lang="json">
"--log-level=fatal"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.args[1]</td>
			<td>string</td>
			<td><pre lang="json">
"--group=1000"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.extraEnv</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.extraVolumeMounts</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"IfNotPresent"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"docker"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"dind-rootless"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.securityContext.runAsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.securityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.socketPath</td>
			<td>string</td>
			<td><pre lang="json">
"/dind/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>dind.tmpPath</td>
			<td>string</td>
			<td><pre lang="json">
"/tmp/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>extraManifests</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>You can specify extra manifests to be deployed with this chart.</td>
		</tr>
		<tr>
			<td>fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"IfNotPresent"
</pre>
</td>
			<td>This sets the pull policy for images.</td>
		</tr>
		<tr>
			<td>image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"kestra/kestra"
</pre>
</td>
			<td>Image repository to use for deploying kestra</td>
		</tr>
		<tr>
			<td>image.tag</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Overrides the image tag whose default is the chart appVersion.</td>
		</tr>
		<tr>
			<td>imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.className</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.hosts</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.tls</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>operator.apiKey</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>operator.basicAuth</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>operator.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>operator.image</td>
			<td>string</td>
			<td><pre lang="json">
"registry.kestra.io/docker/kestra-operator"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.labels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports.http.containerPort</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports.http.port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports.http.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports.http.targetPort</td>
			<td>string</td>
			<td><pre lang="json">
"http"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports.management.containerPort</td>
			<td>int</td>
			<td><pre lang="json">
8081
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports.management.port</td>
			<td>int</td>
			<td><pre lang="json">
8081
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports.management.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.ports.management.targetPort</td>
			<td>string</td>
			<td><pre lang="json">
"management"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>service.type</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterIP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceAccount.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Annotations to add to the service account</td>
		</tr>
		<tr>
			<td>serviceAccount.automount</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Automatically mount a ServiceAccount's API credentials?</td>
		</tr>
		<tr>
			<td>serviceAccount.create</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Specifies whether a service account should be created</td>
		</tr>
		<tr>
			<td>serviceAccount.name</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The name of the service account to use. If not set and create is true, a name is generated using the fullname template</td>
		</tr>
	</tbody>
</table>

