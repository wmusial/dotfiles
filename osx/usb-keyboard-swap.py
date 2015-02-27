import plistlib
import os

plist = plistlib.readPlist("/System/Library/Extensions/IOHIDFamily.kext/Contents/PlugIns/IOHIDEventDriver.kext/Contents/Info.plist")
plist["IOKitPersonalities"]["HID Keyboard Driver"]["Swap command and alt"] = 1
plistlib.writePlist(plist, "/System/Library/Extensions/IOHIDFamily.kext/Contents/PlugIns/IOHIDEventDriver.kext/Contents/Info.plist")
os.utime("/System/Library/Extensions/IOHIDFamily.kext/Contents/PlugIns/IOHIDEventDriver.kext/Contents/Info.plist", None)
