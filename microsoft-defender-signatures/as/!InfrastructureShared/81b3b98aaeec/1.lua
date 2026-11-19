-- Threat: !InfrastructureShared
-- Name: 81b3b98aaeec
-- Type: 21

if this_sigattrlog[5].matched == false then
  return mp.INFECTED
end
return mp.CLEAN
