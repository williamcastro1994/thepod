FROM ruby:2.1

RUN apt-get update && apt-get -y install \
    --no-install-recommends \
    build-essential \
    libreadline-dev \
    libssl-dev \
    libpq5 \
    libpq-dev \
    libreadline5 \
    libsqlite3-dev \
    bison \
    libbison-dev \
    libpcap-dev \
    libpcap0.8 \
    libpcap0.8-dev \
    postgresql-client \
    wget \
    bzip2 \
    libpcap-dev \
    git-core \
    autoconf \
    curl \
    zlib1g-dev \
    zlib1g \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    locate \
    vncviewer \
    libyaml-dev \
    tmux \
    iptables \
    nano \
    proxychains \
    # nikto dependencies
    libnet-ssleay-perl libauthen-pam-perl libio-pty-perl libdigest-md5-file-perl
#    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /pentest
WORKDIR /pentest

# nmap
RUN cd /pentest && git clone --depth=1 https://github.com/nmap/nmap.git \
    && cd nmap && ./configure && make && make install && make clean

# metasploit
RUN cd /pentest && git clone --depth=1 https://github.com/rapid7/metasploit-framework.git \
    && cd metasploit-framework && bundle install

# sqlmap
RUN cd /pentest && git clone --depth=1 https://github.com/sqlmapproject/sqlmap.git

# nikto
RUN cd /pentest && git clone --depth=1 https://github.com/sullo/nikto.git
