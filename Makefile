V := @

all:
	$(V)echo "使用--always-make强制make执行"
	$(V)echo "install: 将当前目录下的脚本链接到~/.local/bin/"

my-script:
	$(V)ln -sf $(HOME)/dotfiles/my_script/maimpick ~/.local/bin/maimpick
	$(V)ln -sf $(HOME)/dotfiles/my_script/ext ~/.local/bin/ext
	$(V)ln -sf $(HOME)/dotfiles/my_script/linkhandler ~/.local/bin/linkhandler
	$(V)ln -sf $(HOME)/dotfiles/my_script/texclear ~/.local/bin/texclear
	$(V)ln -sf $(HOME)/dotfiles/my_script/ifinstalled ~/.local/bin/ifinstalled
	$(V)ln -sf $(HOME)/dotfiles/my_script/lmc ~/.local/bin/lmc
	$(V)ln -sf $(HOME)/dotfiles/my_script/dmenuunicode ~/.local/bin/dmenuunicode
	$(V)ln -sf $(HOME)/dotfiles/my_script/Screenkey ~/.local/bin/Screenkey
	$(V)ln -sf $(HOME)/dotfiles/my_script/lf-select ~/.local/bin/lf-select
	$(V)ln -sf $(HOME)/dotfiles/my_script/rotdir ~/.local/bin/rotdir
	$(V)ln -sf $(HOME)/dotfiles/my_script/set-bg ~/.local/bin/set-bg
	$(V)ln -sf $(HOME)/dotfiles/my_script/setctags_c ~/.local/bin/setctags_c
	$(V)ln -sf $(HOME)/dotfiles/my_script/remaps ~/.local/bin/remaps
	$(V)ln -sf $(HOME)/dotfiles/my_script/copyq_clear_history ~/.local/bin/copyq_clear_history
	$(V)ln -sf $(HOME)/dotfiles/my_script/rmnvidiamod ~/.local/bin/rmnvidiamod
	$(V)ln -sf $(HOME)/dotfiles/my_script/pickfull ~/.local/bin/pickfull
	$(V)echo "执行成功"
	# $(V)ln -sf $(HOME)/dotfiles/my_script/bluetooth_battery ~/.local/bin/bluetooth_battery

zsh:
	$(V)ln -sf $(HOME)/dotfiles/shell/.config/shell/profile ~/.zprofile

bash:
	$(V)ln -sf $(HOME)/dotfiles/shell/.config/shell/profile ~/.bash_profile

programs:
	$(V)pacman -Qqn > ./programs/.pacman.list
	$(V)pacman -Qqm > ./programs/.aur.list
	$(V)ls ~/AppImage/ > ./programs/.appimage.list
