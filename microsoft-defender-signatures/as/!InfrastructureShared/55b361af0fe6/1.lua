-- Threat: !InfrastructureShared
-- Name: 55b361af0fe6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if MpCommon.IsFriendlyProcess(l_0_0.ppid) then
  return mp.CLEAN
end
triggerMemoryScanOnProcessTree(true, true, "EMS", 5000, "Behavior:Win32/CobaltStrike.B!nri")
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED
