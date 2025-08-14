{{/*
Expand the name of the chart.
*/}}
{{- define "kestra.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kestra.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kestra.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kestra.labels" -}}
app.kubernetes.io/name: {{ include "kestra.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "kestra.chart" . }}
{{- end -}}

{{/*
Selectors labels
*/}}
{{- define "kestra.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kestra.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "kestra.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kestra.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the content of MICRONAUT_CONFIG_FILES
*/}}
{{- define "kestra.micronautConfigFiles" -}}
{{- $files := list "/app/application.yml" }}
{{- range .Values.configurations.configmaps }}
  {{- $files = append $files (printf "/app/%s" .key) }}
{{- end }}
{{- range .Values.configurations.secrets }}
  {{- $files = append $files (printf "/app/%s" .key) }}
{{- end }}
{{- join "," $files }}
{{- end }}


{{/*
Renders a value that contains template.
Usage:
{{ include "kestra.extra-render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "kestra.extra-render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}

{{/*
Create kestra deployment based on all possible deployments
*/}}
{{- define "kestra.deployment" -}}
{{- $name := .Name -}}
{{- $type := .Type -}}
{{- $workergroupEnabled := .WorkerGroup }}
{{- $merged := .Merged -}}
{{- $global := .Global -}}
{{- $config := .Config }}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: "{{ include "kestra.fullname" $ }}-{{ $name }}"
  labels:
    {{- include "kestra.labels" $ | nindent 4 }}
    app.kubernetes.io/component: {{ $type }}
    {{- with $merged.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  annotations:
    {{- with $merged.annotations }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
spec:
  replicas: {{ $merged.replicas }}
  selector:
    matchLabels:
      {{- include "kestra.selectorLabels" $ | nindent 6 }}
      app.kubernetes.io/component: {{ $type }}
  strategy:
    {{- toYaml $merged.strategy | nindent 4 }}
  template:
    metadata:
      labels:
        {{- include "kestra.selectorLabels" $ | nindent 8 }}
        app.kubernetes.io/component: {{ $type }}
        {{- with $merged.podLabels }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      annotations:
        {{- with $merged.podAnnotations }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
    spec:
      serviceAccountName: {{ include "kestra.serviceAccountName" $ }}
      {{- if $merged.priorityClassName }}
      priorityClassName: {{ $merged.priorityClassName }}
      {{- end }}
      {{- if $global.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml $global.imagePullSecrets | nindent 8 }}
      {{- end }}
      terminationGracePeriodSeconds: {{ $merged.terminationGracePeriodSeconds }}
      {{- if $merged.podSecurityContext }}
      securityContext:
        {{- toYaml $merged.podSecurityContext | nindent 8 }}
      {{- end }}
      {{- if $merged.nodeSelector }}
      nodeSelector:
        {{- toYaml $merged.nodeSelector | nindent 8 }}
      {{- end }}
      {{- if $merged.affinity }}
      affinity:
        {{- toYaml $merged.affinity | nindent 8 }}
      {{- end }}
      {{- if $merged.tolerations }}
      tolerations:
        {{- with $global.common.tolerations }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
        {{- with $config.tolerations }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      {{- end }}
      volumes:
        - name: {{ template "kestra.fullname" $ }}-config
          configMap:
            name: {{ template "kestra.fullname" $ }}-config
            items:
              - key: application.yml
                path: application.yml
        {{- range $global.configurations.configmaps }}
        - name: {{ .name }}
          configMap:
            name: {{ .name }}
            items:
              - key: {{ .key }}
                path: {{ .key }}
        {{- end }}
        {{- range $global.configurations.secrets }}
        - name: {{ .name }}
          secret:
            secretName: {{ .name }}
            defaultMode: 0444
        {{- end }}
        {{- if $global.dind.enabled }}
        - name: docker-dind-socket
          emptyDir: {}
        - name: docker-tmp
          emptyDir: {}
        {{- end }}
        {{- if $merged.extraVolumes }}
          {{- with $global.common.extraVolumes }}
          {{- toYaml . | nindent 8 }}
          {{- end }}
          {{- with $config.extraVolumes }}
          {{- toYaml . | nindent 8 }}
          {{- end }}
        {{- end }}
      {{- if $merged.initContainers }}
      initContainers:
        {{- with $global.common.initContainers }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
        {{- with $config.initContainers }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      {{- end }}
      containers:
        - name: kestra-{{ $type }}
          image: "{{ $global.image.repository }}:{{ default $.Chart.AppVersion $global.image.tag }}"
          imagePullPolicy: {{ $global.image.pullPolicy }}
          command:
            - "sh"
            - "-c"
            - | 
                exec /app/kestra server {{ $type }} \
                {{- if and ($merged.workerThreads) (ne $type "worker") -}}
                --worker-thread={{ $merged.workerThreads }} \
                {{- end -}}
                {{- if and ($merged.workerThreads) (eq $type "worker") (eq $workergroupEnabled false) -}}
                --thread={{ $merged.workerThreads }} \
                {{- end -}}
                {{- if and ($merged.workerThreads) (eq $workergroupEnabled true) -}}
                --thread={{ $merged.workerThreads }} \
                {{- end -}}
                {{- if (eq $workergroupEnabled true) -}}
                --worker-group={{ $merged.name }} \
                {{- end -}}
                {{- range $merged.extraArgs -}}
                {{ . }} \
                {{- end -}}
          {{- if $merged.resources }}
          resources:
            {{- toYaml $merged.resources | nindent 12 }}
          {{- end }}
          env:
            - name: MICRONAUT_CONFIG_FILES
              value: {{ include "kestra.micronautConfigFiles" $ | quote }}
            {{- with $merged.extraEnv }}
              {{- with $global.common.extraEnv }}
              {{- toYaml . | nindent 12 }}
              {{- end }}
              {{- with $config.extraEnv }}
              {{- toYaml . | nindent 12 }}
              {{- end }}
            {{- end }}
          {{- with $merged.extraEnvFrom }}
          envFrom:
            {{- with $global.common.extraEnvFrom }}
            {{- toYaml . | nindent 12 }}
            {{- end }}
            {{- with $config.extraEnvFrom }}
            {{- toYaml . | nindent 12 }}
            {{- end }}
          {{- end }}
          volumeMounts:
            - name: {{ template "kestra.fullname" $ }}-config
              mountPath: /app/application.yml
              subPath: application.yml
            {{- range $global.configurations.configmaps }}
            - name: {{ .name }}
              mountPath: /app/{{ .key }}
              subPath: {{ .key }}
            {{- end }}
            {{- range $global.configurations.secrets }}
            - name: {{ .name }}
              mountPath: /app/{{ .key }}
              subPath: {{ .key }}
            {{- end }}
            {{- if $merged.extraVolumeMounts }}
              {{- with $global.common.extraVolumeMounts }}
              {{- toYaml . | nindent 12 }}
              {{- end }}
              {{- with $config.extraVolumeMounts }}
              {{- toYaml . | nindent 12 }}
              {{- end }}
            {{- end }}
          ports:
            {{- range $pname, $port := $global.service.ports }}
            - name: {{ $pname }}
              containerPort: {{ $port.containerPort }}
              protocol: {{ $port.protocol | default "TCP" }}
            {{- end }}
          {{- if $merged.securityContext }}
          securityContext:
            {{- toYaml $merged.securityContext | nindent 12 }}
          {{- end }}
          {{- if $merged.startupProbe }}
          startupProbe:
            {{- toYaml $merged.startupProbe | nindent 12 }}
          {{- end }}
          {{- if $merged.livenessProbe }}
          livenessProbe:
            {{- toYaml $merged.livenessProbe | nindent 12 }}
          {{- end }}
          {{- if $merged.readinessProbe }}
          readinessProbe:
            {{- toYaml $merged.readinessProbe | nindent 12 }}
          {{- end }}
        {{- if or (eq $type "standalone") (eq $type "worker") (eq $type "workergroup") }}
        {{- if $global.dind.enabled }}
        - name: {{ $.Chart.Name }}-{{ $type }}-docker-dind
          image: "{{ $global.dind.image.repository }}:{{ $global.dind.image.tag }}"
          imagePullPolicy: {{ $global.dind.image.pullPolicy }}
          args:
            {{- toYaml $global.dind.args | nindent 12 }}
          env:
            - name: DOCKER_HOST
              value: unix://{{ $global.dind.socketPath }}/docker.sock
            {{- if $global.dind.extraEnv }}
            {{ toYaml $global.dind.extraEnv | trim | nindent 12 }}
            {{ end }}
          securityContext:
            {{- if $global.dind.securityContext }}
            {{- toYaml $global.dind.securityContext | nindent 12 }}
            {{- end }}
          volumeMounts:
            {{- if $global.dind.extraVolumeMounts }}{{ toYaml $global.dind.extraVolumeMounts | trim | nindent 12 }}{{ end }}
            - name: docker-dind-socket
              mountPath: {{ $global.dind.socketPath }}
            - name: docker-tmp
              mountPath: {{ $global.dind.tmpPath }}
          resources:
            {{- toYaml $global.dind.resources | nindent 12 }}
        {{- end }}
        {{- end }}
        {{- range $merged.extraContainers }}
        - {{- toYaml . | nindent 10 }}
        {{- end }}
{{- end -}}
