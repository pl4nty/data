-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b361af0fe6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if (MpCommon.IsFriendlyProcess)(l_0_0.ppid) then
  return mp.CLEAN
end
triggerMemoryScanOnProcessTree(true, true, "EMS", 5000, "Behavior:Win32/CobaltStrike.B!nri")
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  (bm.add_related_string)("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED

