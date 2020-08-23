plan letlime::uninstall() {
  apply_prep('all')

  apply('nginx-hosts') {
    package {'nginx':
      ensure => absent,
    }
  }

  out::message('nginx uninstalled')

}
