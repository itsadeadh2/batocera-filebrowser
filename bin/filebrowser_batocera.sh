#!/bin/bash

# Download the installation script from filebrowser
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh -o install.sh

# Create custom installation folder
install_path=/userdata/system/bin
mkdir -p $install_path
# Small modification to the script to make filebrowser be installed at /userdata/system
sed -i '29s#.*#install_path="$install_path"#' install.sh

# Execute the modified script
bash install.sh
rm -f install.sh

# Check if custom.sh exists, append or create accordingly
FILE="/userdata/system/custom.sh"
if [ -f "$FILE" ]; then
    cp /userdata/system/custom.sh /userdata/system/custom.sh.backup
    echo "Appending to existing custom.sh"
    cat >> "$FILE" <<EOF
$install_path/filebrowser -r /userdata/roms -a 0.0.0.0 -p 80
EOF
else
    echo "Creating custom.sh"
    cat > "$FILE" <<EOF
#!/bin/bash
$install_path/filebrowser -r /userdata/roms -a 0.0.0.0 -p 80
EOF
fi