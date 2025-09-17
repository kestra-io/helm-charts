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
{{- $files := list "/app/_default.yml" }}
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
