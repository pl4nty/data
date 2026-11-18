-- Threat: !InfrastructureShared
-- Name: !#Lua:VersionChk
-- Type: 10
-- MpAttributes: Lua:Company_Microsoft

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.InternalName
local l_0_2 = l_0_0.OriginalFilename
if l_0_1 then
  mp.set_mpattribute("LUA:2")
  for l_0_3 = 32, 47 do
    local l_0_4 = string.format("%c%c%c%c", l_0_3, l_0_3, l_0_3, l_0_3)
    if string.find(l_0_1, l_0_4, 1, true) ~= nil then
      mp.set_mpattribute("LUA:PEAnomaly_SpecialInternalName")
      break
    end
  end
end
if l_0_2 then
  for l_0_5 = 32, 47 do
    local l_0_6 = string.format("%c%c%c%c", l_0_5, l_0_5, l_0_5, l_0_5)
    if string.find(l_0_2, l_0_6, 1, true) ~= nil then
      mp.set_mpattribute("LUA:PEAnomaly_SpecialOrigName")
      break
    end
  end
end
return mp.CLEAN
