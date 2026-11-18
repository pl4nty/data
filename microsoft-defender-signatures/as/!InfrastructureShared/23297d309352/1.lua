-- Threat: !InfrastructureShared
-- Name: 23297d309352
-- Type: 21

if mp.get_mpattribute("BRUTE:ComFileExtStringInHeader") then
  return mp.CLEAN
end
return mp.INFECTED
