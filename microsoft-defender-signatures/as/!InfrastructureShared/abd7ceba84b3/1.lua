-- Threat: !InfrastructureShared
-- Name: abd7ceba84b3
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
