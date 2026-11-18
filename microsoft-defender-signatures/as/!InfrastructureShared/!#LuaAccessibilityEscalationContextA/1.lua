-- Threat: !InfrastructureShared
-- Name: !#Lua:AccessibilityEscalationContext.A
-- Type: 10
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile & HSTR:WindowsFile_CMD_EXE

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
local l_0_1 = string.lower(MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)))
if l_0_1 == nil or string.len(l_0_1) < 3 or l_0_0 == nil or string.len(l_0_0) < 5 then
  return mp.CLEAN
end
l_0_1 = l_0_1:gsub("\\\\%?\\", "")
local l_0_2 = string.lower(MpCommon.ExpandEnvironmentVariables("%windir%") .. "\\system32")
if l_0_1 ~= l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {
  ["sethc.exe"] = "sethc",
  ["utilman.exe"] = "utilman",
  ["osk.exe"] = "osk",
  ["magnify.exe"] = "magnify",
  ["narrator.exe"] = "narrator",
  ["displayswitch.exe"] = "displayswitch",
  ["atbroker.exe"] = "atbroker"
}
if l_0_3[l_0_0] ~= nil then
  local l_0_4 = l_0_3[l_0_0]
  mp.set_mpattribute("Lua:AccessibilityEscalationContext.A!" .. l_0_4)
  return mp.INFECTED
end
return mp.CLEAN
