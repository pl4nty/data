-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextFileOverlayAttributesA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Exception:FileOverlayAttributes") == true or (mp.ispackedwith)("AutoIt+") == true or (mp.get_mpattributesubstring)("Win32/AutoIt") or (mp.get_mpattributesubstring)("PESTATIC:cleanstub_autoitv") then
  return mp.CLEAN
end
if pehdr == nil or pehdr.ImageBase == nil or pehdr.NumberOfSections == nil then
  return mp.CLEAN
end
local l_0_0 = (pesecs[pehdr.NumberOfSections]).PointerToRawData + (pesecs[pehdr.NumberOfSections]).SizeOfRawData
local l_0_1 = (mp.getfilesize)()
if l_0_0 == nil or l_0_1 == nil or l_0_1 <= l_0_0 then
  return mp.CLEAN
end
local l_0_2 = l_0_1 - l_0_0
if l_0_2 <= 4096 then
  return mp.CLEAN
end
if l_0_2 > 4096 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT0x1000")
end
if l_0_2 > 12288 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT0x3000")
end
if l_0_2 > 20480 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT0x5000")
end
if l_0_2 > 65536 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT0x10000")
end
if l_0_2 > 131072 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT0x20000")
end
if l_0_2 > 327680 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT0x50000")
end
if l_0_2 > 1048576 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT1MB")
end
if l_0_2 > 2097152 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT2MB")
end
if l_0_2 > 5242880 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT5MB")
end
if l_0_2 > 10485760 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT10MB")
end
if l_0_2 > 20971520 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT20MB")
end
if l_0_2 > 104857600 then
  (mp.set_mpattribute)("Lua:Context/FileOverlayGT100MB")
end
return mp.CLEAN

