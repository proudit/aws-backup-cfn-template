#!/bin/bash

usage_exit() {
        echo "Usage: $0 [-p profile] [-r region] instanceid ..." 1>&2
        exit 1
}

while getopts :p:r:h OPT
do
    case $OPT in
        p) profile=$OPTARG
            ;;
        r) region=$OPTARG
            ;;
        h) usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

accountid=`aws sts get-caller-identity --profile ${profile} --region ${region} --output text | awk '{print $1}'`

shift $((OPTIND - 1))

declare -a array
for a in $@;do
    array=("${array[@]}" $a)
done


for id in ${array[@]}
 do
  echo "arn:aws:ec2:${region}:${accountid}:instance/${id}"
done

