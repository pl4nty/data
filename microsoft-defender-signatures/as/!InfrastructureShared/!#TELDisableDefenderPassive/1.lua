-- Threat: !InfrastructureShared
-- Name: !#TEL:DisableDefenderPassive
-- Type: 24
-- MpAttributes: /MpCfgScanDisableSpecialRunningModes1

if mp.GetResmgrBasePlugin() ~= "Regkeyvalue" then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if not l_0_0 or string.find(l_0_0, "Wow64", 13, true) then
  return mp.CLEAN
end
return mp.INFECTED
