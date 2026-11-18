-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/FileResourceAttributes.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

if mp.get_mpattribute("CMN:HSTR:InstallerFile") == true or mp.get_mpattribute("Exception:FileResourceAttributes") == true then
  return mp.CLEAN
end

local function l_0_0(l_1_0)
  if l_1_0 == nil then
    return
  end
  for l_1_1 = 1, pehdr.NumberOfSections do
    if tostring(pesecs[l_1_1].Name) == l_1_0 then
      return pesecs[l_1_1].PointerToRawData, pesecs[l_1_1].SizeOfRawData
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
if 4096 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileResouceGT0x1000")
end
if 12288 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileResouceGT0x3000")
end
if 20480 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileResouceGT0x5000")
end
if 65536 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileResouceGT0x10000")
end
if 131072 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileResouceGT0x20000")
end
if 327680 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileResouceGT0x50000")
end
if 1048576 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileResouceGT1MB")
end
if 2097152 < l_0_2 then
  mp.set_mpattribute("Lua:Context/FileResouceGT2MB")
end
local l_0_3 = pehdr.SizeOfCode
if l_0_2 > l_0_3 then
  mp.set_mpattribute("Lua:Context/ResourceSizeGreaterThanSizeOfCode")
end
return mp.CLEAN
