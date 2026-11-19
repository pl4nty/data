-- Threat: !InfrastructureShared
-- Name: 72b3d68d8ccd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if contains(l_0_0, "&#x09;") then
  return mp.INFECTED
end
return mp.CLEAN
