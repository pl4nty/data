-- Threat: !InfrastructureShared
-- Name: !#ALF:EnableTPExclusions
-- Type: 24
-- MpAttributes: /EnableTPExclusions

if mp.GetResmgrBasePlugin() ~= "Regkeyvalue" then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if not l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
