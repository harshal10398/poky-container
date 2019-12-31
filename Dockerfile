FROM ubuntu:12.04
ARG USER
ARG USER_ID
ARG GROUP_ID

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
    userdel -f ${USER} &&\
    if getent group ${USER} ; then groupdel ${USER}; fi &&\
    groupadd -g ${GROUP_ID} ${USER} &&\
    useradd -l -u ${USER_ID} -g ${USER} ${USER} &&\
    install -d -m 0755 -o ${USER} -g ${USER} /home/${USER} &&\
    chown --changes --silent --no-dereference --recursive \
          --from=33:33 ${USER_ID}:${GROUP_ID} \
        /home/${USER} && \
    yes 'insecure' | passwd yoctouser \
;fi ;\
apt-get update ; \
apt-get upgrade -y ; \
apt-get install subversion build-essential \
            libncurses5-dev zlib1g-dev gawk \
            git ccache gettext libssl-dev \
            xsltproc zip bsdmainutils gcc g++ \
            binutils patch bzip2 flex make gettext \
            pkg-config unzip zlib1g-dev libc6-dev \
            subversion libncurses5-dev gawk sharutils \
            curl libxml-parser-perl ocaml-nox ocaml-nox \
            ocaml ocaml-findlib libpcre3-dev \
            binutils-gold python-yaml sharutils -y ; \
apt-get install -y \
        gawk \
        wget \
        git-core \
        subversion \
        diffstat \
        unzip \
        sysstat \
        texinfo \
        gcc-multilib \
        build-essential \
        chrpath \
        socat \
        python \
        python3 \
        xz-utils  \
        locales \
        screen \
        realpath \
        nano vim \
        u-boot-tools \
        device-tree-compiler; \
#     cp -af /etc/skel/ /etc/vncskel/ ; \
#     echo "export DISPLAY=1" >>/etc/vncskel/.bashrc ; \
#     mkdir  /etc/vncskel/.vnc && \
#     echo "" | vncpasswd -f > /etc/vncskel/.vnc/passwd ; \
#     chmod 0600 /etc/vncskel/.vnc/passwd ; \
    useradd -U -m yoctouser ; \
    /usr/sbin/locale-gen en_US.UTF-8

USER ${USER}
