BUCKET := gs://yowcow-personal/
DATA := data
GCP := _gcp
MAKE := make -j $(shell cat /proc/cpuinfo | grep ^processor | wc -l)

all:

encrypt: ARTIFACTS = $(addprefix $(GCP)/,$(addsuffix .gpg,$(shell find $(DATA) -type f)))
encrypt:
	$(MAKE) -f encrypt.mk $(ARTIFACTS)

upload:
	gsutil rsync \
		-r \
		$(GCP)/data/ $(BUCKET)

decrypt: FILES = $(basename $(shell find $(GCP) -type f))
decrypt: ARTIFACTS = $(FILES:$(GCP)/%=%)
decrypt:
	$(MAKE) -f decrypt.mk $(ARTIFACTS)

download: $(GCP)/$(DATA)
	gsutil rsync \
		-r \
		$(BUCKET) $<

$(GCP)/%:
	mkdir -p $@

.PHONY: all encrypt upload decrypt download
