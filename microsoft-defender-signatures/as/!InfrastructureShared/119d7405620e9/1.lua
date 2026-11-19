-- Threat: !InfrastructureShared
-- Name: 119d7405620e9
-- Type: 21
-- Includes: AppomalyHelpers, LuaFuncHelper, ResearchData

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 < 200 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
local l_0_3 = {
  "winlogon.exe",
  "explorer.exe"
}
if l_0_2 and l_0_2.image_path and Contains_any_caseinsenstive(l_0_2.image_path, l_0_3) then
  return mp.CLEAN
end
local l_0_4, l_0_5 = LLMPromptGrader(l_0_1)
local l_0_6 = false
if 215 <= l_0_4 and l_0_5.hasSuspPattern then
  l_0_6 = true
end
if l_0_4 <= 0 then
  return mp.CLEAN
end
if l_0_4 < 5 and #l_0_1 < 500 then
  return mp.CLEAN
end
l_0_5.Cmdline = l_0_1
l_0_5.Parents = add_parents_mp()
if parent_mp_contains(l_0_5.Parents, "curl") or parent_mp_contains(l_0_5.Parents, "wget") then
  l_0_4 = l_0_4 + 20
end
l_0_5.IsBlocking = l_0_6
l_0_5.LLM_Info = GetLLMModelFromCmd(l_0_1)
local l_0_7 = safeJsonSerialize(l_0_5, 150, nil, true)
if l_0_2 and l_0_2.ppid then
  MpCommon.BmTriggerSig(l_0_2.ppid, "LLMPromptGrader", l_0_7)
end
set_research_data("IsBlocking", l_0_6, false)
set_research_data("Evidence", MpCommon.Base64Encode(l_0_7), false)
set_research_data("LLM_Technology", MpCommon.Base64Encode(safeJsonSerialize(l_0_5.LLM_Info)), false)
if l_0_6 then
  return mp.INFECTED
end
return mp.LOWFI
