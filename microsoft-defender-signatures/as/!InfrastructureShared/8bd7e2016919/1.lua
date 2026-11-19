-- Threat: !InfrastructureShared
-- Name: 8bd7e2016919
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
