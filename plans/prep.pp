plan letlime::prep() {
  apply_prep('all')

  apply('nginx-hosts') {
    class{ 'letlime::nginx':
      nginx_host => "samlabs.pw"
    }
  }

  out::message('Hello from nginx::install')

  return("Dashboard is live")

}
