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
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
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
Form the Elasticsearch URL.
*/}}
{{- define "kestra.kafka.url" }}
{{- printf "%s-%s:%s" .Release.Name "kafka" "9092" -}}
{{- end -}}


{{/*
Env vars
*/}}
{{- define "kestra.env" -}}

{{- if .Values.elasticsearch.enabled -}}
- name: KESTRA_REPOSITORY_TYPE
  value: "elasticsearch"
- name: ELASTICSEARCH_HTTP_HOSTS
  value: {{ include "kestra.elasticsearch.url" . }}
{{ end }}

{{- if .Values.kafka.enabled -}}
- name: KESTRA_QUEUE_TYPE
  value: "kafka"
- name: KESTRA_KAFKA_CLIENT_PROPERTIES_BOOTSTRAP_SERVERS
  value: {{ include "kestra.kafka.url" . }}
{{ end }}

{{- end -}}


