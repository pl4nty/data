-- Threat: !InfrastructureShared
-- Name: 72d7cb2f50d7
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
