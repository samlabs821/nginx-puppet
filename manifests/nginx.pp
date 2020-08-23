class letlime::nginx (
  String $nginx_host = $letlime::params::nginx_hostname,
  Integer $port = $letlime::params::nginx_port,
) inherits ::letlime::params {

   class { 'nginx' :
     ssl_prefer_server_ciphers => off,
     spdy => off,
     http2 => on,
  }

  nginx::resource::server { 'kibana.myhost.com':
    listen_port => 80,
    proxy       => 'http://localhost:5601',
  }
}
