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
        CHECK=$(du -ms ./skarinat | cut -f1)
        if [$CHECK<1000]; then
                SIZE=1
        else
                SIZE=2*($CHECK%1000)
        fi

}
mtype m {
        createInstance()
        if [ $volumeFlag == 0 ];then
             createVolume()
        else
                checkVolume()
        fi
}
volumeid v {

}
#
##
## Main
##
volumeFlag = 0
SIZE=1
while getopts ":h:m:v:" o; do
    case "${o}" in
        m)
            m=${OPTARG}
            dir=$3
                echo "$m"
                echo "$dir"
            ;;
        v)
            v=${OPTARG}
         dir=$3
                echo "$v"
                echo "$dir"
          ;;
        h)
            echo "Usage: $0 [-m type of backup] [-v volume-id ]"
            ;;
    esac done
