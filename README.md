# android-jbr [![CI](https://github.com/kazik117/android-jbr/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/kazik117/android-jbr/actions/workflows/docker-publish.yml)
Docker image for building Android applications using Jetbrains Runtime JDK

## Variants
There is one variant at this time which uses JDK17 based on Jetbrains Runtime JDK and uses tag suffix `-jdk17`

## Tags
| API level       | JDK17                                               |
|-----------------|-----------------------------------------------------|
| Android 13 (33) | `android-33-jdk17` `latest` `latest-jdk17`          |

## Contents
This image is based on Alpine 3.18 with bash, curl, git, openssh and python3 installed.
| Path                      | Version | Description                         |
| -------                   | ------- | -------                             |
| build-tools;33.0.2        | 33.0.2  | Android SDK Build-Tools 33.0.2      |
| extras;google;instantapps | 1.9.0   | Google Play Instant Development SDK |
| platform-tools            | 34.0.3  | Android SDK Platform-Tools          |
| platforms;android-33      | 2       | Android SDK Platform 33             |

## License
```
Copyright 2023 Mateusz Kaźmierczak

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```