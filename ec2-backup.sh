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
