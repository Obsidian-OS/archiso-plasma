all: build_obsidianctl build_mkobsidiansfs build_archiso

build_obsidianctl:
	@echo "Building obsidianctl..."
	mkdir -p airootfs/usr/bin/
	cd obsidianctl && make
	cp obsidianctl/obsidianctl airootfs/usr/bin/

build_mkobsidiansfs:
	@echo "Building mkobsidiansfs..."
	mkdir -p airootfs/etc/
	cd mkobsidiansfs && chmod +x mkobsidiansfs
	cd mkobsidiansfs && ./mkobsidiansfs ../config.mkobsfs
	cp mkobsidiansfs/system.sfs airootfs/etc/

build_archiso:
	@echo Building ObsidianOS ISO Image...
	mkarchiso -v -r .
