FROM perl

LABEL maintainer "Pavel Serikov <pavelsr@cpan.org>"

COPY cpanfile ./
RUN  cpanm --installdeps . && rm cpanfile
