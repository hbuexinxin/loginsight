mkdir -p ../build
cd ../build
qmake ../loginsight.pro -spec linux-g++ CONFIG+=qtquickcompiler
make -j4
mkdir -p appdir/usr/bin
cp src/loginsight appdir/usr/bin/
cp ../src/img/logo.png appdir/
cp ../src/loginsight.desktop appdir/
mkdir appdir/usr/lib
../tool/linuxdeployqt appdir/usr/bin/loginsight -appimage --appimage-extract-and-run
if [ ! -d artifact ];then
  mkdir artifact
fi
mv loginsight-*.AppImage artifact/loginsight.AppImage
