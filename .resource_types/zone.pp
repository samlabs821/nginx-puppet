# This file was automatically generated on 2020-08-23 08:38:05 +0000.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Solaris zones.
# 
# **Autorequires:** If Puppet is managing the directory specified as the root of
# the zone's filesystem (with the `path` attribute), the zone resource will
# autorequire that directory.
Puppet::Resource::ResourceType3.new(
  'zone',
  [
    # The running state of the zone.  The valid states directly reflect
    # the states that `zoneadm` provides.  The states are linear,
    # in that a zone must be `configured`, then `installed`, and
    # only then can be `running`.  Note also that `halt` is currently
    # used to stop zones.
    # 
    # Valid values are `absent`, `configured`, `installed`, `running`.
    Puppet::Resource::Param(Enum['absent', 'configured', 'installed', 'running'], 'ensure'),

    # The IP address of the zone.  IP addresses **must** be specified
    # with an interface, and may optionally be specified with a default router
    # (sometimes called a defrouter). The interface, IP address, and default
    # router should be separated by colons to form a complete IP address string.
    # For example: `bge0:192.168.178.200` would be a valid IP address string
    # without a default router, and `bge0:192.168.178.200:192.168.178.1` adds a
    # default router to it.
    # 
    # For zones with multiple interfaces, the value of this attribute should be
    # an array of IP address strings (each of which must include an interface
    # and may include a default router).
    Puppet::Resource::Param(Any, 'ip'),

    # The IP stack type of the zone.
    # 
    # Valid values are `shared`, `exclusive`.
    Puppet::Resource::Param(Enum['shared', 'exclusive'], 'iptype'),

    # Whether the zone should automatically boot.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'autoboot'),

    # The root of the zone's filesystem.  Must be a fully qualified
    # file name.  If you include `%s` in the path, then it will be
    # replaced with the zone's name.  Currently, you cannot use
    # Puppet to move a zone. Consequently this is a readonly property.
    Puppet::Resource::Param(Any, 'path'),

    # The resource pool for this zone.
    Puppet::Resource::Param(Any, 'pool'),

    # Number of FSS CPU shares allocated to the zone.
    Puppet::Resource::Param(Any, 'shares'),

    # The list of datasets delegated to the non-global zone from the
    # global zone.  All datasets must be zfs filesystem names which are
    # different from the mountpoint.
    Puppet::Resource::Param(Any, 'dataset'),

    # The list of directories that the zone inherits from the global
    # zone.  All directories must be fully qualified.
    Puppet::Resource::Param(Any, 'inherit')
  ],
  [
    # The name of the zone.
    Puppet::Resource::Param(Any, 'name', true),

    # The numerical ID of the zone.  This number is autogenerated
    # and cannot be changed.
    Puppet::Resource::Param(Any, 'id'),

    # Instead of installing the zone, clone it from another zone.
    # If the zone root resides on a zfs file system, a snapshot will be
    # used to create the clone; if it resides on a ufs filesystem, a copy of the
    # zone will be used. The zone from which you clone must not be running.
    Puppet::Resource::Param(Any, 'clone'),

    # The text to go into the `sysidcfg` file when the zone is first
    # booted.  The best way is to use a template:
    # 
    #     # $confdir/modules/site/templates/sysidcfg.erb
    #     system_locale=en_US
    #     timezone=GMT
    #     terminal=xterms
    #     security_policy=NONE
    #     root_password=<%= password %>
    #     timeserver=localhost
    #     name_service=DNS {domain_name=<%= domain %> name_server=<%= nameserver %>}
    #     network_interface=primary {hostname=<%= realhostname %>
    #       ip_address=<%= ip %>
    #       netmask=<%= netmask %>
    #       protocol_ipv6=no
    #       default_route=<%= defaultroute %>}
    #     nfs4_domain=dynamic
    # 
    # And then call that:
    # 
    #     zone { 'myzone':
    #       ip           => 'bge0:192.168.0.23',
    #       sysidcfg     => template('site/sysidcfg.erb'),
    #       path         => '/opt/zones/myzone',
    #       realhostname => 'fully.qualified.domain.name',
    #     }
    # 
    # The `sysidcfg` only matters on the first booting of the zone,
    # so Puppet only checks for it at that time.
    Puppet::Resource::Param(Any, 'sysidcfg'),

    # Arguments to the `zonecfg` create command.  This can be used to create branded zones.
    Puppet::Resource::Param(Any, 'create_args'),

    # Arguments to the `zoneadm` install command.  This can be used to create branded zones.
    Puppet::Resource::Param(Any, 'install_args'),

    # The actual hostname of the zone.
    Puppet::Resource::Param(Any, 'realhostname'),

    # The specific backend to use for this `zone`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # solaris
    # : Provider for Solaris Zones.
    # 
    #   * Required binaries: `/usr/sbin/zoneadm`, `/usr/sbin/zonecfg`.
    #   * Default for `osfamily` == `solaris`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
