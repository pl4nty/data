-- Threat: !InfrastructureShared
-- Name: c2d70590fa02
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers, BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if checkParentCmdlineCaseInsensitive(l_0_0, {
  {"", "Setup"},
  {"", "oobe"},
  {"oobe", ""},
  {
    "\\Windows\\CCM\\",
    ""
  }
}, 3) then
  return mp.CLEAN
end
set_research_data("Cmdline", MpCommon.Base64Encode(l_0_1), false)
local l_0_2 = sysio.RegOpenKey("HKLM\\system\\setup")
if l_0_2 then
  local l_0_3 = sysio.GetRegValueAsDword(l_0_2, "setuptype")
  if l_0_3 and l_0_3 == 2 then
    local l_0_4 = mp.GetParentProcInfo()
    if l_0_4 and l_0_4.ppid then
      local l_0_5 = add_parents_mp()
      local l_0_6 = {}
      l_0_6.cmdLine = l_0_1
      l_0_6.Parents = l_0_5
      local l_0_7, l_0_8 = safeJsonSerialize(l_0_6, 150, nil, true)
      MpCommon.BmTriggerSig(l_0_4.ppid, "Tampering_Setup", l_0_7 or l_0_8)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
