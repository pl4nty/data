-- Threat: !InfrastructureShared
-- Name: 34d7ec70ffdb
-- Type: 21
-- Includes: HstrLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
local l_0_2 = false
l_0_2, _ = MpCommon.StringRegExpSearch("(\\s(diagtrack)(\\s|$))", l_0_1)
if l_0_2 == true and isTamperProtectionOn() then
  return mp.INFECTED
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_2 == true and l_0_3 ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path)
  local l_0_5 = l_0_4:match("([^\\]+)$")
  if l_0_5 and (l_0_5 == "services.exe" or string.find(l_0_5, "nsudo", 1, true) or string.find(l_0_5, "advrun", 1, true) or string.find(l_0_5, "runas", 1, true) or string.find(l_0_5, "runfrom", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
