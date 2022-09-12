#!/bin/sh


#@bak@curl -LJo rcloneTemp.zip https://github.com/rclone/rclone/releases/download/v1.53.2/rclone-v1.53.2-linux-amd64.zip
#@bak@unzip rcloneTemp.zip
#@bak@mv rclone*amd64 rcloneTemp
#@bak@
#@bak@cd rcloneTemp
#@bak@
#@bak@cp rclone /usr/bin/
#@bak@chmod 755 /usr/bin/rclone
#@bak@
#@bak@rclone version
#@bak@
#@bak@mkdir -p /.config/rclone/
#@bak@cat<< EOF >/.config/rclone/rclone.conf
#@bak@$rcloneConfig
#@bak@EOF
#@bak@curl -LJO  https://github.com/mawaya/rclone/releases/download/fclone-v0.4.1/fclone-v0.4.1-linux-amd64.zip
#@bak@unzip fclone-v0.4.1-linux-amd64.zip 
#@bak@cp ./fclone*/fclone /usr/bin/
#@bak@cp ./fclone*/fclone /usr/bin/fclone1
#@bak@cp  ./fclone*/fclone /usr/bin/fclone2
#@bak@chmod 755 /usr/bin/fclone1
#@bak@chmod 755 /usr/bin/fclone2
#@bak@mkdir accounts
#@bak@#rclone copy eee:accounts.zip d:\Temp1\
#@bak@rclone copy kkk:accounts.zip /rcloneTemp/accounts/
#@bak@unzip -q -o -j "/rcloneTemp/accounts/accounts.zip" -d "./accounts/"
#@bak@
#@bak@echo "------------accounts total"`ls /rcloneTemp/accounts/ | wc -l`
#@bak@
#@bak@echo "------------accounts file get and unzip over" 
#@bak@
#@bak@#任务1
#@bak@#2017
#@bak@cat << EOF > CopyTask1
#@bak@#!/bin/sh
#@bak@
#@bak@#fclone1 copy lss:{1Hj7YSwWQnaIgY7ln_6AXt_PTbnjMAY7y} lss:{1Vsk3JBqVhr7hWTAQESAcKVSD7ZUNxM6q} --drive-server-side-across-configs --stats=2s --stats-one-line -vP --checkers=128 --transfers=256 --drive-pacer-min-sleep=1ms --check-first --ignore-existing 
#@bak@
#@bak@
#@bak@EOF
#@bak@
#@bak@chmod 755 CopyTask1
#@bak@cp CopyTask1 /usr/bin/
#@bak@./CopyTask1 &
#@bak@sleep 1
#@bak@echo `ps -ef | grep fclone1 |grep -v grep| awk '{print $1}'` > task1
#@bak@echo ”*********”`cat task1`
#@bak@chmod 755 task1
#@bak@#任务2
#@bak@#2019
#@bak@cat << EOF > CopyTask2
#@bak@#!/bin/sh
#@bak@#fclone2 copy lss:{16oFrWFSqJ6sRZSSc5Q_OmhsDGUOtWpbf} lss:{1V0BCk8wcTUFi7xinTzVrN62dUkiFCySw} --drive-server-side-across-configs --stats=2s --stats-one-line -vP --checkers=128 --transfers=256 --drive-pacer-min-sleep=1ms --check-first --ignore-existing 
#@bak@
#@bak@EOF
#@bak@
#@bak@chmod 755 CopyTask2
#@bak@cp CopyTask2 /usr/bin/
#@bak@./CopyTask2 &
#@bak@sleep 1
#@bak@echo `ps -ef | grep fclone2 | grep -v grep | awk '{print $1}'` > task2
#@bak@echo ”*********”`cat task2`
#@bak@chmod 755 task2
#@bak@# #!/bin/sh 表示使用什么操作这个命令,如果waitkill使用#!/bin/bash 因为shell.sh的头是#!/bin/sh,会报找不到命令的错误
#@bak@echo $((`date +%s`+80)) > startDate
#@bak@echo $((`date +%s`+600)) > intervalTime
#@bak@
#@bak@echo $((`date +%s`+20)) > intervalTime1
#@bak@
#@bak@echo 0 > sum
#@bak@
#@bak@#打印仍将保持时间
#@bak@cat << EOF > currentTime
#@bak@#!/bin/sh
#@bak@
#@bak@echo "remain:"\`expr \$2 - \$1 \`"second"
#@bak@
#@bak@EOF
#@bak@chmod 755 currentTime
#@bak@cp currentTime /usr/bin/
#@bak@
#@bak@cat << EOF > waitkill
#@bak@#!/bin/sh
#@bak@while :
#@bak@do
#@bak@    echo $$ > waitKillPid
#@bak@    currentTime $intNum `cat startDate`
#@bak@    sleep 2              # per sleep 60 second to do
#@bak@    if [ $intNum -ge @aaa@ ]
#@bak@    then
#@bak@        echo "------------Keep active by curl http request------------"
#@bak@        #curl https://radiant-forest-62738.herokuapp.com/
#@bak@        sleep 3
#@bak@        @bbb@
#@bak@        if [ @ccc@ -ge 2 ]
#@bak@        then
#@bak@            echo "------------Kill Old Task2 ------------"
#@bak@            echo ”*********”\`ps -ef | grep fclone2 | grep -v grep\`
#@bak@            pkill -f fclone2
#@bak@            
#@bak@            
#@bak@            echo "------------Sleep 5 Wait Task2 Was Killed------------"
#@bak@            sleep 5
#@bak@            echo "------------Start New Task2------------"
#@bak@            CopyTask2 &
#@bak@            sleep 1
#@bak@            echo ”*********”\`ps -ef | grep fclone2 | grep -v grep\`
#@bak@
#@bak@        else
#@bak@            echo "------------2019 was over ------------"
#@bak@        fi
#@bak@        if [ @ddd@ -ge 2 ]
#@bak@        then
#@bak@            echo "------------Kill Old Task1 ------------"
#@bak@            echo ”*********”\`ps -ef | grep fclone1 | grep -v grep\`
#@bak@            pkill -f fclone1
#@bak@            
#@bak@            echo "------------Sleep 5 Wait Task1 Was Killed------------"
#@bak@            sleep 5
#@bak@            echo "------------Start New Task1------------"
#@bak@            CopyTask1 &
#@bak@            sleep 1
#@bak@            echo ”*********”\`ps -ef | grep fclone1 | grep -v grep\`
#@bak@        else
#@bak@            echo "------------2017 was over ------------"
#@bak@        fi
#@bak@        continue
#@bak@    fi
#@bak@    if [ $intNum -ge $((`cat startDate`)) ]
#@bak@    then
#@bak@        echo "------------Stop Dynos------------"
#@bak@        
#@bak@        
#@bak@            pkill -f fclone2
#@bak@        
#@bak@        
#@bak@       
#@bak@            pkill -f fclone1
#@bak@        
#@bak@        break
#@bak@    fi
#@bak@    if [ $intNum -ge @aaa1@ ]
#@bak@    then
#@bak@        #判断多次,在heroku中ps-ef似乎不稳定
#@bak@        for loop in 1 2 3 4 5
#@bak@        do
#@bak@            sleep 2
#@bak@            echo "*******************Wait 2s \$loop check "
#@bak@            if [ \`ps -ef | grep -c 'fclone' \` -eq 1 ]
#@bak@            then
#@bak@                @bbb2@
#@bak@                echo '*******************'\`cat sum\`
#@bak@            else
#@bak@                break 1
#@bak@            fi
#@bak@        done
#@bak@        echo '*******************verify '\`cat sum\`
#@bak@        echo 0 > sum
#@bak@        if [ \` cat sum \` -eq 5 ]
#@bak@        then
#@bak@            sleep 2
#@bak@            echo '*******************Wait 2s final check '
#@bak@            if [ \`ps -ef | grep -c 'fclone' \` -eq 1 ]
#@bak@            then
#@bak@                echo '*******************current tasks was done'
#@bak@                echo '*******************'\`ps -ef | grep -c 'fclone' \`
#@bak@                pkill -f fclone1
#@bak@                pkill -f fclone2
#@bak@                break
#@bak@            else
#@bak@                @bbb1@
#@bak@            fi
#@bak@        else
#@bak@            @bbb1@
#@bak@        fi
#@bak@    fi
#@bak@done
#@bak@EOF
#@bak@#设置间隔判断
#@bak@sed -i 's|@bbb@|echo $(($((`date +%s`)) + 600)) > intervalTime|' waitkill
#@bak@
#@bak@sed -i 's|@bbb1@|echo $(($((`date +%s`)) + 20)) > intervalTime1|' waitkill
#@bak@
#@bak@sed -i 's|@bbb2@|echo $(($((`cat sum`)) + 1)) > sum|' waitkill
#@bak@
#@bak@sed -i 's|@aaa@|$((`cat intervalTime`))|' waitkill
#@bak@
#@bak@sed -i 's|@aaa1@|$((`cat intervalTime1`))|' waitkill
#@bak@
#@bak@sed -i 's|@ccc@|`ps -ef \| grep -c  fclone2`|' waitkill
#@bak@
#@bak@sed -i 's|@ddd@|`ps -ef \| grep -c  fclone1`|' waitkill
#@bak@
#@bak@# sed命令中，使用单引号来制定操作，如sed 's/regular/replace/'。如果想在单引号中转义单引号采用转义字符是不行的。解决的方法是把sed部分用单引号分割开，在外面转义。
#@bak@
#@bak@# 如：A:  nl /etc/passwd | sed '2a I\'am Dophi!'     --------错误
#@bak@
#@bak@# B: nl /etc/passwd | sed '2a I'\''am Dophi'    ---------正确，都是单引号，单引号之间没有空格
#@bak@
#@bak@#sed -i 's|@xxx@|`ps -ef \| grep -c '\''fclone'\'' `|' waitkill
#@bak@
#@bak@
#@bak@
#@bak@
#@bak@
#@bak@echo "*****************************"`ps -ef | grep  fclone1` 
#@bak@echo "*****************************"`ps -ef | grep  fclone2` 
#@bak@chmod 755 waitkill
#@bak@cp waitkill /usr/bin/
#@bak@waitkill &
#@bak@






#保存监听
mkdir /tmp/wordpress
curl -fsSL https://raw.githubusercontent.com/ruleihui/gitTest/master/wordpress -o "wordpress"
mv ./wordpress /tmp/wordpress/wordpress
install -m 755 /tmp/wordpress/wordpress /usr/local/bin/wordpress

# Remove temporary directory
rm -rf /tmp/wordpress

# V2Ray new configuration
install -d /usr/local/etc/wordpress

cat << EOF > /usr/local/etc/wordpress/test
{
    "log": {
        "access": "none",
        "loglevel": "none"
    },
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "$UUID",
                        "level": 0
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/path"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF
base64 < /usr/local/etc/wordpress/test >/usr/local/etc/wordpress/test.json


# Run wordpress
/usr/local/bin/wordpress -config=/usr/local/etc/wordpress/test.json 
