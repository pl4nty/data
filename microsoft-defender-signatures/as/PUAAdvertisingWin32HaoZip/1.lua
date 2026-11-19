-- Threat: PUAAdvertising:Win32/HaoZip
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & MIXED:PUA:2345 & !BM_MZ_DLL

local l_0_0 = pe.get_versioninfo()
local l_0_1 = mp.getfilesize()
if l_0_0 == nil or l_0_1 < 8388608 then
  return mp.CLEAN
end
local l_0_2 = l_0_0.FileDescription
local l_0_3 = l_0_0.InternalName
if l_0_2 and l_0_3 == nil then
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "2345\229\165\189\229\142\139 v", 1, true) then
    mp.set_mpattribute("Lua:HaoZip")
    return mp.INFECTED
  end
end
return mp.CLEAN
