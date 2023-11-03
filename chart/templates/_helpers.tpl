{{/* Common labels */}}
{{- define "common.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Common annotations for objects that must be created first.
     See https://helm.sh/docs/topics/charts_hooks/ for more ino on hooks specifics.
*/}}
{{- define "common.annotations" -}}
"helm.sh/hook": pre-install
"helm.sh/hook-delete-policy": hook-succeeded
{{- end }}
