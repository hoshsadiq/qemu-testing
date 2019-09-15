#!/sbin/openrc-run

depend() {
    after net-online
    need net
}

start_pre() {
    rm -f /tmp/k3s.*
}

supervisor=supervise-daemon
name="k3s"
command="/usr/local/bin/k3s"
command_args="server >>/var/log/k3s.log 2>&1"

output_log="/var/log/k3s.log"
error_log="/var/log/k3s.log"

pidfile="/var/run/k3s.pid"
respawn_delay=5

set -o allexport
if [ -f "/etc/environment" ]; then source "/etc/environment"; fi
if [ -f "/etc/rancher/k3s/env" ]; then source "/etc/rancher/k3s/env"; fi
set +o allexport
