#!/bin/bash
##
##FUNCTIONS
createInstance {
        aws ec2 create-key-pair  --key-name awskey --query 'KeyMaterial' --output text > awskey.pem
        chmod 400 awskey.pem
        aws ec2 run-instances --image-id ami-fce3c696 --count 1 --instance-type t2.micro --key-name awskey --region us-east-1 --output text>instanceID.txt
        instance_id=$(grep INSTANCES instanceID.txt | cut -d $'\t' -f 8)
        dns_name=$(aws ec2 describe-instances --instance-id $instance_id | grep PublicDnsName | cut -d "\"" -f 4 | sort -u)

}
createVolume() {

}
mtype m {
        createInstance()
        if [ $volumeFlag == 0 ];then
             createVolume
        else
                checkVolume
        fi
}
volumeid v {

}
#
##
## Main
##
##
volumeFlag = 0

while getopts ":h:m:v" o; do
    case "${o}" in
        m)
            m=${OPTARG}
                mtype m
            ;;
        v)
            v=${OPTARG}
                volumeid v
            ;;
        h)
            echo "Usage: $0 [-m type of backup] [-v volume-id ]"
            ;;
    esac done 
    if shift $((OPTIND-1)) if [ -z "${s}" ] || [ -z "${p}" ]; then
    usage

