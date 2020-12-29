#!/usr/bin/env bash

update_prepare(){
	openstack overcloud update prepare -y --templates --disable-validations --deployed-server \
		-r /home/stack/templates/roles_data.yaml \
		-n /home/stack/templates/network_data.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/deployed-server-environment.yaml \
                -e /home/stack/templates/overcloud-baremetal-deployed.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/services/heat-engine.yaml \
		-e ~/templates/network-environment-overrides.yaml \
		-e /home/stack/templates/network-config.yaml \
		-e /home/stack/templates/octavia-config.yaml \
		-e /home/stack/templates/storage_custom.yaml \
		-e /home/stack/templates/kernel_args.yaml \
		-e /home/stack/templates/overcommit.yaml \
		-e /home/stack/templates/enable-tls.yaml \
		-e /home/stack/templates/tls-endpoints-public-dns.yaml \
		-e /home/stack/templates/cloudname.yaml \
		-e /home/stack/templates/inject-trust-anchor.yaml \
		-e /home/stack/containers-prepare-parameter.yaml 

}



update_converge(){
	openstack overcloud update converge -y --templates --disable-validations --deployed-server \
		-r /home/stack/templates/roles_data.yaml \
		-n /home/stack/templates/network_data.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/deployed-server-environment.yaml \
                -e /home/stack/templates/overcloud-baremetal-deployed.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/services/heat-engine.yaml \
		-e ~/templates/network-environment-overrides.yaml \
		-e /home/stack/templates/network-config.yaml \
		-e /home/stack/templates/octavia-config.yaml \
		-e /home/stack/templates/storage_custom.yaml \
		-e /home/stack/templates/kernel_args.yaml \
		-e /home/stack/templates/overcommit.yaml \
		-e /home/stack/templates/enable-tls.yaml \
		-e /home/stack/templates/tls-endpoints-public-dns.yaml \
		-e /home/stack/templates/cloudname.yaml \
		-e /home/stack/templates/inject-trust-anchor.yaml \
		-e /home/stack/containers-prepare-parameter.yaml 

}


$@

