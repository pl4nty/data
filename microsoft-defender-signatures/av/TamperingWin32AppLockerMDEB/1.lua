-- Threat: Tampering:Win32/AppLockerMDE.B
-- Type: 24
-- Includes: LuaFuncHelper, AppomalyHelpers, ResearchData
-- MpAttributes: AppLockerPolicyImport & MpIsPowerShellAMSIScan

local l_0_0 = tostring(headerpage) .. tostring(footerpage)
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.match(l_0_0, "set%-applockerpolicy%s+%-xmlpolicy%s+(.-%.xml)") or ""
l_0_1 = l_0_1:gsub("'", "")
l_0_1 = l_0_1:gsub("\"", "")
l_0_1 = l_0_1:gsub("^%.\\", "")
local l_0_2 = l_0_1:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
local l_0_3, l_0_4 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentAppLockerPolicyFileDropped", l_0_2)
if l_0_3 and l_0_4 then
  set_research_data("PolicyFile", MpCommon.Base64Encode(l_0_1 .. "|" .. l_0_4), false)
  local l_0_5 = {}
  l_0_5.policyFile = l_0_1
  l_0_5.Condition = l_0_4
  l_0_5.parents = add_parents_AMSI()
  local l_0_6, l_0_7 = safeJsonSerialize(l_0_5, 150, nil, true)
  if l_0_6 then
    local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
    if l_0_8 then
      MpCommon.BmTriggerSig(l_0_8, "LuaAppLockerMDE", safeJsonSerialize(l_0_6))
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
