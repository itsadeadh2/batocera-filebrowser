#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

echo "Creating custom.sh"
cat > /userdata/system/run-filebrowser.sh <<'EOF'
#!/bin/bash
case "$1" in
    start)
        # Code in here will only be executed on boot.
        echo "Starting filebrowser"
        /usr/bin/filebrowser -r /userdata/roms -a 0.0.0.0 -p 80
;;

esac

exit $?
EOF