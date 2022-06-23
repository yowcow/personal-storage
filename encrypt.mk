GCP := _gcp
RECIPIENT := yowcow@gmail.com

$(GCP)/%.gpg: %
	mkdir -p $(dir $@)
	gpg --encrypt --yes --output $@ -r $(RECIPIENT) $<
