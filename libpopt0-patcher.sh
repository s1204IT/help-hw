#!/usr/bin/env bash

sudo echo -n
if [ $? != 0 ]; then
  echo -e "\nRoot(管理者)権限を要求しています｡\nもう一度お試しください｡\n"
  sudo echo -n
  if [ $? != 0 ]; then
    echo -e "\n権限の昇格に失敗したため､ 実行を終了しました｡"
    exit 1
  fi
fi

curl -O# http://ftp.jp.debian.org/debian/pool/main/p/popt/libpopt0_1.18-2_amd64.deb
if [ $? != 0 ]; then echo -e "\nパッケージのダウンロードに失敗しました\n正常なインターネット接続を確認してください\n"; exit 1; fi
sudo dpkg --force-downgrade -i ./libpopt0_1.18-2_amd64.deb
rm -f ./libpopt0_1.18-2_amd64.deb
sudo apt-mark hold libpopt0
echo -e "\n\"libpopt0\"の上書きが完了しました｡\n\"help-hw\"を正常にお使い頂けます｡\n"
exit 0
