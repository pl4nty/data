-- Threat: \xd0!YellowKey.BB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_CLFS_FILE

if not mp.get_mpattribute("Lua:FileExtensionAttr!blf") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not string.find(l_0_0, "fstx\\95f62703b343f111a92a005056975458\\fstxlogs", 1, true) then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if 327680 < l_0_1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_1)
mp.readprotection(true)
if string.find(l_0_2, "\\\000?\000?\000\\\000C\000:\000\\\000S\000y\000s\000t\000e\000m\000 \000V\000o\000l\000u\000m\000e\000 \000I\000n\000f\000o\000r\000m\000a\000t\000i\000o\000n\000\\\000F\000s\000T\000x\000\\\0009\0005\000F\0006\0002\0007\0000\0003\000B\0003\0004\0003\000F\0001\0001\0001\000A\0009\0002\000A\0000\0000\0005\0000\0005\0006\0009\0007\0005\0004\0005\0008\000\\\000F\000s\000T\000x\000L\000o\000g\000s\000\\\000F\000s\000T\000x\000K\000t\000m\000L\000o\000g\000.\000b\000l\000f", 1, true) then
  if string.find(l_0_2, "%\000B\000L\000F\000%\000\\\000F\000s\000T\000x\000K\000t\000m\000L\000o\000g\000C\000o\000n\000t\000a\000i\000n\000e\000r", 1, true) then
    return mp.INFECTED
  end
elseif string.find(l_0_2, "\\\000?\000?\000\\\000C\000:\000\\\000S\000y\000s\000t\000e\000m\000 \000V\000o\000l\000u\000m\000e\000 \000I\000n\000f\000o\000r\000m\000a\000t\000i\000o\000n\000\\\000F\000s\000T\000x\000\\\0009\0005\000F\0006\0002\0007\0000\0003\000B\0003\0004\0003\000F\0001\0001\0001\000A\0009\0002\000A\0000\0000\0005\0000\0005\0006\0009\0007\0005\0004\0005\0008\000\\\000F\000s\000T\000x\000L\000o\000g\000s\000\\\000F\000s\000T\000x\000L\000o\000g\000.\000b\000l\000f", 1, true) and string.find(l_0_2, "%\000B\000L\000F\000%\000\\\000F\000s\000T\000x\000L\000o\000g\000C\000o\000n\000t\000a\000i\000n\000e\000r", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
