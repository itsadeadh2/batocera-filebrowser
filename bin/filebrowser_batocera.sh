#!/bin/bash

# Download the script
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh -o install.sh

echo "Original line 29:"
sed -n '29p' install.sh

sed -i '29s#.*#install_path="/userdata/system"#' install.sh


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
