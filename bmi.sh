#!/bin/bash

while [ -n "$1" ]
do
    case "$1" in
	-weight) weight="$2"
		shift;;
	-height) height=$(bc<<<"scale=2;$2/100")
		shift;;
	*) echo "$1 is not an option";;
    esac
    shift
done

mbi=$(bc<<<"scale=1;$weight/$height/$height")

echo -n "Индекс массы тела = $mbi"

if [ $(echo "$mbi < 16" | bc) -eq 1 ]
then
    echo " - Выраженный дефицит массы тела"
elif [ $(echo "$mbi >= 16" | bc) -eq 1 ] && [ $(echo "$mbi < 18.5" | bc) -eq 1 ]
then
    echo " - Недостаточная (дефицит) массы тела"
elif [ $(echo "$mbi >= 18.5" | bc) -eq 1 ] && [ $(echo "$mbi < 25" | bc) -eq 1 ]
then
    echo " - Норма"
elif [ $(echo "$mbi >=25" | bc) -eq 1 ] && [ $(echo "$mbi < 30" | bc) -eq 1 ]
then
    echo " - Избыточная масса тела (предожирение)"
elif [ $(echo "$mbi >= 30" | bc) -eq 1 ] && [ $(echo "$mbi < 35" | bc) -eq 1 ]
then
    echo "- Ожирение 1 степени"
elif [ $(echo "$mbi >= 35" | bc) -eq 1 ] && [ $(echo "$mbi < 40" | bc) -eq 1 ]
then
    echo " - Ожирение 2 степени"
else
    echo " - Ожирение 3 степени"
fi

