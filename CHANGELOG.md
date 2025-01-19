## [2.2.3](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.2.2...v2.2.3) (2025-01-19)


### Bug Fixes

* **clientAccessRestrictions:** Support for empty dict/null ([a42ea71](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/a42ea71174f4fb8377502ed45e5fbfe119f5b5a2))

## [2.2.2](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.2.1...v2.2.2) (2025-01-17)


### Bug Fixes

* Move client_access_restrictions from hardcoded to templating as `config.clientAccessRestrictions` ([a5b2e12](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/a5b2e12a1a8fbe6e3373ff53283304eb39205674))

## [2.2.1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.2.0...v2.2.1) (2025-01-16)


### Bug Fixes

* **groups:** Pre-create standard groups to avoid race conditions in test automation ([4c59f1e](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/4c59f1e5f5b827aad7a317e96beea32afddc854b))

# [2.2.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.1.4...v2.2.0) (2024-12-18)


### Features

* Add support for optional Notes app ([0c8268f](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/0c8268f5015e91a1dd0c593765c915a2405a84bd))

## [2.1.4](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.1.3...v2.1.4) (2024-11-26)


### Bug Fixes

* Add token_exchange permission to XWiki ([72e38c1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/72e38c1a5aa3c90353a1374b7123e7f9d5a3acfc))

## [2.1.3](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.1.2...v2.1.3) (2024-10-10)


### Bug Fixes

* Set explicit group for Videconference access. ([4f724a6](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/4f724a6e4ca7e4287ba64780c9c30c2b7710b798))

## [2.1.2](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.1.1...v2.1.2) (2024-09-20)


### Bug Fixes

* **ansible:** Wait for intercom service before configuring client permissions. ([0be0cb8](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/0be0cb88cb5868d2800dfcd439766d8579c73bd5))

## [2.1.1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.1.0...v2.1.1) (2024-08-07)


### Bug Fixes

* **values.yaml:** Add missing `opendesk` and `managed` config sections. ([5f0165e](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/5f0165ee28615f1ee377560a14756cbc253475c2))

# [2.1.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.0.0...v2.1.0) (2024-07-15)


### Features

* **client:** Support for group based client access control using group>client_role>scope relation. ([7f05e4e](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/7f05e4e24cc796c6a14435278a573c7553caeb52))

# [2.0.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v1.1.1...v2.0.0) (2024-07-07)


### Bug Fixes

* **opendesk-keycloak-bootstrap:** Use normal job without hook ([b1dd562](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/b1dd562180d40ef4d0324954771cd488261392a2))


### BREAKING CHANGES

* **opendesk-keycloak-bootstrap:** Remove helm hook annotation

## [1.1.1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v1.1.0...v1.1.1) (2024-07-07)


### Bug Fixes

* **opendesk-keycloak-bootstrap:** Add argo sync annotation ([67ca5e1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/67ca5e1c384395e88b04d487f4fd6a914463bdbd))

# [1.1.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v1.0.7...v1.1.0) (2024-05-14)


### Features

* Support to enable additional groups for 2FA ([78e1fab](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/78e1fab3625ec4e8cb7c6f2822aa516189c2a0c5))

## [1.0.7](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v1.0.6...v1.0.7) (2024-02-22)


### Bug Fixes

* **sessionhandling:** Update CSP header to allow session refreshs by the portal ([f90f7da](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/f90f7dac1b6f58dd2ebb1cd9891eeda8452faeff))

## [1.0.6](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v1.0.5...v1.0.6) (2024-01-22)


### Bug Fixes

* **opendesk-keycloak-bootstrap:** Add missing imagePullPolicy template in job ([8603381](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/8603381c64e12fc2a434399e4f64e832430043d3))
