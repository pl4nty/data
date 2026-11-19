-- Threat: !InfrastructureShared
-- Name: 5bb3e301d9f4
-- Type: 21
-- Includes: BMLuaLib

if not versioning.IsSeville() and not versioning.IsServer() and versioning.IsSampled(11000, true, true, true) == false then
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 and reportGenericRansomware(this_sigattrlog[2].utf8p2) == mp.INFECTED then
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
