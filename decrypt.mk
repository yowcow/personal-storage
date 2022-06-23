DATA := data
GCP := _gcp

$(DATA)/%: $(GCP)/$(DATA)/%.gpg
	mkdir -p $(dir $@)
	gpg --decrypt --yes --output $@ $<

