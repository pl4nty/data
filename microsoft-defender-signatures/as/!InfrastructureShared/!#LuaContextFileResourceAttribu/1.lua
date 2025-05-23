-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextFileResourceAttribu\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("CMN:HSTR:InstallerFile") == true or (mp.get_mpattribute)("Exception:FileResourceAttributes") == true then
  return mp.CLEAN
end
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil then
    return 
  end
  for l_1_4 = 1, pehdr.NumberOfSections do
    if tostring((pesecs[l_1_4]).Name) == l_1_0 then
      return (pesecs[l_1_4]).PointerToRawData, (pesecs[l_1_4]).SizeOfRawData
    end
  end
end

if pehdr == nil or pehdr.ImageBase == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = l_0_0(".rsrc")
if l_0_1 == nil or l_0_2 == nil or l_0_2 <= 4096 then
  return mp.CLEAN
end
if l_0_2 > 4096 then
  (mp.set_mpattribute)("Lua:Context/FileResouceGT0x1000")
end
if l_0_2 > 12288 then
  (mp.set_mpattribute)("Lua:Context/FileResouceGT0x3000")
end
if l_0_2 > 20480 then
  (mp.set_mpattribute)("Lua:Context/FileResouceGT0x5000")
end
if l_0_2 > 65536 then
  (mp.set_mpattribute)("Lua:Context/FileResouceGT0x10000")
end
if l_0_2 > 131072 then
  (mp.set_mpattribute)("Lua:Context/FileResouceGT0x20000")
end
if l_0_2 > 327680 then
  (mp.set_mpattribute)("Lua:Context/FileResouceGT0x50000")
end
if l_0_2 > 1048576 then
  (mp.set_mpattribute)("Lua:Context/FileResouceGT1MB")
end
if l_0_2 > 2097152 then
  (mp.set_mpattribute)("Lua:Context/FileResouceGT2MB")
end
local l_0_3 = pehdr.SizeOfCode
if l_0_3 < l_0_2 then
  (mp.set_mpattribute)("Lua:Context/ResourceSizeGreaterThanSizeOfCode")
end
return mp.CLEAN

