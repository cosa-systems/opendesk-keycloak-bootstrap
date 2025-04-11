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
| cleanup.deletePodsOnSuccessTimeout | int | `1800` | Keep Pods/Job logs for following time. |
| cleanup.keepPVCOnDelete | bool | `false` | Keep persistence on delete of this release. |
| config.clientAccessRestrictions | object | `{}` | Most applications do not implement OIDC based authorization yet. To block access to an application it is possible to provide the OIDC claims (defined within a given OIDC scope) required by the application based only when the user is member of a defined group. This can be configured here. The `applicationIdentifier` can be freely chosen, you then need to define the names of the OIDC `client` and `scope`, the `group` defines which membership a user must have to allow the `scope` to be part of the OIDC token. And the `role` is the Keycloak internal role name required the is required to setup the mapping between group membership and scope permission. ``` applicationIdentifier:   client: "opendesk-matrix"   scope: "opendesk-matrix-scope"   group: "managed-by-attribute-Livecollaboration"   role: "opendesk-matrix-access-control" |
| config.custom.clientScopes | list | `[]` | Create client scopes based on a YAML version of Keycloak's JSON config format |
| config.custom.clients | list | `[]` | Create clients based on a YAML version of Keycloak's JSON config format |
| config.debug.enabled | bool | `false` | Enable debug output of included Ansible scripts |
| config.debug.pauseBeforeScriptStart | int | `0` | Seconds for the job to pause before starting the actual bootstrapping. |
| config.keycloak.admin.secret.name | string | `""` | password: |
| config.keycloak.admin.values.password | string | `""` | The Keycloak master realm admin user's password as input for the secret |
| config.keycloak.admin.values.username | string | `"kcadmin"` | The Keycloak master realm admin user |
| config.keycloak.intraCluster.enabled | bool | `true` | Enable internal communication |
| config.keycloak.intraCluster.internalBaseUrl | string | `"http://ums-keycloak:8080"` | Internal hostname including protocol and port Currently only http and https with valid certificates are supported. |
| config.keycloak.realm | string | `"opendesk"` | The name of the realm that is going to contain all the configuration |
| config.managed.clientScopes | list | `["acr","web-origins","email","profile","microprofile-jwt","role_list","offline_access","roles","address","phone"]` | Managed client scopes that should be kept during reconciliation. |
| config.managed.clients | list | `["UMC","guardian-management-api","guardian-scripts","guardian-ui","${client_account}","${client_account-console}","${client_admin-cli}","${client_broker}","${client_realm-management}","${client_security-admin-console}"]` | Managed clients that should be kept during reconciliation. |
| config.opendesk.clientScopes | list | `[]` | Create client scopes based on a YAML version of Keycloak's JSON config format |
| config.opendesk.clients | list | `[]` | Create clients based on a YAML version of Keycloak's JSON config format |
| config.precreateGroups | list | `["Domain Admins","Domain Users"]` | Groups that will be pre-created in Keycloak to avoid race conditions when first users login to an openDesk deployment in parallel and Keycloak tries to create the groups in parallel as well resulting in a `org.keycloak.models.ModelDuplicateException: Duplicate resource error` |
| config.realmSettings.accessCodeLifespan | int | `60` | Setting the realm wide value using Keycloak's REST API |
| config.realmSettings.accessCodeLifespanLogin | int | `1800` | Setting the realm wide value using Keycloak's REST API |
| config.realmSettings.accessCodeLifespanUserAction | int | `300` | Setting the realm wide value using Keycloak's REST API |
| config.realmSettings.accessTokenLifespan | int | `300` | Ref.: "Access Token Lifespan" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.accessTokenLifespanForImplicitFlow | int | `900` | Ref.: "Access Token Lifespan For Implicit Flow" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.actionTokenGeneratedByAdminLifespan | int | `43200` | Setting the realm wide value using Keycloak's REST API |
| config.realmSettings.actionTokenGeneratedByUserLifespan | int | `300` | Setting the realm wide value using Keycloak's REST API |
| config.realmSettings.clientOfflineSessionIdleTimeout | int | `0` | Ref.: "Client Offline Session Idle" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.clientOfflineSessionMaxLifespan | int | `0` | Ref.: "Client Offline Session Max" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.clientSessionIdleTimeout | int | `0` | Ref.: "Client Session Idle" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.clientSessionMaxLifespan | int | `0` | Ref.: "Client Session Max" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.oauth2DeviceCodeLifespan | int | `600` | Setting the realm wide value using Keycloak's REST API |
| config.realmSettings.oauth2DevicePollingInterval | int | `5` | Setting the realm wide value using Keycloak's REST API |
| config.realmSettings.offlineSessionIdleTimeout | int | `2592000` | Ref.: "Offline Session Idle" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.offlineSessionMaxLifespan | int | `5184000` | Ref.: "Offline Session Max" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.offlineSessionMaxLifespanEnabled | bool | `false` | Ref.: "Offline Session Max Limited" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.refreshTokenMaxReuse | int | `0` | Setting the realm wide value using Keycloak's REST API |
| config.realmSettings.rememberMe | bool | `true` | Enable "Remember Me" option making the user's Keycloak session persistant based on the RememberMe related parameters below |
| config.realmSettings.revokeRefreshToken | bool | `false` | Ref.: "Revoke Refresh Token" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.ssoSessionIdleTimeout | int | `14400` | Ref.: "SSO Session Idle" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.ssoSessionIdleTimeoutRememberMe | int | `28800` | Ref.: "SSO Session Idle Remember Me" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.ssoSessionMaxLifespan | int | `57600` | Ref.: "SSO Session Max" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.realmSettings.ssoSessionMaxLifespanRememberMe | int | `1209600` | Ref.: "SSO Session Max Remember Me" in https://www.keycloak.org/docs/latest/server_admin/ |
| config.ssoFederation.enabled | bool | `false` | Enable SSO federation |
| config.ssoFederation.enforceFederatedLogin | bool | `false` | Enforce login using the SSO federation disables the local Keycloak login (for the realm) |
| config.ssoFederation.idpDetails | string | `nil` | Details of the IdP Configuration |
| config.ssoFederation.name | string | `"My upstream IdP"` | Name of the SSO federation, is shown in the local login dialog as login option |
| config.twoFactorSettings.additionalGroups | list | `[]` | Enable 2FA for given LDAP group(s), just use group Names like `Domain Admin` etc. this requires the name of Keycloak's 2FA roles to be provided as well, see `roleName`. Note: This does not remove 2FA for groups. |
| config.twoFactorSettings.roleName | string | `"2FA role"` | You must provide Keycloak's 2FA role name when enabling 2FA for groups using the `2faGroups` Array. |
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
| global.hosts.intercomService | string | `"ics"` | Subdomain for Intercom Service, results in "https://{{ intercomservice }}.{{ domain }}". |
| global.hosts.keycloak | string | `"id"` | Subdomain for Keycloak, results in "https://{{ keycloak }}.{{ domain }}". |
| global.hosts.portal | string | `"portal"` | Subdomain for openDesk portal, results in "https://{{ portal }}.{{ domain }}". |
| global.imagePullSecrets | list | `[]` | Credentials to fetch images from private registry Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"  |
| global.registry | string | `"registry.opencode.de"` | Container registry address. |
| image.imagePullPolicy | string | `"IfNotPresent"` | Define an ImagePullPolicy.  Ref.: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy  "IfNotPresent" => The image is pulled only if it is not already present locally. "Always" => Every time the kubelet launches a container, the kubelet queries the container image registry to             resolve the name to an image digest. If the kubelet has a container image with that exact digest cached             locally, the kubelet uses its cached image; otherwise, the kubelet pulls the image with the resolved             digest, and uses that image to launch the container. "Never" => The kubelet does not try fetching the image. If the image is somehow already present locally, the            kubelet attempts to start the container; otherwise, startup fails  |
| image.registry | string | `"registry.opencode.de"` | Container registry address. This setting has higher precedence than global.registry. |
| image.repository | string | `"bmi/opendesk/components/platform-development/images/opendesk-keycloak-bootstrap"` | Container repository string. |
| image.tag | string | `"latest"` | Define image tag. |
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
