-- Threat: !InfrastructureShared
-- Name: e9b3f56ac29d
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[3].wp2 == nil then
  return mp.CLEAN
end
return mp.INFECTED
