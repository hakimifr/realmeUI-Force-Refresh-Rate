# fuck you shell checker i dont need shebang, stop being red

ui_print ""
ui_print "Hello, as of now this script is only"
ui_print "For realme device that has 90hz display."
ui_print "For 120hz display, you need to be on realme UI"
ui_print "2.0. It might work for realme UI 1.0 user, but"
ui_print "idk"
ui_print "contact me on telegram for help:"
ui_print "https://t.me/Hakimi0804"
ui_print ""

rui290hz () {
    ui_print ""
    ui_print "~Installing boot script for realme UI 2.0"
    install_script -l $MODPATH/common/script2.sh
}

rui190hz () {
    ui_print ""
    ui_print "~Installing boot script for realme UI 1"
    install_script -l $MODPATH/common/script1.sh
}

r120hz () {
    ui_print ""
    ui_print "~Installing boot script"
    install_script -l $MODPATH/common/script3.sh
}

ui_print "- Checking realme UI version"
VERSION=$(getprop ro.build.version.opporom)

if [ "$VERSION" == "V11" ]; then
    ui_print "~realme UI 2.0 detected"
    ui_print "- Checking display refresh rate"
    rr=$(settings get system peak_refresh_rate)
    if [ "$rr" == "120.00001" ]; then
        ui_print "~Your device has 120hz display"
        ui_print "~Installing boot script for 120hz"
        r120hz
    elif [ "$rr" == "90.0" ]; then
        ui_print "~Your device has 90hz display"
        ui_print "~Installing boot script for 90hz display"
        rui290hz
    else
        abort "- Not supported!"
    fi
elif [ "$VERSION" == "V7" ]; then
    ui_print "~realme UI 1 detected"
    ui_print "I don't know if the module"
    ui_print "will work for 120hz device,"
    ui_print "but give it a try and let me"
    ui_print "know."
    ui_print "~Installing boot script"
    rui190hz
else
    abort "Sorry, your phone is not supported"
fi
