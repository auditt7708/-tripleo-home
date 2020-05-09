#!/usr/bin/env bash

deploy(){
	openstack overcloud deploy --templates \
		-r /home/stack/templates/roles_data.yaml \
		-n /home/stack/templates/network_data.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
                -e generated-openstack-tripleo-heat-templates/environments/net-multiple-nics-vlans.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovn-dvr-ha.yaml \
		-e /home/stack/templates/node-info.yaml \
		-e /home/stack/templates/network-config.yaml \
		-e /home/stack/templates/storage_custom.yaml \
		-e /home/stack/templates/kernel_args.yaml \
		-e /home/stack/templates/enable-tls.yaml \
		-e /home/stack/templates/tls-endpoints-public-ip.yaml \
		-e /home/stack/templates/inject-trust-anchor.yaml

}

$@


#-e ~/ssl-heat-templates/environments/ssl/enable-tls.yaml -e ~/ssl-heat-templates/environments/ssl/tls-endpoints-public-ip.yaml -e ~/ssl-heat-templates/environments/ssl/inject-trust-anchor.yaml