# Decidim DSFR
![Tests](https://github.com/OpenSourcePolitics/decidim-ditp/actions/workflows/ci_cd.yml/badge.svg?branch=master)

## Decidim
![](./docs/decidim-logo-claim.svg)

[Decidim](https://github.com/decidim/decidim) is a digital platform for citizen participation. Related documentation can be found [here](https://docs.decidim.org).

This repository contains the code of the Decidim application implemented for the french institutions.

It consists of the main application with modules developed by the community.

It includes **official modules** supported by the community and **community-based modules** developed by us or [our partners](https://github.com/decidim-ice).

### List of our modules

You can find below an exhaustive list of modules with their repository links and latest version available :

| Decidim Module                                                                                                          | Version | Brief description                                                                                                                                                            |
|-------------------------------------------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| decidim-core                                                                                                            | v0.26.7 |
| [decidim-cache_cleaner](https://github.com/OpenSourcePolitics/decidim-module-cache_cleaner)                             | ✅       | Allow admins to clear cache of the application in the back-office                                                                                                            |
| [decidim-decidim_awesome](https://github.com/decidim-ice/decidim-module-decidim_awesome)                                | ✅       | An awesome module that allows (among others) : adding extra-fields for proposals creation, fullscreen iframe component, image in rich text editor, customs redirections etc. |
| [decidim-homepage_interactive_map](https://github.com/OpenSourcePolitics/decidim-module-homepage_interactive_map)       | ✅       | Module that allow the adding of a content-block on the homepage diplaying a map of assemblies in order to allow geo-located participation                                    |
| [decidim-spam_detection](https://github.com/OpenSourcePolitics/decidim-spam_detection)                                  | ✅       | Module adding a spam detection algorithm that runs periodically detecting spam accounts                                                                                      |
| [decidim-term_customizer](https://github.com/mainio/decidim-module-term_customizer)                                     | ✅       | Module allowing the change of translated strings                                                                                                                             |


Some non-official customizations can be found see [OVERLOADS.MD](./OVERLOADS.md).

## 🚀 Getting started
- See our [installation guide](./docs/GETTING_STARTED.md) to run a decidim-app by OSP locally
- See our [homepage interactive map module](./docs/HOMEPAGE_INTERACTIVE_MAP.md) to configure module (OSX/Ubuntu)

## 👋 Contributing
- See our [contributing guide](./docs/CONTRIBUTING.md)

## 🔒 Security
Security is very important to us. If you have any issue regarding security, please disclose the information responsibly by sending an email to **security[at]opensourcepolitics[dot]eu** and not by creating a Github issue.

## License
The decidim-app is licensed under the [AGPLv3](./LICENSE-AGPLV3.txt), same license as Decidim.
