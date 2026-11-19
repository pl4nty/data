-- Threat: !InfrastructureShared
-- Name: 947884b0c73d
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 and versioning.IsSeville() and versioning.GetCloudBlockLevel() >= 4 then
  return mp.INFECTED
end
return mp.CLEAN
