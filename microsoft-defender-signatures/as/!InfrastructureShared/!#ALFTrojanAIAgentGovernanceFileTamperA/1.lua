-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIAgent/GovernanceFileTamper.A
-- Type: 24
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = mp.get_mpattribute("Lua:FnameAttr!soul.md")
local l_0_2 = mp.get_mpattribute("Lua:FnameAttr!agents.md")
local l_0_3 = mp.get_mpattribute("Lua:FnameAttr!claude.md")
local l_0_4 = mp.get_mpattribute("Lua:FnameAttr!copilot-instructions.md")
if not l_0_1 and not l_0_2 and not l_0_3 and not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = mp.getfilesize()
if l_0_5 < 10 or 262144 < l_0_5 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_6 = tostring(mp.readfile(0, l_0_5))
mp.readprotection(true)
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = string.lower(l_0_6)
local l_0_8 = {}
if string.find(l_0_7, "ignore previous instructions", 1, true) then
  l_0_8[#l_0_8 + 1] = "ignore_instructions"
end
if string.find(l_0_7, "bypass", 1, true) and string.find(l_0_7, "safety", 1, true) then
  l_0_8[#l_0_8 + 1] = "bypass_safety"
end
if string.find(l_0_7, "disable", 1, true) and (string.find(l_0_7, "guardrail", 1, true) or string.find(l_0_7, "restriction", 1, true)) then
  l_0_8[#l_0_8 + 1] = "disable_guardrails"
end
if string.find(l_0_7, "you are now", 1, true) and string.find(l_0_7, "no restrictions", 1, true) then
  l_0_8[#l_0_8 + 1] = "persona_override"
end
if string.find(l_0_7, "execute any command", 1, true) then
  l_0_8[#l_0_8 + 1] = "unrestricted_exec"
end
if string.find(l_0_7, "do not ask for confirmation", 1, true) then
  l_0_8[#l_0_8 + 1] = "no_confirmation"
end
local l_0_9 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)) or "unknown"
local l_0_10 = {
  file = l_0_9,
  tamper_signals = 0 < #l_0_8 and table.concat(l_0_8, ",") or "write_only"
}
local l_0_11 = safeJsonSerialize(l_0_10)
set_research_data("AIAgent_GovernanceFileTamper", l_0_11, false)
local l_0_12 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_12 then
  MpCommon.BmTriggerSig(l_0_12, "AIAgent_GovernanceFileTamper", l_0_11)
end
mp.SetDetectionString(l_0_11)
return mp.INFECTED
