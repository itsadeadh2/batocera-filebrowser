#!/bin/bash

# Download the installation script from filebrowser
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh -o install.sh

# Small modification to the script to make filebrowser be installed at /userdata/system
sed -i '29s#.*#install_path="/userdata/system"#' install.sh

# Execute the modified script
bash install.sh

# Check if custom.sh exists, append or create accordingly
FILE="/userdata/system/custom.sh"
if [ -f "$FILE" ]; then
    echo "Appending to existing custom.sh"
    cat >> "$FILE" <<'EOF'
/userdata/system/filebrowser -r /userdata/roms -a 0.0.0.0 -p 80
EOF
else
    echo "Creating custom.sh"
    cat > "$FILE" <<'EOF'
#!/bin/bash
/userdata/system/filebrowser -r /userdata/roms -a 0.0.0.0 -p 80
EOF
fi