.PHONY: all external
all: install
	@./$<

install: dotbot/tools/git-submodule/install
	cp $< $@

dotbot/tools/git-submodule/install:
	git submodule update --init

GIT_PROMPT = ~/.config/zsh/git-prompt
GIT_PROMPT_URL = https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
PACKER = ~/.local/share/nvim/site/pack/packer/start/packer.nvim
PACKER_GIT_URL = https://github.com/wbthomason/packer.nvim.git

external: $(GIT_PROMPT) $(PACKER)

$(GIT_PROMPT):
	curl $(GIT_PROMPT_URL) | sed 's/PS1=/RPS1=/' > $@
	echo "__git_ps1 '' ''" >> $@

$(PACKER):
	git clone --depth 1 'https://github.com/wbthomason/packer.nvim' $@
