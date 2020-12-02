#!/usr/bin/env bash

deploy(){
	openstack overcloud deploy --templates --disable-validations --deployed-server \
		-r /home/stack/templates/roles_data.yaml \
		-n /home/stack/templates/network_data.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/deployed-server-environment.yaml \
                -e /home/stack/templates/overcloud-baremetal-deployed.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
		-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
                -e ~/templates/network-environment-overrides.yaml \
		-e /home/stack/templates/network-config.yaml \
		-e /home/stack/templates/storage_custom.yaml \
		-e /home/stack/templates/kernel_args.yaml \
		-e /home/stack/templates/overcommit.yaml \
		-e /home/stack/templates/enable-tls.yaml \
		-e /home/stack/templates/tls-endpoints-public-dns.yaml \
		-e /home/stack/templates/cloudname.yaml \
		-e /home/stack/templates/inject-trust-anchor.yaml \
		-e /home/stack/containers-prepare-parameter.yaml 

}




deploy_config_download(){
        openstack overcloud deploy --templates --config-download-only --disable-validations --deployed-server \
                -n /home/stack/templates/network_data.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/deployed-server-environment.yaml \
		-e /home/stack/templates/overcloud-baremetal-deployed.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
                -e /home/stack/templates/generated-openstack-tripleo-heat-templates/environments/net-multiple-nics-vlans.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovn-dvr-ha.yaml \
                -e /home/stack/templates/node-info.yaml \
                -e /home/stack/templates/network-config.yaml \
                -e /home/stack/templates/storage_custom.yaml \
                -e /home/stack/templates/kernel_args.yaml \
                -e /home/stack/templates/enable-tls.yaml \
                -e /home/stack/templates/tls-endpoints-public-ip.yaml \
                -e /home/stack/templates/inject-trust-anchor.yaml \
                -e /home/stack/templates/overcommit.yaml

}

$@

#-e ~/ssl-heat-templates/environments/ssl/enable-tls.yaml -e ~/ssl-heat-templates/environments/ssl/tls-endpoints-public-ip.yaml -e ~/ssl-heat-templates/environments/ssl/inject-trust-anchor.yaml
