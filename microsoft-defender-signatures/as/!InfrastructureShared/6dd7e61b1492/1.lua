-- Threat: !InfrastructureShared
-- Name: 6dd7e61b1492
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
