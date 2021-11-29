#!/bin/bash
echo "Welcome to flip coin simulator"
isTie=0
hcount=0
tcount=0
diff=99
res=""

function headTailGenerate(){
	rn=$((RANDOM%2))
       	if [ $rn -eq 0 ]
       	then
              	tcount=$(($tcount+1))
       	else
               	hcount=$(($hcount+1))
       	fi
}

function estimateResult(){
	if [ $3 -eq 0 ]
	then
		res+="-Tie- : Flipping Coin Again /"
		isTie=1
	elif [ $3 -gt 0 ]
	then
		res+="Heads Won by $3 || HeadCount : $1 || TailCount : $2"
		isTie=-1
	elif [ $3 -lt 0 ]
	then
		res+="Tails Won by $((-1 * $3)) || TailCount : $2 || HeadCount : $1"
		isTie=-1
	fi
return
}

function flipCoin(){
while [ 1 ]
do	
	if [ $isTie -eq 1 ]
	then
		diff=$(($hcount - $tcount))
		if [ $diff -eq 2 ] || [ $diff -eq -2 ]
		then
			estimateResult $hcount $tcount $diff
		else
			headTailGenerate
			isTie=0
		fi
	elif [ $isTie -eq 0 ]
	then
		if [ $hcount -eq 21 -o $tcount -eq 21 ]
		then
			diff=$(($hcount - $tcount))
			estimateResult $hcount $tcount $diff
		else
			headTailGenerate
		fi
	else
		break
	fi
done
}

flipCoin
echo $res
