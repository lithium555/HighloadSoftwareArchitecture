HSA L14 DDoS Attacks

Link on presentation: 
https://docs.google.com/presentation/d/1a72WF58mx01l08EjeNyG0PnXkY1IRa0PEJQ-HN2Ec44/edit#slide=id.gcb9a0b074_1_0

Setup two docker containers:
1. attacker container - there you need to write scripts that will implement 6 attacks (UDP Flood, ICMP flood,
HTTP flood, Slowloris, SYN flood,  Ping of Death)
2. Defender container - ubuntu & nginx with simple website
3. Try to implement protection on Defender container
4. Launch attacker scripts and examine you protection


Нужно создать 3 контейнера (на самом деле у нас их будет 2.  В одном кали линукс а в другом NGINX с настроенной защитой 
от DDos атак и NGINX без настроенной защиты от атак.)
Нужно реализовать защиту, которая описана в мануале How to protect NGINX?  т реализовать основные 6 типов ДДос атак, 
которые я описал в ПДВ и посомтреть на было -> стало.
То есть провести атаку на защищённый контейнер и провести атаку на незащищённый контейнер и того должно быть 12 результатов.


How to protect NGINX ?
1. Limit the Rate of requests
2. Limit the number of Connections
3. Closing Slow Connections (закрываем именно медленные подключения)
4. Blacklist suspicious IP Addresses (блочим подозрительные ip адреса или же наоборот вайтлистим только те что разрешаем. )
5. Use Cache to Smooth Traffic Spikes (размазываем трафик с помощью кэша. Не пускаем его в систему и с помощью кэша создаем определенный параметр)
6. Block Suspicious Requests (блочим именно подозрительные запросы)
   Ссылка на официальном сайте: https://www.nginx.com/blog/mitigating-ddos-attacks-with-nginx-and-nginx-plus/

docker-compose down && docker-compose build && docker-compose up -d
