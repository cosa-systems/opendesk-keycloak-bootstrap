<!--
SPDX-FileCopyrightText: 2023 Bundesministerium des Innern und für Heimat, PG ZenDiS "Projektgruppe für Aufbau ZenDiS"
SPDX-License-Identifier: Apache-2.0
-->
# opendesk-keycloak-bootstrap

This helm chart contains a bootstrap job for configuration of the Keycloak within openDesk

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add opendesk-keycloak-bootstrap https://gitlab.opencode.de/api/v4/projects/1380/packages/helm/stable
helm install my-release opendesk-keycloak-bootstrap/opendesk-keycloak-bootstrap
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.opencode.de/bmi/opendesk/components/external/charts/bitnami-charts | common | ^2.x.x |

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
| config.keycloak.intraCluster.enabled | bool | `true` | Enable internal communication |
| config.keycloak.intraCluster.internalBaseUrl | string | `"http://ums-keycloak:8080"` | Internal hostname including protocol and port Currently only http and https with valid certificates are supported. |
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

Helm charts are signed with helm native signing method.

You can verify the chart against [the public GPG key](../../files/gpg-pubkeys/opendesk.gpg).

## License

This project uses the following license: Apache-2.0

## Copyright

Copyright © 2023 Bundesministerium des Innern und für Heimat, PG ZenDiS "Projektgruppe für Aufbau ZenDiS"
