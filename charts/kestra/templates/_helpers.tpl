{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "kestra.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kestra.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Component | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name .Chart.Name .Component | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kestra.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "kestra.labels" -}}
app.kubernetes.io/name: {{ include "kestra.name" . }}
app.kubernetes.io/component: {{ .Component }}
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
{{- define "kestra.selectorsLabels" -}}
app.kubernetes.io/name: {{ include "kestra.name" . }}
app.kubernetes.io/component: {{ .Component }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Form the Elasticsearch URL.
*/}}
{{- define "kestra.elasticsearch.url" }}
{{- $port := .Values.elasticsearch.httpPort | toString }}
{{- printf "%s://%s:%s" .Values.elasticsearch.protocol (include "elasticsearch.uname" (dict "Values" $.Values.elasticsearch)) $port }}
{{- end -}}

{{/*
Form the Kafka URL.
*/}}
{{- define "kestra.kafka.url" }}
{{- printf "%s-%s:%s" .Release.Name "kafka" "9092" -}}
{{- end -}}

{{/*
Form the Minio URL.
*/}}
{{- define "kestra.minio.url" }}
{{- printf "%s-%s" .Release.Name "minio" -}}
{{- end -}}

{{/*
Form the Postgres URL.
*/}}
{{- define "kestra.postgres.url" }}
{{- $port := $.Values.postgresql.primary.service.ports.postgresql | toString }}
{{- printf "%s-%s:%s" .Release.Name "postgresql" $port -}}
{{- end -}}

{{/*
k8s-config vars
*/}}
{{- define "kestra.k8s-config" -}}
{{- if .Values.postgresql.enabled }}
datasources:
  postgres:
    url: jdbc:postgresql://{{ include "kestra.postgres.url" . }}/{{ .Values.postgresql.auth.database }}
    driverClassName: org.postgresql.Driver
    username: {{ .Values.postgresql.auth.username }}
    password: {{ .Values.postgresql.auth.password }}
{{ end }}
{{- if or .Values.elasticsearch.enabled .Values.kafka.enabled .Values.postgresql.enabled .Values.minio.enabled -}}
kestra:
{{- if .Values.elasticsearch.enabled }}
  repository:
    type: elasticsearch
  elasticsearch:
    client:
      http-hosts: {{ include "kestra.elasticsearch.url" . }}
{{- end }}
{{- if .Values.kafka.enabled }}
  queue:
    type: kafka
  kafka:
    client:
      properties:
        bootstrap.servers: {{ include "kestra.kafka.url" . }}
{{- end }}
{{- if .Values.postgresql.enabled }}
  queue:
    type: postgres
  repository:
    type: postgres
{{- end }}
{{- if .Values.minio.enabled }}
  storage:
    type: minio
    minio:
      endpoint: {{ include "kestra.minio.url" . }}
      port: 9000
      access-key: {{ .Values.minio.rootUser }}
      secret-key: {{ .Values.minio.rootPassword }}
      secure: false
      bucket: kestra
{{- end }}
{{- end -}}
{{- end -}}

{{/*
Env vars
*/}}
{{- define "kestra.configurationPath" -}}
{{- $configurations := list -}}

{{- if .Values.configurationPath -}}
{{- $configurations = append $configurations $.Values.configurationPath }}
{{- else }}
  {{- if $.Values.configuration }}{{ $configurations = append $configurations "/app/confs/application.yml" }}{{- end }}
  {{- if $.Values.secrets }}{{ $configurations = append $configurations "/app/secrets/application-secrets.yml" }}{{- end }}
  {{- if include "kestra.k8s-config" $ }}{{ $configurations = append $configurations "/app/secrets/application-k8s.yml" }}{{- end }}
{{- end -}}

- name: MICRONAUT_CONFIG_FILES
  value: {{ join "," $configurations }}

{{- end -}}

