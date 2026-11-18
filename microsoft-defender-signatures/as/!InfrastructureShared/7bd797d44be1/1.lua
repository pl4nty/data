-- Threat: !InfrastructureShared
-- Name: 7bd797d44be1
-- Type: 21
-- Includes: ResearchData, BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if checkParentCmdlineCaseInsensitive(l_0_0, {
  {
    "",
    "SetupComplete.cmd"
  },
  {"", "oobe"},
  {"oobe", ""},
  {
    "\\Windows\\CCM\\",
    ""
  }
}, 3) then
  return mp.CLEAN
end
local l_0_2 = sysio.RegOpenKey("HKLM\\system\\setup")
if l_0_2 then
  local l_0_3 = sysio.GetRegValueAsString(l_0_2, "cmdline")
  if l_0_3 and l_0_3 ~= "" then
    if contains(l_0_3, {
      "oobe",
      "Setup",
      "Bootstrapper.vbs"
    }) then
      return mp.CLEAN
    end
    if not contains(l_0_3, {
      "\\Microsoft\\"
    }) then
      return mp.CLEAN
    end
    set_research_data("Cmdline", MpCommon.Base64Encode(l_0_1 .. "|cmdlineRegKey|" .. l_0_3), false)
    local l_0_4 = mp.GetParentProcInfo()
    if l_0_4 and l_0_4.ppid then
      local l_0_5 = add_parents_mp()
      local l_0_6 = {}
      l_0_6.cmdLine = l_0_1
      l_0_6.Parents = l_0_5
      l_0_6.CmdLineRegKey = l_0_3
      local l_0_7, l_0_8 = safeJsonSerialize(l_0_6, 150, nil, true)
      MpCommon.BmTriggerSig(l_0_4.ppid, "Tampering_Setup", l_0_7 or l_0_8)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
