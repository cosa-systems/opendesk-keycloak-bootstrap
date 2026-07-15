# [2.9.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.8.2...v2.9.0) (2026-07-15)


### Features

* **ansible:** Remove legacy token exchange setup required `clientpermissions` in preparation to use token exchange v2 ([8a91e39](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/8a91e398d920e2a93986f717c6b05c5787e680a6))

## [2.8.2](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.8.1...v2.8.2) (2026-07-07)


### Bug Fixes

* **ci:** Update to new gitlab-config ([c05695b](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/c05695b0d5bed5ea4db8276c1ba4d9707b4d2a38))

## [2.8.1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.8.0...v2.8.1) (2026-07-07)


### Bug Fixes

* **chart:** Mount per-client `existingSecret` for opendesk/custom clients ([2f2a8fe](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/2f2a8fe5a931be9125a893409ea30562f04a880b))

# [2.8.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.7.1...v2.8.0) (2026-04-21)


### Bug Fixes

* **chart:** Adapt to dictionary name ([0f1feca](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/0f1feca0763b9eb7656632e93e6d1a2c707b6605))
* **chart:** Adapt to new dictionary structure ([19bf3b4](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/19bf3b4cab707a1979567b8e4279cc9234621396))
* **chart:** Adapt to new structure ([d0a33a1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/d0a33a15daf5629af72d3957394eaa2b5e8f1d60))
* **chart:** Add an error message when enforced IdP is not defined in dict of IdPs ([bcaf43d](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/bcaf43da79894125dd71a25ba4eaac90968e9720))
* **chart:** Remove unnecessary secrets file ending ([35ba176](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/35ba176b1cba80090888555a28134d3f6a87503e))
* Replace static prefix with a variable defined once ([6521c9f](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/6521c9f63c1787c69b0e2fd960d104fb01a7e2c7))
* Support for key `legacy-single-idp-config` that will ensure stable config identifier in openDesk ([536f174](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/536f17422d5d86f33262c87a4bc6f5e74292150d))
* Update boolean settings in Ansible ([3dde146](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/3dde146f550af7f0aaa0c5e7225df007b870b2db))


### Features

* **chart:** Do not allow local login on IdP enforcement ([f29fd4b](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/f29fd4bdb4bb52123547fb9dcdaeda165595612c))
* **chart:** Narrow down list of IdPs to oD managed ones ([1c84977](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/1c849771645eec3c63011719c88ba355242c3729))
* **chart:** Prepare the possiblity to use external secrets for secret values in clients ([f4407b9](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/f4407b9fe0ab712b790e724daa002b1af01018a3))
* **chart:** Revert: Do not allow local login on IdP enforcement ([9e71354](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/9e71354275bf74b10dd188e3c0d2f6918637aefa))
* **chart:** Rework existing secrets support to be inline ([f34ba98](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/f34ba980f47221462145a42d19d984c74707d328))
* **chart:** Rework of IdP config option and external secrets ([f15bacd](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/f15bacdfd26fd400d8d36af3320ba467bf54c75b))

## [2.7.1](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.7.0...v2.7.1) (2026-02-18)


### Bug Fixes

* **ldap_sync:** Allow active decision to enable LDAP user import to Keycloak for pre 1.8.0 deployments ([185616f](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/185616f429bc9182bef7fb06c9f04d8c0bb45a09))

# [2.7.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.6.0...v2.7.0) (2026-02-04)


### Features

* Streamline user federation setting (import users / read mappers always from ldap) ([e628e74](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/e628e744f47cdd16219ad11f784fc8161073db76))

# [2.6.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.5.0...v2.6.0) (2025-04-11)


### Bug Fixes

* **2fa-groups:** Handle multiple groups as Array not String ([2b6a1e5](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/2b6a1e519003c4e9405cbbc800f91c181c3c4d01))
* **facts:** Align default handling ([cebcb60](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/cebcb602b77d6e26728e8471c4753a6acc3ce192))


### Features

* Cleanup main.yml ([b0042ba](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/b0042ba3251f0fa2a0d0912e9b9e6af1fe9626b6))
* SSO Federation ([58e9874](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/58e98743ed523b30bcf78833f9fae62a1ea8e703))

# [2.5.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.4.0...v2.5.0) (2025-04-04)


### Features

* Support more global realm settings to be templated ([ca0c5c3](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/ca0c5c3c31a616ffebdec1d3391b90c63bd31a3c))

# [2.4.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.3.0...v2.4.0) (2025-03-11)


### Features

* Provide admin credentials in a secret ([d8fcd44](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/d8fcd44a028fdc08fe358e034f1d1edb904b2728))

# [2.3.0](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/compare/v2.2.3...v2.3.0) (2025-02-03)


### Features

* Support for selective apps ([d04aabc](https://gitlab.opencode.de/bmi/opendesk/components/platform-development/charts/opendesk-keycloak-bootstrap/commit/d04aabc30544e4852612042416ef9bcce7ed9139))

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
