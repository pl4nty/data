-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15bd7d65576eb\1.luac 

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
local l_0_2, l_0_3 = LLMPromptGrader(l_0_1)
if l_0_2 <= 0 then
  return mp.CLEAN
end
local l_0_4 = false
if l_0_2 >= 215 and l_0_3.hasSuspPattern then
  l_0_4 = true
end
l_0_3.Cmdline = l_0_1
l_0_3.Parents = add_parents_mp()
l_0_3.LLM_Info = GetLLMModelFromCmd(l_0_1)
local l_0_5 = (mp.GetParentProcInfo)()
local l_0_6 = safeJsonSerialize(l_0_3, 150, nil, true)
if l_0_5 and l_0_5.ppid then
  (MpCommon.BmTriggerSig)(l_0_5.ppid, "xplat_LLMPromptGrader", l_0_6)
end
set_research_data("IsBlocking", l_0_4, false)
set_research_data("Evidence", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_6)), false)
set_research_data("LLM_Technology", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_3.LLM_Info)), false)
return mp.INFECTED

