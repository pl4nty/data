-- Threat: !InfrastructureShared
-- Name: 6bd7ffc398a0
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
