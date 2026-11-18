-- Threat: !InfrastructureShared
-- Name: 6bd7dd0c93a2
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
