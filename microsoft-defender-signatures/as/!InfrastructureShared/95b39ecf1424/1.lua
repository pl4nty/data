-- Threat: !InfrastructureShared
-- Name: 95b39ecf1424
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.CLEAN
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[2].utf8p2, true)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[3].utf8p2, true)
end
if l_0_0 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
