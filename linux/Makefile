# .PHONY: remove_weg_gargage
.PHONY: rwg
rwg:
	@echo 'Removing proxy...' 
	rm -f /etc/profile.d/proxy.sh
	@echo 'Removing dns...' 
	rm -f /etc/resolv.conf
	rm -f /etc/wsl.conf
	cp /etc/wsl_true.conf /etc/wsl.conf

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

.PHONY: gp_term
gp_term:
	tmux new-window \; \
	split-window -h \; \
	send-keys 'cd Projetos/Applications/GP/BE/api-server && make dev' C-m \; \
	select-pane -t 0 \; \
	send-keys 'cd Projetos/Applications/GP/FE/client && make dev' C-m

.PHONY: gp
gp: gp_term
	@echo 'Starting GP App Dev Enviroment...'
	code Projetos/Applications/GP/BE/api-server
	code Projetos/Applications/GP/FE/client




.PHONY: etl
etl:
	@echo 'Starting Airflow Dev Enviroment...'
	code Projetos/Airflow/SAP_ETL

