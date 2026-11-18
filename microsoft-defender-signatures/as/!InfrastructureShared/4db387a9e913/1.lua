-- Threat: !InfrastructureShared
-- Name: 4db387a9e913
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  if l_0_1 == "09b4f598-dea5-4f63-820d-06e6c82d8806" then
    return mp.CLEAN
  end
end
return mp.INFECTED
