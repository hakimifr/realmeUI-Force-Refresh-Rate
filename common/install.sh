# fuck you shell checker i dont need shebang, stop being red

ui_print ""
ui_print "- Checking for the presence of .git directory"
if [ -e "$MODPATH/.git" ]; then
    ui_print "  .git directory detected! removing"
    rm -rf $MODPATH/.git
fi

ui_print ""
ui_print "Hello, as of now this script is only"
ui_print "For realme device that has 90hz display."
ui_print "For 120hz display, you need to be on realme UI"
ui_print "2.0. It might work for realme UI 1.0 user, but"
ui_print "idk"
ui_print "contact me on telegram for help:"
ui_print "https://t.me/Hakimi0804"
ui_print ""
ui_print "* note that reboot is not required as the module will"
ui_print "  run the force refresh rate command when you install it."
ui_print ""

rui290hz () {
    ui_print ""
    install_script -l $MODPATH/common/script2.sh
    service call SurfaceFlinger 1035 i32 1
}

rui190hz () {
    ui_print ""
    install_script -l $MODPATH/common/script1.sh
    service call SurfaceFlinger 1035 i32 0
}

r120hz () {
    ui_print ""
    install_script -l $MODPATH/common/script3.sh
    service call SurfaceFlinger 1035 i32 2
}

ui_print "- Checking realme UI version"
VERSION=$(getprop ro.build.version.opporom)

if [ "$VERSION" == "V11" ]; then
    ui_print "- realme UI 2.0 detected"
    ui_print "- Checking display refresh rate"
    rr=$(settings get system peak_refresh_rate)
    if [ "$rr" == "120.00001" ]; then
        ui_print "- Your device has 120hz display"
        ui_print "- Installing boot script for 120hz"
        r120hz
    elif [ "$rr" == "90.0" ]; then
        ui_print "- Your device has 90hz display"
        ui_print "- Installing boot script for 90hz display"
        rui290hz
    else
        abort "! Not supported!"
    fi
elif [ "$VERSION" == "V7" ]; then
    ui_print "- realme UI 1 detected"
    ui_print "I don't know if the module will work for 120hz"
    ui_print "device on realme UI 1, but give it a try and let"
    ui_print "me know."
    ui_print ""
    ui_print "- Installing boot script"
    rui190hz
else
    abort "! Sorry, your phone is not supported"
fi
