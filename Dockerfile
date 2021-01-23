FROM ubuntu:16.04

ADD sources.list /etc/apt/

RUN apt-get update \
    && apt-get install -y software-properties-common python-software-properties \
    && add-apt-repository ppa:beineri/opt-qt-5.12.0-xenial \
    && find /etc/apt/sources.list.d/ -type f -name "*.list" -exec  sed  -i.bak -r  's#deb(-src)?\s*http(s)?://ppa.launchpad.net#deb\1 https://launchpad.proxy.ustclug.org#ig' {} \; \
    && apt-get install -y apt-transport-https \
    && apt-get update \
    && apt-get install -y libfcitx-qt5-dev fcitx-frontend-qt5 \
    build-essential cmake qt5-default qttools5-dev-tools qt512-meta-full python3 python3-pip -y \
    && echo "source /opt/qt512/bin/qt512-env.sh" >> ~/.bashrc\
		&& cp /usr/lib/x86_64-linux-gnu/libFcitxQt5DBusAddons.so* /opt/qt512/lib/ \
		&& cp /usr/lib/x86_64-linux-gnu/libFcitxQt5WidgetsAddons.so* /opt/qt512/lib \
    && cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so /opt/qt512/plugins/platforminputcontexts/ \
    && pip3 install --upgrade pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/



