all: obsidianctl mkobsidiansfs archiso guidedobsidian

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

guidedobsidian:
	@echo "Building guidedobsidian..."
	cp guidedobsidian/guidedobsidian airootfs/usr/bin/

archiso:
	@echo Building ObsidianOS ISO Image...
	mkarchiso -v -r .
