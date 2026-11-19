-- Threat: !InfrastructureShared
-- Name: d6b31d8f5519
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[4].utf8p2, true)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[2].utf8p2, true)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[3].utf8p2, true)
end
if l_0_0 == mp.INFECTED then
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN
