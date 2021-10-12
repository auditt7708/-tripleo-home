#!/usr/bin/env bash

deploy(){
	openstack overcloud deploy --debug --templates --disable-validations --deployed-server \
                --heat-container-api-image tripleo-director.ctlplane.localdomain:8787/tripleomaster/openstack-heat-api:current-tripleo \
		--heat-container-engine-image tripleo-director.ctlplane.localdomain:8787/tripleomaster/openstack-heat-engine:current-tripleo \
                -r /home/stack/templates/roles_data.yaml \
                -n /home/stack/templates/network_data_v2.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/deployed-server-environment.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \
                -e /home/stack/templates/octavia-config.yaml \
                -e ~/templates/network-environment-overrides.yaml \
                -e /home/stack/templates/network-config.yaml \
                -e /home/stack/templates/octavia-config.yaml \
                -e /home/stack/templates/storage_custom.yaml \
                -e /home/stack/templates/kernel_args.yaml \
                -e /home/stack/templates/compute_overcommit.yaml \
                -e /home/stack/templates/enable-tls.yaml \
                -e /home/stack/templates/tls-endpoints-public-dns.yaml \
                -e /home/stack/templates/cloudname.yaml \
                -e /home/stack/templates/inject-trust-anchor.yaml \
                -e /home/stack/templates/service_tuning.yaml \
                -e /home/stack/templates/baremetal-deployed.yaml \
                -e /home/stack/templates/vips-deployed.yaml \
                -e /home/stack/templates/vip_mapping.yaml \
                -e /home/stack/templates/set-deletion-policy.yaml \
		-e /home/stack/templates/bne-home-ldap-config.yaml \
                -e /home/stack/containers-prepare-parameter.yaml
}



deploy_stack_only(){
        openstack overcloud deploy --stack-only --debug --heat-type pod --templates --disable-validations --deployed-server \
                -r /home/stack/templates/roles_data.yaml \
                -n /home/stack/templates/network_data_v2.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/deployed-server-environment.yaml \
                -e /home/stack/templates/overcloud-baremetal-deployed.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \
                -e /home/stack/templates/octavia-config.yaml \
                -e ~/templates/network-environment-overrides.yaml \
                -e /home/stack/templates/network-config.yaml \
                -e /home/stack/templates/octavia-config.yaml \
                -e /home/stack/templates/storage_custom.yaml \
                -e /home/stack/templates/kernel_args.yaml \
                -e /home/stack/templates/compute_overcommit.yaml \
                -e /home/stack/templates/enable-tls.yaml \
                -e /home/stack/templates/tls-endpoints-public-dns.yaml \
                -e /home/stack/templates/cloudname.yaml \
                -e /home/stack/templates/inject-trust-anchor.yaml \
                -e /home/stack/templates/service_tuning.yaml \
                -e /home/stack/templates/networks-deployed.yaml \
                -e /home/stack/templates/baremetal-deployed.yaml \
                -e /home/stack/templates/vips-deployed.yaml \
                -e /home/stack/templates/vip_mapping.yaml \
                -e /home/stack/templates/set-deletion-policy.yaml \
		-e /home/stack/templates/bne-home-ldap-config.yaml \
                -e /home/stack/containers-prepare-parameter.yaml	
}

deploy_config_download(){
        openstack overcloud deploy --templates --config-download-only --disable-validations --deployed-server \
                -r /home/stack/templates/roles_data.yaml \
                -n /home/stack/templates/network_data_v2.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/deployed-server-environment.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
                -e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \
                -e /home/stack/templates/octavia-config.yaml \
                -e ~/templates/network-environment-overrides.yaml \
                -e /home/stack/templates/network-config.yaml \
                -e /home/stack/templates/octavia-config.yaml \
                -e /home/stack/templates/storage_custom.yaml \
                -e /home/stack/templates/kernel_args.yaml \
                -e /home/stack/templates/compute_overcommit.yaml \
                -e /home/stack/templates/enable-tls.yaml \
                -e /home/stack/templates/tls-endpoints-public-dns.yaml \
                -e /home/stack/templates/cloudname.yaml \
                -e /home/stack/templates/inject-trust-anchor.yaml \
                -e /home/stack/templates/service_tuning.yaml \
                -e /home/stack/templates/networks-deployed.yaml \
                -e /home/stack/templates/baremetal-deployed.yaml \
                -e /home/stack/templates/vips-deployed.yaml \
                -e /home/stack/templates/vip_mapping.yaml \
                -e /home/stack/templates/set-deletion-policy.yaml \
                -e /home/stack/containers-prepare-parameter.yaml
}

$@

#-e ~/ssl-heat-templates/environments/ssl/enable-tls.yaml -e ~/ssl-heat-templates/environments/ssl/tls-endpoints-public-ip.yaml -e ~/ssl-heat-templates/environments/ssl/inject-trust-anchor.yaml

