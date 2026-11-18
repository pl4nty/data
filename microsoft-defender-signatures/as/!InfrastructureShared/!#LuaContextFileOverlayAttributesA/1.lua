-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/FileOverlayAttributes.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile & pea_hasappendeddata

if mp.get_mpattribute("Exception:FileOverlayAttributes") == true or mp.ispackedwith("AutoIt+") == true or mp.get_mpattributesubstring("Win32/AutoIt") or mp.get_mpattributesubstring("PESTATIC:cleanstub_autoitv") then
  return mp.CLEAN
end
if pehdr == nil or pehdr.ImageBase == nil or pehdr.NumberOfSections == nil then
  return mp.CLEAN
end
local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
local l_0_1 = mp.getfilesize()
if l_0_0 == nil or l_0_1 == nil or l_0_0 >= l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1 - l_0_0
if l_0_2 <= 4096 then
  return mp.CLEAN
end
if 4096 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT0x1000")
end
if 12288 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT0x3000")
end
if 20480 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT0x5000")
end
if 65536 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT0x10000")
end
if 131072 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT0x20000")
end
if 327680 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT0x50000")
end
if 1048576 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT1MB")
end
if 2097152 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT2MB")
end
if 5242880 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT5MB")
end
if 10485760 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT10MB")
end
if 20971520 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT20MB")
end
if 104857600 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileOverlayGT100MB")
end
return mp.CLEAN
