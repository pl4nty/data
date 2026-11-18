-- Threat: !InfrastructureShared
-- Name: !#AllowList:MITREFiles
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:FileHasMOTW

local l_0_0 = mp.GetMOTWHostUrl()
if l_0_0 ~= nil and l_0_0 ~= "" then
  l_0_0 = l_0_0:lower()
  if string.find(l_0_0, "https://attack.mitre.org", 1, true) ~= nil or string.find(l_0_0, "https://github.com/mitre/cti/blob", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
