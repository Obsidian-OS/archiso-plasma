all: obsidianctl mkobsidiansfs obsidian-wizard installer archiso

obsidianctl:
	@echo "Building obsidianctl..."
	mkdir -p airootfs/usr/bin/
	cd obsidianctl && make
	cp obsidianctl/obsidianctl airootfs/usr/bin/

mkobsidiansfs:
	@echo "Building mkobsidiansfs..."
	mkdir -p airootfs/etc/
	cd mkobsidiansfs && chmod +x mkobsidiansfs
	cd mkobsidiansfs && ./mkobsidiansfs ../config.mkobsfs
	cp mkobsidiansfs/system.sfs airootfs/etc/
	cp mkobsidiansfs/mkobsidiansfs airootfs/usr/bin/

obsidian-wizard:
	@echo Building ObsidianOS Wizard...
	cp obsidian-wizard/obsidian-wizard.py airootfs/usr/bin/obsidian-wizard

installer:
	@echo Building ObsidianOS Installer...
	cp installer/installer.py airootfs/usr/bin/
	cp installer/logo.png airootfs/usr/bin/
	cp installer/obsidianos-installer.desktop airootfs/usr/share/applications/
	cp installer/obsidianos-installer.desktop airootfs/home/liveuser/Desktop

archiso:
	@echo Building ObsidianOS ISO Image...
	mkarchiso -v -r .
