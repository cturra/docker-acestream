# debian stretch (9)
FROM debian:stretch-slim

# http://wiki.acestream.org/wiki/index.php/Download
ENV ACESTREAM_VERSION 3.1.49

# prepare dependencies for acestream
RUN apt-get -q update                                       \
 && apt-get install -y --no-install-recommends libpython2.7 \
        net-tools                                           \
        python-minimal                                      \
        python-pkg-resources                                \
        python-m2crypto                                     \
        python-apsw                                         \
        python-lxml                                         \
        wget                                                \
 && apt-get clean                                           \
 && rm -rf /var/lib/apt/lists/*                             \
           /var/cache/*

# download and extract acestream
RUN mkdir --parents /opt/acestream \
 && wget -qO- "http://acestream.org/downloads/linux/acestream_${ACESTREAM_VERSION}_debian_9.9_x86_64.tar.gz" |\
    tar --extract --gzip --directory /opt/acestream

# start acestream (client console only)
ENTRYPOINT [ "/opt/acestream/start-engine", "--client-console" ]
