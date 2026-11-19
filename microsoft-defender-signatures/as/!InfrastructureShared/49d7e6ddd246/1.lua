-- Threat: !InfrastructureShared
-- Name: 49d7e6ddd246
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
