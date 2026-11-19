-- Threat: !InfrastructureShared
-- Name: a5b3da8417bf
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[2].wp1 == this_sigattrlog[3].wp1 then
  return mp.INFECTED
end
return mp.CLEAN
