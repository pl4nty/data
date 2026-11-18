-- Threat: !InfrastructureShared
-- Name: 3278e968f82a
-- Type: 21

local function l_0_0(l_1_0)
  return tonumber(l_1_0:reverse():gsub(".", function(l_2_0)
    return string.format("%02x", string.byte(l_2_0))
  end), 16)
end

if not peattributes.hasappendeddata then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
local l_0_2 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
if l_0_2 == 0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = l_0_0(mp.readfile(l_0_2, 4))
mp.readprotection(true)
local l_0_4 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
local l_0_5 = l_0_1 - l_0_4
if l_0_1 < l_0_3 and 0 < l_0_5 and l_0_5 < 20480 then
  return mp.INFECTED
end
return mp.CLEAN
