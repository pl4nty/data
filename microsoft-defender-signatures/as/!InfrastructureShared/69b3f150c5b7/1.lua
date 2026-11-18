-- Threat: !InfrastructureShared
-- Name: 69b3f150c5b7
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
if string.find(l_0_0, "rundll32", 1, true) and string.find(l_0_0, "onlogon", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
