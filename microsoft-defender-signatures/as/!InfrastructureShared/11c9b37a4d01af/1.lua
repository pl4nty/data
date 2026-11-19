-- Threat: !InfrastructureShared
-- Name: 11c9b37a4d01af
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = this_sigattrlog[47].matched and this_sigattrlog[47].utf8p2
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[47].ppid
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueKeyValues("gpo_schtasks", l_0_0)
if not l_0_2 then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_2) do
  bm.add_related_string("RemoteInvocation:GPO", l_0_4.value, bm.RelatedStringBMReport)
  MpCommon.BmTriggerSigPropagate(l_0_1, "RemoteInvocation:GPO", l_0_4.value)
  MpCommon.AddProcessAttribute(l_0_1, "RemoteInvocation:GPO", l_0_0, true)
end
return mp.INFECTED
