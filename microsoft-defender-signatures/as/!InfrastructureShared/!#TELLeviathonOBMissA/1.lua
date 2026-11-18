-- Threat: !InfrastructureShared
-- Name: !#TEL:LeviathonOBMiss.A
-- Type: 13
-- MpAttributes: /LeviathonKeyScan

if mp.GetResmgrBasePlugin() ~= "Regkeyvalue" then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "hklm\\software\\microsoft\\windows advanced threat protection", 1, true) ~= nil then
  local l_0_1
  local l_0_2 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows Advanced Threat Protection")
  if l_0_2 then
    l_0_1 = sysio.GetRegValueAsString(l_0_2, "OnboardedInfo")
  end
  if l_0_1 == nil or #l_0_1 < 10 or string.find(l_0_1, "orgId", 1, true) == false then
    return mp.INFECTED
  end
end
return mp.CLEAN
