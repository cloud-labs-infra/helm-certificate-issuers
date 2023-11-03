# helm-certificate-issuers

Helm chart for deploying [cert-manager](https://cert-manager.io/)-based cluster-wide CA certificate issuers.

The current chart is based on the vendor's [instructions](https://cert-manager.io/docs/configuration/selfsigned/#bootstrapping-ca-issuers).

The chart currently supports 2 scenarios:

1. CA certificate for signing certificates and cluster-wide issuer are generated upon the chart deployment.
To go this way, make sure to set the value of `customCaCertUsed` to `false` in the [values.yaml](chart/values.yaml).
2. A custom CA certificate can be supplied via the `customCaCertSecretData` variable in the [values.yaml](chart/values.yaml).
Please make sure that `customCaCertUsed` is set to `true` and `tls.crt` & `tls.key` keys of `customCaCertSecretData`
are supplied with base64-encoded strings of the actual cert and its key.

Please note that certificate issuers are cluster-wide, meaning they do not belong to any namspace.
Whereas, Certificate and Secret objects are namespaced. Please specify a proper namespace when deploying this chart via the `--namespace` option.
Based on the aforementioned vendor's docs, `cert-manager` is considered a proper namespace for these objects.
