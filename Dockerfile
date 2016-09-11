FROM debian
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get install -y \
    locales \
    wget \
    -qq && locale-gen es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES

RUN wget http://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb && dpkg -i puppetlabs-release-pc1-jessie.deb

RUN apt-get update && apt-get install -y \
    puppetserver \
    puppet-agent \
    && apt-get clean

ENV PATH $PATH:/opt/puppetlabs/bin

EXPOSE 8140

CMD ["puppetserver","foreground"]
