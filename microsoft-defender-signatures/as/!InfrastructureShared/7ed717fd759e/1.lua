-- Threat: !InfrastructureShared
-- Name: 7ed717fd759e
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
