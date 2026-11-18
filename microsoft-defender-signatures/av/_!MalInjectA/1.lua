-- Threat: \xac!MalInject.A
-- Type: 8

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "injectable_dll_[^%.]+%.dll") == nil then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableMOACSyncInsert")
mp.set_mpattribute("MpDisableCaching")
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "sleeping_binary_[^%.]+%.exe") == nil then
  return mp.CLEAN
end
local l_0_3 = versioning.GetOrgID()
if l_0_3 == nil or type(l_0_3) ~= "string" then
  return mp.CLEAN
end
return mp.INFECTED
