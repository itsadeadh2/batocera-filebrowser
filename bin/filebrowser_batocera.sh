#!/bin/bash

# Download the installation script from filebrowser
curl -fsSL https://github.com/itsadeadh2/batocera-filebrowser/raw/HEAD/bin/custom_filebrowser.sh | bash

# Check if custom.sh exists, append or create accordingly
FILE="/userdata/system/custom.sh"
if [ -f "$FILE" ]; then
    cp /userdata/system/custom.sh /userdata/system/custom.sh.backup
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