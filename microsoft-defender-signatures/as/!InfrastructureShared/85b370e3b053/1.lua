-- Threat: !InfrastructureShared
-- Name: 85b370e3b053
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 == nil then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and this_sigattrlog[3].wp2 == nil then
  return mp.CLEAN
end
if this_sigattrlog[4].matched and this_sigattrlog[4].wp2 == nil then
  return mp.CLEAN
end
return mp.INFECTED
