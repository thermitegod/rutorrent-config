# About

Config files used in LXD containers running gentoo

### Admin scripts

Admin Scripts for LXD containers

<https://github.com/thermitegod/shell-scripts/blob/master/python/lxd_admin.py>

<https://github.com/thermitegod/shell-scripts/blob/master/python/lxd_image.py>

<https://github.com/thermitegod/shell-scripts/blob/master/python/lxd_setup.py>


## Setup container

#### Container names

The main container should be named dev-gentoo-clang-minimal since it is kind of hardcoded in the admin scripts

### Create
```
lxc launch images:gentoo/current/amd64 dev-gentoo-clang-minimal
```

### Add networking
```
lxc config device add dev-gentoo-clang-minimal eth0 nic name=eth0 nictype=bridged parent=br0
```

### Security priv
```
lxc config set dev-gentoo-clang-minimal security.privileged true
```

### Gentoo portage setup
```
lxc config device add dev-gentoo-clang-minimal repos disk source=/var/db/repos path=/var/db/repos
lxc config device add dev-gentoo-clang-minimal distfiles disk source=/var/cache/distfiles path=/var/distfiles
lxc config device add dev-gentoo-clang-minimal packages disk source=/var/cache/packages path=/var/packages
```

### Using openrc-init

**Does not work**

<https://wiki.gentoo.org/wiki/OpenRC/openrc-init>

```
sys-apps/openrc[sysv-utils]
```

```
lxc config set dev-gentoo-clang-minimal raw.lxc 'lxc.init.cmd = /sbin/openrc-init'
```

### Creating usable containers

Run

```
lxd-setup
```

Create containers from template file

<https://github.com/thermitegod/shell-scripts/blob/master/python/template/config_lxd.py>

```
lxd-admin -u
```

### Note

Since LXD hosted gentoo image is build with GCC, have to rebuild using clang

Rebuilds @world with either GCC or Clang based on package.env

<https://github.com/thermitegod/shell-scripts/blob/master/python/gentoo_rebuild_world.py>

## Dependencies

### rutorrent

```
dev-lang/php
www-servers/lighttpd
net-p2p/rtorrent
www-apps/rutorrent
app-misc/screen
```

### transmission

```
net-p2p/transmission
```

