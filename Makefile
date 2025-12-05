SERVICE=NetworkManager
SERVICE_TARGET=multi-user
all: obsidianctl mkobsidiansfs obsidian-wizard installer obsidian-control archiso sign

.PHONY: obsidianctl
obsidianctl:
	@echo "Building obsidianctl..."
	mkdir -p airootfs/usr/bin/
	cd obsidianctl && make
	cp obsidianctl/obsidianctl airootfs/usr/bin/

.PHONY: mkobsidiansfs
mkobsidiansfs:
	@echo "Building mkobsidiansfs..."
	mkdir -p airootfs/usr/bin airootfs/etc
	cd mkobsidiansfs && \
	chmod +x mkobsidian* && \
	cp mkobsidiansfs* ../airootfs/usr/bin && \
	./mkobsidiansfs ../config.mkobsfs && \
	cp system.sfs ../airootfs/etc/

.PHONY: obsidian-wizard
obsidian-wizard:
	@echo "Building ObsidianOS Wizard..."
	cp obsidian-wizard/obsidian-wizard.py airootfs/usr/bin/obsidian-wizard

.PHONY: installer
installer:
	@echo "Building ObsidianOS Installer..."
	cp installer/installer.py airootfs/usr/bin/
	cp installer/logo.svg airootfs/usr/share/icons/obsidianos-installer.svg
	cp installer/obsidianos-installer.desktop airootfs/usr/share/applications/
	cp installer/obsidianos-installer.desktop airootfs/home/liveuser/Desktop

.PHONY: obsidian-control
obsidian-control:
	@echo "Building ObsidianOS Control Center..."
	cp obsidian-control/obsidian-control.py airootfs/usr/bin/obsidian-control
	cp obsidian-control/obsidian-control.desktop airootfs/usr/share/applications/

.PHONY: archiso
archiso:
	@echo "Building ObsidianOS ISO Image..."
	mkarchiso -v -r .

.PHONY: enable
enable:
	@echo Enabling $(SERVICE)...
	ln -s /usr/lib/systemd/system/NetworkManager.service ./airootfs/etc/systemd/system/$(SERVICE_TARGET).target.wants/

.PHONY: clean
clean:
	rm -rf airootfs/*
	rm -f *.iso *.iso.asc
	@echo "Cleaned build and ISO files"
