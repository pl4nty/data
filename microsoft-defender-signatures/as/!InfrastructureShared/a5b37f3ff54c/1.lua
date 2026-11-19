-- Threat: !InfrastructureShared
-- Name: a5b37f3ff54c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if not versioning.IsSeville() and not versioning.IsServer() and versioning.IsSampled(11000, true, true, true) == false then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2 = getCurrentProcessInjectors()
if l_0_2 ~= nil then
  bm.add_related_string("GenRansom_injected", safeJsonSerialize(l_0_2), bm.RelatedStringBMReport)
end
if l_0_1 ~= nil then
  bm.add_related_string("GenRansom_injector", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
end
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 and reportGenericRansomware(this_sigattrlog[8].utf8p2) == mp.INFECTED then
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
