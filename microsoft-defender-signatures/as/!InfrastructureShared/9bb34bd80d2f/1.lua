-- Threat: !InfrastructureShared
-- Name: 9bb34bd80d2f
-- Type: 21
-- Includes: BMLuaLib

if not versioning.IsSeville() and not versioning.IsServer() then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 and reportGenericRansomware(this_sigattrlog[3].utf8p2, true) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
