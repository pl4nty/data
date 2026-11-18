-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/HopSkipJumpPayload.B
-- Type: 13
-- Includes: ResearchData
-- MpAttributes: ALF:Trojan:Win32/HopSkipJump.A

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = string.match(l_0_2, "^(.*)%.exe$")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = MpCommon.PathToWin32Path(l_0_1 .. "\\" .. l_0_3)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
set_research_data("HopPayloadPath", l_0_4, false)
local l_0_5 = sysio.IsFileExists(l_0_4)
if l_0_5 then
  mp.ReportLowfi(l_0_4, 892398022)
end
return mp.CLEAN
