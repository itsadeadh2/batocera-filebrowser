#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

cat > /userdata/system/custom.sh <<EOF
#!/bin/bash
exec /usr/bin/filebrowser -r /userdata/roms -a 0.0.0.0 -p 80
EOF