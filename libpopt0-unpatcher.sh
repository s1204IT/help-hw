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

sudo apt install -y --allow-change-held-packages libpopt0
if [ $? != 0 ]; then echo -e "\nパッケージの更新に失敗しました\nエラーコード：${?}\n"; exit 1; fi
sudo apt-mark unhold libpopt0
echo -e "\n\"libpopt0\"を通常の状態へ戻しました｡\n"
exit 0
