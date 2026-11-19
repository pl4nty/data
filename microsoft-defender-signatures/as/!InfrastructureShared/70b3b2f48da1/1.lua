-- Threat: !InfrastructureShared
-- Name: 70b3b2f48da1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.CLEAN
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[1].utf8p2)
end
if l_0_0 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
