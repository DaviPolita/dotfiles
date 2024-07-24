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

.PHONY: gp
gp:
	@echo 'Starting GP App Dev Enviroment...'
	code Projetos/Applications/GP/BE/api-server
	code Projetos/Applications/GP/FE/client
