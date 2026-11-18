-- Threat: !InfrastructureShared
-- Name: 4fd75c5ab8ea
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 ~= nil and l_0_0 ~= "" then
  return mp.INFECTED
end
return mp.LOWFI
