#!/bin/sh

#Генерируем случайное число до 100
RANGE=99
NUMBER=$RANDOM
let "NUMBER %= $RANGE"

#Задаем количество попыток и начальную позицию
MAXCOUNT=3
COUNT=1

echo "Угадай число от 0 до 99 с трёх попыток!"
while [ $COUNT -le $MAXCOUNT ]
do
    read -p "Попытка № $COUNT: " ANSWER
    if [[ $ANSWER -eq $NUMBER ]]; then
		echo "Поздравляю, вы угадали число! Это было $NUMBER"
		break
    else
		if [[ $COUNT -lt $MAXCOUNT ]]; then
			echo "Нет, попробуй еще раз!"
			let "COUNT += 1"
		else
			echo "К сожалению, вы не угадали, это было $NUMBER"
			break
		fi
    fi
done
