#!/usr/bin/env bash

update_prepare(){
	openstack overcloud update prepare --templates --disable-validations --deployed-server \
                --heat-container-api-image registry.okd4.bne-shift.net:8443/tripleomastercentos9/openstack-heat-api:current-tripleo \
		--heat-container-engine-image registry.okd4.bne-shift.net:8443/tripleomastercentos9/openstack-heat-engine:current-tripleo \
		--answers-file /home/stack/templates/answers.yaml
}

update_converge(){
        openstack overcloud update converge -y
}

$@

