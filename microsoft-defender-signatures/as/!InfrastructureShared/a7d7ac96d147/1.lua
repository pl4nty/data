-- Threat: !InfrastructureShared
-- Name: a7d7ac96d147
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
