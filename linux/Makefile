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

# --- Claude / Anthropic direct-egress bypass (surgical; does NOT touch awg/rwg) ---
# The WEG proxy MITM-inspects and buffers TLS, which breaks Claude Code's large
# streaming requests ("API error - Retrying"). These targets add ONE additive
# drop-in that sorts AFTER proxy.sh and routes ONLY Anthropic domains around the
# proxy. proxy.sh / DNS / wsl.conf / docker are never modified, so awg/rwg keep
# working unchanged. Reversible: add = create one file, remove = rm one file.
CLAUDE_NOPROXY_FILE    := /etc/profile.d/zzz-claude-noproxy.sh
CLAUDE_NOPROXY_DOMAINS := .anthropic.com,console.anthropic.com,statsig.anthropic.com,claude.ai,sentry.io

.PHONY: claude/add
claude/add:
	@echo 'Routing Anthropic domains around the WEG proxy (reversible)...'
	@printf '%s\n' \
	  '# Added by `make claude/add`. Undo with `make claude/remove`.' \
	  'export no_proxy="$${no_proxy},$(CLAUDE_NOPROXY_DOMAINS)"' \
	  'export NO_PROXY="$${NO_PROXY},$(CLAUDE_NOPROXY_DOMAINS)"' \
	  | sudo tee $(CLAUDE_NOPROXY_FILE) >/dev/null
	@echo 'Wrote $(CLAUDE_NOPROXY_FILE)'
	@echo '>> Restart your shell (exec zsh) AND Claude Code for it to take effect.'

.PHONY: claude/remove
claude/remove:
	@echo 'Restoring default (proxied) behavior for Anthropic...'
	sudo rm -f $(CLAUDE_NOPROXY_FILE)
	@echo 'Removed $(CLAUDE_NOPROXY_FILE). Restart your shell + Claude Code.'

.PHONY: claude/status
claude/status:
	@echo "drop-in: $(CLAUDE_NOPROXY_FILE)"
	@test -f $(CLAUDE_NOPROXY_FILE) && echo "state: ACTIVE (Anthropic bypasses proxy)" || echo "state: inactive (Anthropic goes through proxy)"
	@echo -n "live cert issuer for api.anthropic.com: "
	@echo | openssl s_client -connect api.anthropic.com:443 -servername api.anthropic.com 2>/dev/null | openssl x509 -noout -issuer 2>/dev/null || echo "(probe failed)"

# Start docker only if it isn't already up. The `sleep 2` gives the DB (and
# other) containers a moment to boot before the backend servers connect, so they
# don't start, fail against a cold DB, and exit. If docker is already running the
# containers are already up, so we skip both the start and the wait.
.PHONY: dckr
dckr:
	@if docker info >/dev/null 2>&1; then \
		echo 'Docker already running, skipping start.'; \
	else \
		echo 'Docker not running, starting...'; \
		sudo service docker start && sleep 2; \
	fi

# Open a tmux window split in two and run `make dev` in each pane.
# Usage: $(call dev_term,<left-pane-dir>,<right-pane-dir>)
define dev_term
tmux new-window \; split-window -h \; send-keys 'cd $(2) && make dev' C-m \; select-pane -t 0 \; send-keys 'cd $(1) && make dev' C-m
endef

.PHONY: gp_term
gp_term: dckr
	$(call dev_term,Projetos/Applications/GP/BE/api-server,Projetos/Applications/GP/FE/client)

.PHONY: gp_term2
gp_term2: dckr
	$(call dev_term,Projetos/Applications/GP/app/api,Projetos/Applications/GP/app/web)

.PHONY: horizon_term
horizon_term:
	$(call dev_term,Projetos/Applications/GP/gp-horizon/api,Projetos/Applications/GP/gp-horizon/client)

.PHONY: gp
gp: gp_term
	@echo 'Starting GP App Dev Enviroment...'
	code Projetos/Applications/GP/BE/api-server
	code Projetos/Applications/GP/FE/client

.PHONY: gp2
gp2: gp_term2
	@echo 'Starting GP App Dev Enviroment...'
	code Projetos/Applications/GP/app/api
	code Projetos/Applications/GP/app/web

.PHONY: horizon
horizon: horizon_term
	@echo 'Starting Horizon Dev Enviroment...'
	code Projetos/Applications/GP/gp-horizon/api
	code Projetos/Applications/GP/gp-horizon/client

.PHONY: gp_not
gp_not:
	code Projetos/Applications/GP/services/gp-notify
	cd Projetos/Applications/GP/services/gp-notify && make dev

.PHONY: etl
etl:
	@echo 'Starting Airflow Dev Enviroment...'
	code Projetos/Airflow/SAP_ETL

