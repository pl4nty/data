-- Threat: \xac!PersistInStartupDir.C
-- Type: 32
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = versioning.GetOrgID()
if l_0_1 == nil or type(l_0_1) ~= "string" then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "attackiqpersistencethroughstartupfolderbinary", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
