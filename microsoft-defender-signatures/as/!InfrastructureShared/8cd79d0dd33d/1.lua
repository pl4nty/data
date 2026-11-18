-- Threat: !InfrastructureShared
-- Name: 8cd79d0dd33d
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
