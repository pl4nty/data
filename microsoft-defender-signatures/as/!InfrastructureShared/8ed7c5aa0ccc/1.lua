-- Threat: !InfrastructureShared
-- Name: 8ed7c5aa0ccc
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
