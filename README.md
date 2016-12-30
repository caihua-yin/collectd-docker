Docker image for collectd
=========================
Based on collectd 5.7.0, set following environment variables:
- `HOSTNAME`: The hostname of the node that runs collectd.
- `SINK_SERVER`: The network sink server hostname or address (default: localhost)
- `SINK_HOST`: The network sink port (defaut: 25826) 


##Run:
docker run -e HOSTNAME=node1 -e SINK_SERVER=192.168.33.21 yinc2/collectd
