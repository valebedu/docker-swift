FROM ubuntu:xenial

LABEL name="docker-swift" \
    description="docker-swift help you to build applications running with swift on ubuntu systems." \
    version="3.0.2" \
    maintainer="Valentin Bercot <valent1.bercot@gmail.com>"

# Set Swift platform and version
ARG SWIFT_PLATFORM=ubuntu16.04
ARG SWIFT_VERSION=3.0.2-RELEASE

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    clang \
    libcurl4-openssl-dev \
    libedit-dev \
    libicu-dev \
    libxml2 \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Set Workdir to root
WORKDIR /

# Download the latest binaries
RUN SWIFT_URL=https://swift.org/builds/$(echo "swift-$SWIFT_VERSION" | tr "[:upper:]" "[:lower:]")/$(echo "$SWIFT_PLATFORM" | tr -d ".")/swift-$SWIFT_VERSION && \
    SWIFT_PACKAGE=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    wget $SWIFT_URL/$SWIFT_PACKAGE.tar.gz && \
    wget $SWIFT_URL/$SWIFT_PACKAGE.tar.gz.sig && \
# Import the PGP keys
    wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
# Verify the PGP signature
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift && \
    gpg --verify $SWIFT_PACKAGE.tar.gz.sig && \
# Extract the archive
    tar -xvzf $SWIFT_PACKAGE.tar.gz --strip-components=1 && \
    rm -rf $SWIFT_PACKAGE* /tmp/* /var/tmp/*

# Add the Swift toolchain to path
ENV PATH /usr/bin:"$PATH"

# Launch Swift
CMD ["swift --version"]
