-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55d71dfdda1a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 and l_0_2.ppid then
  (MpCommon.BmTriggerSig)(l_0_2.ppid, "Tampering_PPL_ClipUpMisuse", l_0_1)
end
set_research_data("TamperingCmd", (MpCommon.Base64Encode)(l_0_1), false)
return mp.INFECTED

