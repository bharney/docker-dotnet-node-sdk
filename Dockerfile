FROM microsoft/dotnet:2.0.0-runtime-jessie

# set up network
ENV ASPNETCORE_URLS http://+:80
ENV ASPNETCORE_RUNTIMESTORE_DOWNLOAD_URL https://dist.asp.net/runtimestore/2.0.0/linux-x64/aspnetcore.runtimestore.tar.gz
ENV ASPNETCORE_PKG_VERSION 2.0.0

# set up the runtime store
RUN curl -o /tmp/runtimestore.tar.gz $ASPNETCORE_RUNTIMESTORE_DOWNLOAD_URL \
    && export DOTNET_HOME=$(dirname $(readlink $(which dotnet))) \
    && tar -x -C $DOTNET_HOME -f /tmp/runtimestore.tar.gz \
    && rm /tmp/runtimestore.tar.gz
    && apt-get update \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get -y install nodejs \
    && apt-get -y install bzip2 \
    && apt-get -y install libfontconfig
