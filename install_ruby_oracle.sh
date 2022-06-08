#!/bin/bash
# refer this ==> https://www.rubydoc.info/github/kubo/ruby-oci8/file/docs/install-instant-client.md#Install_Oracle_Instant_Client_Packages
echo 'Installing gem ruby-oci8'

# === create folder to extract ===
extractFolder="/opt/ONGOTS"
mkdir -p $extractFolder

# === unzip files ===
unzip oracle-install-21/instantclient-basic-linux.x64-21.6.0.0.0dbru.zip -d $extractFolder
unzip oracle-install-21/instantclient-sqlplus-linux.x64-21.6.0.0.0dbru.zip -d $extractFolder
unzip oracle-install-21/instantclient-sdk-linux.x64-21.6.0.0.0dbru.zip -d $extractFolder

# === make symbolic links if not exists ===
ln -sfn libclntsh.so.21.1 libclntsh.so

# === install libaio =====
apt-get install libaio1

echo "export LD_LIBRARY_PATH=/opt/oracle/instantclient_21_6" >> ~/.bashrc
source ~/.bashrc

# === install ruby-oci8 gem ===
gem install ruby-oci8
