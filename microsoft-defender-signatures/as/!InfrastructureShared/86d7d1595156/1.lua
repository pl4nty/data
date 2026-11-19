-- Threat: !InfrastructureShared
-- Name: 86d7d1595156
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
