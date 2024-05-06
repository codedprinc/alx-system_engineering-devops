# This manifest kills a process nameed `killmenow`.
exec { 'pkill -f killmenow':
  path => '/usr/bin:/usr/sbin:/bin'
}
