dialog --title "某餐廳公佈欄" --msgbox '就是↑這裡↓' 13 50
user=$(dialog --title "傳說的初始" --inputbox "請留下您的大名，冒險者: " 13 50 --output-fd 1)
dialog --title "建立路途" --msgbox "這將會是你的足跡，$user" 13 50
dialog --title "選擇路途" --yesno '你是否願意踏上王道的征途?' 13 50
if [ $? -eq 0 ]; then
                dialog --title "冒險之路" --msgbox "好時代要來力，$user這就是王道征途！" 13 50
        else
                dialog --title "來自某人的訊息" --msgbox "$user你到底在做什嘛啊，就不能好好的冒險嗎?" 13 50
                exit 0
fi
dialog --title "餐廳入口" --menu "${user}口牙，選擇你的餐點" 13 50 3 1 '餐點A(安裝APACHE2)' 2 '餐點B(卸載APACHE)' 3 "我不吃了" 2> ans.txt
ans=$(cat ans.txt)
case $ans in
        1)
                dialog --title "朱古力" --msgbox '這是你的餐點A(指安裝UBUNTU)' 13 50
                dialog --title "安裝APACHE2..." --msgbox '安裝APACHE2ING...?' 13 50
                sudo apt install apache2 -y &> /dev/null
                wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip &> /dev/null
                unzip oxer.zip  &> /dev/null
                sudo mv oxer-html/* /var/www/html/
                dialog --title "安裝完成摟" --msgbox '你可以遊覽網頁了' 13 50
                ;;

        2)
                dialog --title "咖哩拌飯" --msgbox '這是你的餐點B(指卸載APACHER)' 13 50
                sudo rm -rf oxer*
                sudo rm -rf /var/www/html/*
                sudo apt remove apache2 -y &> /dev/null
                dialog --title "天下無不散宴席" --msgbox "要知道傷心總是難免的只能跟APACHE說再見" 13 50
                ;;

        3)
                dialog --title "系統提示" --msgbox '祝你有美好的一天:)' 13 50
                ;;
esac
dialog --title 口矣 --msgbox "再見了，$user" 13 50