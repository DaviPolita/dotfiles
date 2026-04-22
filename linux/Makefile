# .PHONY: remove_weg_gargage
.PHONY: rwg
rwg:
	@echo 'Removing proxy...'
	rm -f /etc/profile.d/proxy.sh
	@echo 'Removing dns...'
	rm -f /etc/resolv.conf
	rm -f /etc/wsl.conf
	cp /etc/wsl_true.conf /etc/wsl.conf
	@echo 'Removing docker proxy...'
	sed -i '/^export http_proxy=/d;/^export https_proxy=/d;/^export no_proxy=/d' /etc/default/docker
	sudo service docker restart && sleep 2
#	go env -w GOPROXY=https://proxy.golang.org,direct

# .PHONY: add weg garbage back
.PHONY: awg
awg:
	@echo 'Adding proxy...'
	cp /etc/profile.d/proxy_bkp /etc/profile.d/proxy.sh
	@echo 'Adding dns...'
	rm -f /etc/resolv.conf
	cp /etc/resolv_bkp.conf /etc/resolv.conf
	rm -f /etc/wsl.conf
	cp /etc/wsl_false.conf /etc/wsl.conf
	@echo 'Adding docker proxy...'
	bash -c 'source /etc/profile.d/proxy_bkp && grep -q "^export http_proxy=" /etc/default/docker || echo "export http_proxy=\"$$http_proxy\"" >> /etc/default/docker && grep -q "^export https_proxy=" /etc/default/docker || echo "export https_proxy=\"$$https_proxy\"" >> /etc/default/docker && grep -q "^export no_proxy=" /etc/default/docker || echo "export no_proxy=\"$$no_proxy\"" >> /etc/default/docker'
	sudo service docker restart && sleep 2
#	go env -w GOPROXY=https://${user}:${pass}@nexus3.weg.net/repository/golang-group/,direct

.PHONY: dckr
dckr:
	sudo service docker restart && sleep 2

.PHONY: gp_term
gp_term: dckr
	tmux new-window \; \
	split-window -h \; \
	send-keys 'cd Projetos/Applications/GP/FE/client && make dev' C-m \; \
	select-pane -t 0 \; \
	send-keys 'cd Projetos/Applications/GP/BE/api-server && make dev' C-m

.PHONY: boilerplate_term
boilerplate_term: 
	tmux new-window \; \
	split-window -h \; \
	send-keys 'cd Projetos/Applications/GP/gp-client-boilerplate && make dev' C-m \; \
	select-pane -t 0 \; \
	send-keys 'cd Projetos/Applications/GP/gp-boilerplate && make dev' C-m


.PHONY: gp
gp: gp_term
	@echo 'Starting GP App Dev Enviroment...'
	code Projetos/Applications/GP/BE/api-server
	code Projetos/Applications/GP/FE/client

.PHONY: boilerplate
boilerplate: boilerplate_term
	@echo 'Starting boilerplate Dev Enviroment...'
	code Projetos/Applications/GP/gp-boilerplate
	code Projetos/Applications/GP/gp-client-boilerplate

.PHONY: gp_not
gp_not:
	code Projetos/Applications/GP/services/gp-notify
	cd Projetos/Applications/GP/services/gp-notify && make dev

.PHONY: etl
etl:
	@echo 'Starting Airflow Dev Enviroment...'
	code Projetos/Airflow/SAP_ETL

