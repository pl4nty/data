-- Threat: !InfrastructureShared
-- Name: d1d70b11551a
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 ~= nil and l_0_0 ~= "" then
  return mp.INFECTED
end
return mp.LOWFI
