#See documentation at https://github.com/jdebarry/AAARF for details on AAARF

FROM genomicpariscentre/bioperl:latest

MAINTAINER Jeremy DeBarry   jdebarry@iplantcollaborative.org
#modeled on https://github.com/bgruening/docker-recipes/blob/master/coprarna/Dockerfile

#install make
RUN apt-get -qq install make

#Install bioperl and clustalw
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update

#RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y bioperl
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y clustalw

#install cpan minus modeled from http://perlmaven.com/install-perl-modules-without-root-rights-on-linux-ubuntu-13-10
RUN apt-get -qq install curl && curl -L http://cpanmin.us | perl - App::cpanminus

# Install BioPerl Run Package last built for Bio::Tools::Run::Alignment::Clustalw; Bio::Tools::Run::Alignment::TCoffee; Bio::Tools::Run::StandAloneBlast modeled from genomicpariscentre/bioperl:latest
RUN cpanm --force CJFIELDS/BioPerl-Run-1.006900.tar.gz

#Install Log4perl modeled on https://hub.docker.com/r/pamtrak06/rok4-ubuntu14.04/~/dockerfile/
RUN apt-get install -y liblog-log4perl-perl

#ncbi-blast modeled from https://hub.docker.com/r/robsyme/ncbi-blast/~/dockerfile/
#may want to use this instead:  https://hub.docker.com/r/simonalpha/ncbi-blast-docker/~/dockerfile/
RUN apt-get update && apt-get install -qqy ncbi-blast+

#Get AAARF.pl code
ADD https://github.com/jdebarry/AAARF/blob/master/v1.0.1/AAARFv1.0.1.pl /

CMD perl AAARFv1.0.1.pl --inputfile=ZU_1000.fasta
