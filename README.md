# Batocera File Browser #

Add [filebrowser](https://github.com/filebrowser/filebrowser) to [batocera](https://batocera.org/)

---
### Disclaimers
- I do not **own** nor **maintain** any of the actual projects in here. This is just a convenience script to set you up faster.

### Install
1. SSH into your batocera instance
2.  ```bash
    curl -fsSL https://github.com/itsadeadh2/batocera-filebrowser/raw/HEAD/bin/filebrowser_batocera.sh | bash
    reboot
    ``` 
   
> [filebrowser](https://github.com/filebrowser/filebrowser) should now be running under http://batocera, serving the contents of `/userdata/roms`  
Username and password should be `admin`.

> You might see a message saying `Something went wrong, File Browser is not in your path`, but don't worry, this is due to filebrowser not being installed at the expected default location.  
  It should still work as expected, but if you want to be sure, just run:  
  `/userdata/system/filebrowser --help`  
  if you see any output, you're good to go.

## Credits
- [Batocera](https://batocera.org/)
- [filebrowser](https://github.com/filebrowser/filebrowser)
