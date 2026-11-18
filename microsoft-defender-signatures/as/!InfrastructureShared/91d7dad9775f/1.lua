-- Threat: !InfrastructureShared
-- Name: 91d7dad9775f
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
