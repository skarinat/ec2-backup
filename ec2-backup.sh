#!/bin/bash
##
##FUNCTIONS
##
method_type()
{
	
}

##
##
## Main
##
##
while getopts ":h:m:v" o; do
    case "${o}" in
        m)
            s=${OPTARG}
            
            ;;
        v)
            p=${OPTARG}
            ;;
        h)
            echo "Usage: $0 [-m type of backup] [-v volume-id ]"
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${s}" ] || [ -z "${p}" ]; then
    usage
fi

##
##
  option=$1
  inet_string=""
  usage=$0"-h|-m|-v"
  case "$option" in

      "-h")
	  helptext
	  ;;

      "-m")
          method_type    #call method function
	  ;;

      "-v")
	  volume_id  #call volumeID function
	  ;;
      *)
        echo " The parameter passed is invalid" $usage
        
	;;
  esac

###end of case statement

exit
