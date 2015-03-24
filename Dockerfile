# When releasing:
#
#   - Change the URL in the RUN curl... command to the target release
#   - build as such: docker build -t hoelzro/rakudo-star:$VERSION .

FROM debian:jessie
MAINTAINER Rob Hoelz

ADD http://rakudo.org/downloads/star/rakudo-star-2015.03.tar.gz /root/
RUN tar xzf /root/rakudo-star-2015.03.tar.gz -C /root/

RUN apt-get update && apt-get --yes install build-essential

WORKDIR /root/rakudo-star-2015.03

RUN perl Configure.pl --prefix=/usr --gen-moar
RUN make install

ENTRYPOINT perl6