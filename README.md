# android-jbr [![CI](https://github.com/kazik117/android-jbr/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/kazik117/android-jbr/actions/workflows/docker-publish.yml)
Docker image for building Android applications using Jetbrains Runtime JDK

## Variants
There is one variant at this time which uses JDK17 based on Jetbrains Runtime JDK and uses tag suffix `-jdk17`

## Tags
| API level       | JDK17                                               |
|-----------------|-----------------------------------------------------|
| Android 14 (34) | `android-34-jdk17` `latest` `latest-jdk17`          |
| Android 13 (33) | `android-33-jdk17`                                  |

## Contents
These images are based on Alpine 3.18 with bash, curl, git, openssh and python3 installed.

<details>
    <summary>Contents of the Android 14 (34) image</summary>

| Path                      | Version | Description                         |
| -------                   | ------- | -------                             |
| build-tools;34.0.0        | 34.0.0  | Android SDK Build-Tools 34          | build-tools/34.0.0
| extras;google;instantapps | 1.9.0   | Google Play Instant Development SDK | extras/google/instantapps
| patcher;v4                | 1       | SDK Patch Applier v4                | patcher/v4
| platform-tools            | 34.0.4  | Android SDK Platform-Tools          | platform-tools
| platforms;android-34      | 1       | Android SDK Platform 34             | platforms/android-34
</details>

<details>
    <summary>Contents of the Android 13 (33) image</summary>

| Path                      | Version | Description                         |
| -------                   | ------- | -------                             |
| build-tools;33.0.2        | 33.0.2  | Android SDK Build-Tools 33.0.2      | build-tools/33.0.2
| extras;google;instantapps | 1.9.0   | Google Play Instant Development SDK | extras/google/instantapps
| patcher;v4                | 1       | SDK Patch Applier v4                | patcher/v4
| platform-tools            | 34.0.4  | Android SDK Platform-Tools          | platform-tools
| platforms;android-33      | 2       | Android SDK Platform 33             | platforms/android-33
</details>

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