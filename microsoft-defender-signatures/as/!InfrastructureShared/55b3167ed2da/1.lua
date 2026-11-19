-- Threat: !InfrastructureShared
-- Name: 55b3167ed2da
-- Type: 21

if this_sigattrlog[1].matched and string.sub(this_sigattrlog[1].wp1, -4) == ".pdf" then
  return mp.INFECTED
end
return mp.CLEAN
