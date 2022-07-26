# Installing Quarto
TEMP_QUARTO="$(mktemp)" &&
wget -O "$TEMP_QUARTO" 'https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.37/quarto-1.0.37-linux-amd64.deb' &&
sudo dpkg -i "$TEMP_QUARTO"
rm -f "$TEMP_QUARTO"