#!/bin/bash -x

IS_PART_TIME=1;
IS_FULL_TIME=2;
MAX_HRS_IN_MONTH=4;
EMP_RATE_PER_HR=20;
NUM_WORKIMG_DAYS=20;

totalemphr=0;
totalworkingdays=0;

declare -A dailywage

function getWorkHrs() {
local $empCheck=$1

case $empCheck in
	$IS_PART_TIME)
		empHrs=4
		;;
	$IS_FULL_TIME)
		empHrs=8
		;;
	*)
		empHrs=0;
		;;
esac
eccho $empHrs

}

function getEmpWage() {
localempHr=$1
echo $(($empHr*$EMP_RATE_PER_HR))

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && 
         $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
   ((totalWorkingDays++))
   empCheck=$((RANDOM%3));
   empHrs="$( getWorkHrs $empCheck )"
   totalEmpHrs=$(($totalEmpHrs+$empHrs))
   dailyWage["$totalWorkingDays"]="$(getEmpWage $empHrs )"
done

totalSalary=$(($totalEmpHrs*$EMP_RATE_PER_HR));
echo ${dailyWage[@]}
echo ${!dailyWage[@]}
