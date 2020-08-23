class letlime::params (
  String $nginx_hostname = 'bolt',
  Integer $nginx_port = 8080,
  String $grafana_user = 'bolt',
String $ssl_protocols= 'TLSv1.2 TLSv1.3',
String $ssl_ciphers= 'ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384',
String $proxy_read_timeout= '60',
String $proxy_send_timeout= '60',
Array $proxy_set_header= [ 'one', 'two', 'three', ],
Array $proxy_hide_header= [ 'one', 'two', 'three', ],    
Array $proxy_pass_header= [ 'one', 'two', 'three', ] ,   
String $owner= 'nginx',          
String $group= 'nginx' ,         
String $mode= ''  
) {}

