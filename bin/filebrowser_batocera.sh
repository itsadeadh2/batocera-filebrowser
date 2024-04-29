#!/bin/bash

# Download the script
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh -o install.sh

# Modify a specific line in the script. For example, changing line 10:
sed -i '10s/.*/install_path="/userdata/system"/' install.sh

# Execute the modified script
bash install.sh

echo "Creating custom.sh"
cat > /userdata/system/custom.sh <<'EOF'
#!/bin/bash
case "$1" in
    start)
        # Code in here will only be executed on boot.
        echo "Starting filebrowser"
        /userdata/system/filebrowser -r /userdata/roms -a 0.0.0.0 -p 80
;;

esac

EOF
