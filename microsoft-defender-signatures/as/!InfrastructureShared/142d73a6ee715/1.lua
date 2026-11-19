-- Threat: !InfrastructureShared
-- Name: 142d73a6ee715
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
