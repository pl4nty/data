-- Threat: !InfrastructureShared
-- Name: 51415d3861b9
-- Type: 21
-- Includes: BMLuaLib

if isPublicIP(this_sigattrlog[3].utf8p1) then
  return mp.INFECTED
end
return mp.CLEAN
