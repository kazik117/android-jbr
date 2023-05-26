FROM alpine:3.18
LABEL maintainer="Mateusz Kaźmierczak <kazik117@users.noreply.github.com>"

ARG JDK_MAJOR=17
ARG JDK_MINOR=0
ARG JDK_PATCH=7
ARG JDK_FULL_VERSION=${JDK_MAJOR}.${JDK_MINOR}.${JDK_PATCH}
ARG JDK_BUILD_VERSION=b964.1

ARG CMDLINE_VERSION
ARG SDK_TOOLS_VERSION
ARG BUILD_TOOLS_VERSION
ARG TARGET_SDK

ENV ANDROID_SDK_ROOT="/opt/sdk"
ENV ANDROID_HOME=${ANDROID_SDK_ROOT}
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"
ENV PATH=$PATH:${ANDROID_SDK_ROOT}/build-tools/${BUILD_TOOLS_VERSION}:${ANDROID_SDK_ROOT}/cmdline-tools/${CMDLINE_VERSION}/bin:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/extras/google/instantapps

ENV LD_PRELOAD=/lib/libgcompat.so.0

RUN apk add --no-cache bash curl git gzip unzip openssh-client python3 gcompat freetype-dev fontconfig font-dejavu && \
    fc-cache --force && \
    curl -sL https://cache-redirector.jetbrains.com/intellij-jbr/jbrsdk-${JDK_FULL_VERSION}-linux-x64-${JDK_BUILD_VERSION}.tar.gz | tar -C /tmp -xzf - && \
    mkdir -p /usr/lib/jvm && \
    mv /tmp/jbrsdk-${JDK_FULL_VERSION}-linux-x64-${JDK_BUILD_VERSION} /usr/lib/jvm/java-${JDK_MAJOR}-jbr && \
    ln -s "java-${JDK_MAJOR}-jbr" "$JAVA_HOME" && \
    ln -s "$JAVA_HOME/bin/"* "/usr/bin" && \
    java -version && javac -version && \
    mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    curl -s -o /tmp/tools.zip https://dl.google.com/android/repository/commandlinetools-linux-${SDK_TOOLS_VERSION}_latest.zip && \
    unzip -qq /tmp/tools.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools && \
    mv ${ANDROID_SDK_ROOT}/cmdline-tools/* ${ANDROID_SDK_ROOT}/cmdline-tools/${CMDLINE_VERSION} && \
    yes | sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --licenses && \
    sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --install "platform-tools" "extras;google;instantapps" && \
    sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --install "build-tools;${BUILD_TOOLS_VERSION}" "platforms;android-${TARGET_SDK}" && \
    sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --uninstall emulator && \
    rm -rf /tmp/* && rm -rf /var/cache/apk/*

WORKDIR /home/android
CMD ["/bin/bash"]
