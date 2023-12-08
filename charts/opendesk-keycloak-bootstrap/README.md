<!--
SPDX-FileCopyrightText: 2023 Bundesministerium des Innern und für Heimat, PG ZenDiS "Projektgruppe für Aufbau ZenDiS"
SPDX-License-Identifier: Apache-2.0
-->
# opendesk-keycloak-bootstrap

This helm chart contains a bootstrap job for configuration of the Keycloak within openDesk

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add opendesk-keycloak-bootstrap https://gitlab.souvap-univention.de/api/v4/projects/173/packages/helm/stable
helm install my-release opendesk-keycloak-bootstrap/opendesk-keycloak-bootstrap
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.souvap-univention.de/souvap/tooling/charts/bitnami-charts | common | ^2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalAnnotations | object | `{}` | Additional custom annotations to add to all deployed objects. |
| additionalLabels | object | `{}` | Additional custom labels to add to all deployed objects. |
| affinity | object | `{}` | Affinity for pod assignment Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity Note: podAffinityPreset, podAntiAffinityPreset, and  nodeAffinityPreset will be ignored when it's set |
| cleanup.deletePodsOnSuccess | bool | `false` | Keep Pods/Job logs after successful run. |
| cleanup.keepPVCOnDelete | bool | `false` | Keep persistence on delete of this release. |
| config.custom.clientScopes | list | `[]` | Create client scopes based on a YAML version of Keycloak's JSON config format |
| config.custom.clients | list | `[]` | Create clients based on a YAML version of Keycloak's JSON config format |
| config.debug.enabled | bool | `false` | Enable debug output of included Ansible scripts |
| config.debug.pauseBeforeScriptStart | int | `0` | Seconds for the job to pause before starting the actual bootstrapping. |
| config.keycloak.adminPassword | string | `""` | The Keycloak master realm admin user's password as input for the secret |
| config.keycloak.adminUser | string | `"kcadmin"` | The Keycloak master realm admin user |
| config.keycloak.realm | string | `"opendesk"` | The name of the realm that is going to contain all the configuration |
| config.realmSettings.accessTokenLifespan | int | `300` | Please lookup "Access Token Lifespan" in https://www.keycloak.org/docs/latest/server_admin/ for the latest upstream documentation. |
| config.realmSettings.rememberMe | bool | `true` | Enable "Remember Me" option making the user's Keycloak session persistant based on the RememberMe related parameters below |
| config.realmSettings.ssoSessionIdleTimeout | int | `14400` | Please lookup "SSO Session Idle" in https://www.keycloak.org/docs/latest/server_admin/ for the latest upstream documentation. |
| config.realmSettings.ssoSessionIdleTimeoutRememberMe | int | `28800` | Please lookup "SSO Session Idle Remember Me" in https://www.keycloak.org/docs/latest/server_admin/ for the latest upstream documentation. |
| config.realmSettings.ssoSessionMaxLifespan | int | `57600` | Please lookup "SSO Session Max" in https://www.keycloak.org/docs/latest/server_admin/ for the latest upstream documentation. |
| config.realmSettings.ssoSessionMaxLifespanRememberMe | int | `1209600` | Please lookup "SSO Session Max Remember Me" in https://www.keycloak.org/docs/latest/server_admin/ for the latest upstream documentation. |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Enable container privileged escalation. |
| containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | Security capabilities for container. |
| containerSecurityContext.enabled | bool | `true` | Enable security context. |
| containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Mounts the container's root filesystem as read-only. |
| containerSecurityContext.runAsGroup | int | `1000` | Process group id. |
| containerSecurityContext.runAsNonRoot | bool | `true` | Run container as a user. |
| containerSecurityContext.runAsUser | int | `1000` | Process user id. |
| containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` | Disallow custom Seccomp profile by setting it to RuntimeDefault. |
| extraEnvVars | list | `[]` | Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"  |
| extraVolumeMounts | list | `[]` | Optionally specify an extra list of additional volumeMounts. |
| extraVolumes | list | `[]` | Optionally specify an extra list of additional volumes. |
| global.domain | string | `"example.org"` | The Top-Level-Domain (TLD) name which is used in f.e. in Ingress component. |
| global.hosts.keycloak | string | `"id"` | Subdomain for Keycloak, results in "https://{{ keycloak }}.{{ domain }}". |
| global.imagePullSecrets | list | `[]` | Credentials to fetch images from private registry Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| global.registry | string | `"registry.souvap-univention.de"` | Container registry address. |
| image.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. If the kubelet has a container image with that exact digest cached             locally, the kubelet uses its cached image; otherwise, the kubelet pulls the image with the resolved             digest, and uses that image to launch the container. "Never" => The kubelet does not try fetching the image. If the image is somehow already present locally, the            kubelet attempts to start the container; otherwise, startup fails  |
| image.registry | string | `""` | Container registry address. This setting has higher precedence than global.registry. |
| image.repository | string | `"souvap/tooling/images/opendesk-keycloak-bootstrap"` | Container repository string. |
| image.tag | string | `"1.0.0"` | Define image tag. |
| imagePullSecrets | list | `[]` | Credentials to fetch images from private registry Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| nodeSelector | object | `{}` | Node labels for pod assignment Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| podAnnotations | object | `{}` | Pod Annotations. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podLabels | object | `{}` | Pod Labels. Ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| podSecurityContext.enabled | bool | `true` | Enable security context. |
| podSecurityContext.fsGroup | int | `1000` | If specified, all processes of the container are also part of the supplementary group. |
| podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Change ownership and permission of the volume before being exposed inside a Pod. |
| resources.limits.memory | string | `"1Gi"` | The max amount of RAM to consume. |
| resources.requests.cpu | string | `"100m"` | The amount of CPUs which has to be available on the scheduled node. |
| resources.requests.memory | string | `"256Mi"` | The amount of RAM which has to be available on the scheduled node. |
| serviceAccount.annotations | object | `{}` | Additional custom annotations for the ServiceAccount. |
| serviceAccount.automountServiceAccountToken | bool | `false` | Allows auto mount of ServiceAccountToken on the serviceAccount created. Can be set to false if pods using this serviceAccount do not need to use K8s API. |
| serviceAccount.create | bool | `true` | Enable creation of ServiceAccount for pod. |
| serviceAccount.labels | object | `{}` | Additional custom labels for the ServiceAccount. |
| terminationGracePeriodSeconds | string | `""` | In seconds, time the given to the pod needs to terminate gracefully. Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| tolerations | list | `[]` | Tolerations for pod assignment Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| topologySpreadConstraints | list | `[]` | Topology spread constraints rely on node labels to identify the topology domain(s) that each Node is in Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/  topologySpreadConstraints:   - maxSkew: 1     topologyKey: failure-domain.beta.kubernetes.io/zone     whenUnsatisfiable: DoNotSchedule |

## Uninstalling the Chart

To install the release with name `my-release`:

```bash
helm uninstall my-release
```

## Signing

### Chart

Helm charts are signed with helm native signing method. You can verify the charts against this GPG key:

```
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
XD85LYkPgsax8WY=
=cFEh
-----END PGP PUBLIC KEY BLOCK-----
```

### Images

Container images are signed via [cosign](https://github.com/sigstore/cosign) and can be verified with:

```
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAETIpFd4qC4ThMC4PmFIPulqFVhfD/
1ujC+TfS7hTH7X06tleO6a2Gl2Vkn0k88A4LDmvFfNFoHRnEhVsjcLDNDw==
-----END PUBLIC KEY-----

```

```
cosign verify --key cosign.pub --insecure-ignore-tlog <image>
```

## License

This project uses the following license: Apache-2.0

## Copyright

Copyright © 2023 Bundesministerium des Innern und für Heimat, PG ZenDiS "Projektgruppe für Aufbau ZenDiS"
