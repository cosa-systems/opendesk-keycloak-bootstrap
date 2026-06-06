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
Find possible existing secret name/key-pairs and determine volume or volumeMount.
Walks the given subtree recursively so an `existingSecret` is found at any depth
(e.g. a client's `secret.existingSecret`), mirroring provisionValuesYaml.py which
resolves existingSecret references recursively. The previous implementation only
matched `existingSecret` as a *direct* key of each client, so nested references
were never mounted and provisionValuesYaml.py then failed with FileNotFoundError.
*/}}
{{- define "preparePossibleExistingSecret" -}}
{{- $where := index . "where" -}}
{{- $what := printf "determine.%s" (index . "what") -}}
{{- include "collectExistingSecrets" (dict "node" $where "what" $what) -}}
{{- end }}

{{/*
Recursive worker for preparePossibleExistingSecret: for every map that carries an
`existingSecret` name/key-pair, emit the requested section ($what) for that pair;
otherwise descend into the map/list values.
*/}}
{{- define "collectExistingSecrets" -}}
{{- $node := index . "node" -}}
{{- $what := index . "what" -}}
{{- if kindIs "map" $node }}
{{- if hasKey $node "existingSecret" }}
{{- include $what (index $node "existingSecret") }}
{{- else }}
{{- range $node }}
{{- include "collectExistingSecrets" (dict "node" . "what" $what) }}
{{- end }}
{{- end }}
{{- else if kindIs "slice" $node }}
{{- range $node }}
{{- include "collectExistingSecrets" (dict "node" . "what" $what) }}
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
{{- $volName := include "volumeName" (list .name .key) }}
- name: {{ $volName | quote }}
  secret:
    secretName: {{ .name | quote }}
{{- end }}

{{/*
Sanitised name - return a valid and sanitised name for the volume
*/}}
{{- define "sanitisedName" -}}
{{- regexReplaceAll "\\W+" (printf "%s %s" (index . 0) (index . 1)) "-" }}
{{- end }}

{{/*
Volume name for a secret name/key pair: a valid RFC 1123 label (lowercase
alphanumerics and '-', max 63 chars). Distinct from sanitisedName, which is used
for the mountPath and must match the path provisionValuesYaml.py reads (so it keeps
the secret/key casing + underscores that are illegal in a Kubernetes object name).
*/}}
{{- define "volumeName" -}}
{{- $raw := trimAll "-" (regexReplaceAll "[^a-z0-9]+" (lower (printf "%s-%s" (index . 0) (index . 1))) "-") -}}
{{- if gt (len $raw) 63 -}}
{{- printf "%s-%s" (trimSuffix "-" (trunc 52 $raw)) (sha1sum $raw | trunc 10) -}}
{{- else -}}
{{- $raw -}}
{{- end -}}
{{- end }}
