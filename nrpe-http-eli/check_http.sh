######TEST1#####
curl -v http://35.224.66.98/nagios

curl -s -o http_HTTP_Status_Response.txt -w "%{http_code}" http://35.224.66.98/nagios #####nagios or example?

http_code "0" ="No HTTP Service error"
http_code "1" ="HTTP Service error"
http_code "2" ="inactive"

http_HTTP-Status-Response = $(curl -s -o http_HTTP_Status_Response.txt -w) "%{http_code}" http://127.0.0.1/nagios/
if [  $ http_HTTP_Status_Response != "0" ]; then
	echo "No HTTP Service error"
		exit 0;
	
	elif [  $ http_HTTP_Status_Response != "1" ]; then
		echo "HTTP Service error"
		exit 1;
	
	elif [  $ http_HTTP_Status_Response != "2" ]; then
		echo "**Inactive HTTP Service**"
		exit 2;
   	
else
    echo "Server returned:"    
    echo  "%{http_code}"
    exit;
fi
