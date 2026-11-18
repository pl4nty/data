-- Threat: !InfrastructureShared
-- Name: 7ad7ea774f62
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
