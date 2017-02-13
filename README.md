# nagios-to-chatwork
chatworkへのnagios通知用シェルスクリプト  

# How to setup
## 1, Download shellscript and set token
好きなディレクトリにシェルスクリプト本体をダウンロード
```bash
cd [お好きなディレクトリ]  
wget https://raw.githubusercontent.com/yuuturn/nagios-to-chatwork/master/nagios2chatwork.sh  
chmod +x nagios2chatwork.sh
```
nagios2chatwork.shをエディタで開き、  
`CW_TOKEN`にChatwork API tokenを`CW_ROOMID`には通知したいチャットのroom_idを入れる。  

## 2, Setup config
[sample-config](https://github.com/yuuturn/nagios-to-chatwork/tree/master/sample_config)を用意しているので参照して監視したい内容に合わせ設定。

## 3, Check config and start nagios
設定のチェックをしてnagiosを立ち上げる
```bash
nagios -v /etc/nagios/nagios.cfg
*snip*
Total Warnings: 0
Total Errors:   0

Things look okay - No serious problems were detected during the pre-flight check
```
`service nagios start`

# Licence
[MIT licence](https://github.com/yuuturn/nagios-to-chatwork/blob/master/LICENSE)  
ご自由にお使いください。
