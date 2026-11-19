-- Threat: !InfrastructureShared
-- Name: 84b39c93b351
-- Type: 21
-- Includes: BMLuaLib

if not versioning.IsSeville() and not versioning.IsServer() and versioning.IsSampled(11000, true, true, true) == false then
  return mp.CLEAN
end
local l_0_0 = mp.CLEAN
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[2].utf8p2)
end
if l_0_0 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
