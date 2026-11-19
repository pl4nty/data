-- Threat: !InfrastructureShared
-- Name: 67d73a420718
-- Type: 21
-- Includes: HstrLuaLib

if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN
