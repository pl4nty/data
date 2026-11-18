-- Threat: !InfrastructureShared
-- Name: 121b3fc9ef455
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.CLEAN
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[6].utf8p2)
end
if l_0_0 == mp.INFECTED then
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
