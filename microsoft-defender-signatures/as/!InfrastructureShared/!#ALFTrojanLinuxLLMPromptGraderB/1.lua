-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Linux/LLMPromptGrader.B
-- Type: 24
-- Includes: ResearchData, AppomalyHelpers, LuaFuncHelper
-- MpAttributes: cnt:llm:suspicious_arg & MpIsPowerShellAMSIScan

local l_0_0 = tostring(headerpage) .. tostring(footerpage)
local l_0_1, l_0_2 = LLMPromptGrader(l_0_0)
set_research_data("GradingInfo", table.concat(l_0_2, "|"), false)
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_3 then
  MpCommon.BmTriggerSig(l_0_3, "xplat_LLMPromptGrader_AMSI", safeJsonSerialize(l_0_2))
end
return mp.INFECTED
