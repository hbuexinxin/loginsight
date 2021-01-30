FROM ubuntu:20.04

COPY sources.list /etc/apt/
COPY msyh.ttf /usr/share/fonts/msyh.ttf

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:beineri/opt-qt-5.14.2-focal \
    && find /etc/apt/sources.list.d/ -type f -name "*.list" -exec  sed  -i.bak -r  's#deb(-src)?\s*http(s)?://ppa.launchpad.net#deb\1 https://launchpad.proxy.ustclug.org#ig' {} \; \
    && apt-get install -y apt-transport-https \
    && apt-get update \
    && apt-get install -y --fix-missing libfcitx-qt5-dev fcitx-frontend-qt5 \
    build-essential cmake qt5-default qttools5-dev-tools qt514-meta-full python3 python3-pip git \
    && echo "source /opt/qt514/bin/qt514-env.sh" >> ~/.bashrc \
    && cp /usr/lib/x86_64-linux-gnu/libFcitxQt5DBusAddons.so* /opt/qt514/lib/ \
    && cp /usr/lib/x86_64-linux-gnu/libFcitxQt5WidgetsAddons.so* /opt/qt514/lib \
    && cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so /opt/qt514/plugins/platforminputcontexts/ \
    && pip3 install --upgrade pip \
    && apt-get install -y openssh-server \
    && apt-get clean && rm -rf /var/lib/apt/lists/



