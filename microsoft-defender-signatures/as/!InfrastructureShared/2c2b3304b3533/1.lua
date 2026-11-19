-- Threat: !InfrastructureShared
-- Name: 2c2b3304b3533
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.CLEAN
if this_sigattrlog[16].matched and this_sigattrlog[16].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[16].utf8p2, true)
elseif this_sigattrlog[17].matched and this_sigattrlog[17].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[17].utf8p2, true)
end
if l_0_0 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
