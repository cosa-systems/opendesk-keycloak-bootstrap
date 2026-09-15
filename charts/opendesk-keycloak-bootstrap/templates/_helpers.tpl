{{/*
SPDX-FileCopyrightText: 2024-2025 Zentrum für Digitale Souveränität der Öffentlichen Verwaltung (ZenDiS) GmbH
SPDX-FileCopyrightText: 2023 Bundesministerium des Innern und für Heimat, PG ZenDiS "Projektgruppe für Aufbau ZenDiS"
SPDX-License-Identifier: Apache-2.0
*/}}
{{/*
Expand the name of the chart.
*/}}
{{- define "swp-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "swp-helm.fullname" -}}
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
{{- define "swp-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "swp-helm.labels" -}}
helm.sh/chart: {{ include "swp-helm.chart" . }}
{{ include "swp-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "swp-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "swp-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "swp-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "swp-helm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Find possible existing secret name/key-pair and determine volume or volumeMount
*/}}
{{- define "preparePossibleExistingSecret" -}}
{{- $where := index . "where" -}}
{{- $whatArg := index . "what" -}}
{{- $what := printf "determine.%s" $whatArg -}}
{{- range $where }}
{{- if and . (kindIs "map" .) }}
{{- if hasKey . "existingSecret" }}
{{- if and (kindIs "map" .existingSecret) .existingSecret.name .existingSecret.key }}
{{- include $what .existingSecret }}
{{- end }}
{{- else }}
{{- include "preparePossibleExistingSecret" (dict "where" . "what" $whatArg) }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Determine volumeMount - build the 'volumeMount' section according to the name/key-pair
*/}}
{{- define "determine.mount" -}}
{{- $sanitisedName := include "sanitisedName" (list .name .key) }}
- mountPath: {{ printf "/app/secrets/%s" $sanitisedName | quote }}
  name: {{ include "volumeName" (list .name .key) | quote }}
  subPath: {{ .key | quote }}
{{- end }}

{{/*
Determine volume - build the 'volume' section according to the name/key-pair
*/}}
{{- define "determine.volume" -}}
{{- $volumeName := include "volumeName" (list .name .key) }}
- name: {{ $volumeName | quote }}
  secret:
    secretName: {{ .name | quote }}
{{- end }}

{{/*
Sanitised name - the file name below /app/secrets that the key is mounted at. The bootstrap image
derives the same name from the name/key-pair (sanitisedName() in provisionValuesYaml.py), so this
must stay in sync with it.
*/}}
{{- define "sanitisedName" -}}
{{- regexReplaceAll "\\W+" (printf "%s %s" (index . 0) (index . 1)) "-" }}
{{- end }}

{{/*
Volume name - a DNS label for the name/key-pair: lower case alphanumerics and dashes, at most
63 characters. Secret keys are not DNS labels (upper case and underscores are common), so fold
everything else to dashes; a pair that is still too long keeps a prefix plus a hash of the full
pair, so two long keys with a common prefix never collide.
*/}}
{{- define "volumeName" -}}
{{- $full := printf "%s %s" (index . 0) (index . 1) | lower -}}
{{- $name := regexReplaceAll "[^a-z0-9]+" $full "-" | trimAll "-" -}}
{{- if gt (len $name) 63 -}}
{{- printf "%s-%s" (trunc 54 $name | trimSuffix "-") (sha256sum $full | trunc 8) -}}
{{- else -}}
{{- $name -}}
{{- end -}}
{{- end }}
