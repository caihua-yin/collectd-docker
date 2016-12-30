#!/bin/bash
set -eo pipefail

sed -i "s/{{HOSTNAME}}/$HOSTNAME/g" $WORKDIR/etc/collectd.conf
sed -i "s/{{SINK_SERVER}}/$SINK_SERVER/g" $WORKDIR/etc/collectd.conf
sed -i "s/{{SINK_PORT}}/$SINK_PORT/g" $WORKDIR/etc/collectd.conf

exec $WORKDIR/sbin/collectd -f -C $WORKDIR/etc/collectd.conf 
