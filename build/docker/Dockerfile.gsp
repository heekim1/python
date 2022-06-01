FROM ${prefix}/ubuntu${suffix}:18.04-2

ADD . /tmp/deb

RUN echo "deb [trusted=yes] file:///tmp/deb /" > /etc/apt/sources.list.d/tmp.list && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated ${name}-${version} && \
    rm -f /etc/apt/sources.list.d/tmp*.list /tmp/deb/*

USER runner
