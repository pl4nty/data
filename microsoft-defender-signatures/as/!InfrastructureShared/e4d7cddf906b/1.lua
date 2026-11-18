-- Threat: !InfrastructureShared
-- Name: e4d7cddf906b
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
