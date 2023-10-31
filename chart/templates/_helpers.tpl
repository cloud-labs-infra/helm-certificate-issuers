{{- /*
Common labels

    we can't use top-level scope variables directly in ranges
    because leading dot points to loop-level scope here.
    the only solution - pass top-level scope as variable into define function

    https://github.com/helm/helm/issues/1054
    https://github.com/helm/helm/issues/3684
    https://helm.sh/docs/chart_template_guide/variables/
*/}}

{{- define "common.labels" -}}
helm.sh/chart: {{ .Name }}-{{ .Version | replace "+" "_" }}
{{- end }}

{{- define "common.annotations" -}}
"helm.sh/hook": pre-install
"helm.sh/hook-delete-policy": hook-succeeded
{{- end }}

{{- define "common.labelsrelease" -}}
app.kubernetes.io/managed-by: {{ .Service }}
app.kubernetes.io/instance: {{ .Name }}
{{- end }}
