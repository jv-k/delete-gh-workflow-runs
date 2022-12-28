################################################
## run from machine with docker installed
## requires GNU Make
################################################
start-docker: 
	docker compose run --entrypoint "/bin/bash" --rm demo --login

##########################################################
## run from debian machine or container 
## requires node/npm (ex: node:18-bullseye container)
##########################################################
install: install-misc install-gh
	npm i -g delete-workflow-runs

install-misc:
	apt update && \
	apt install -y jq fzf

## see official gh cli install instructions
## https://github.com/cli/cli/blob/trunk/docs/install_linux.md
install-gh: 
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
	&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" |  tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y
