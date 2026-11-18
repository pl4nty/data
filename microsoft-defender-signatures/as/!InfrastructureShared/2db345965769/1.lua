-- Threat: !InfrastructureShared
-- Name: 2db345965769
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
if not string.find(l_0_0, "/upload", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
