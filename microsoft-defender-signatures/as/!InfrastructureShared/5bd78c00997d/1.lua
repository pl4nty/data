-- Threat: !InfrastructureShared
-- Name: 5bd78c00997d
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
