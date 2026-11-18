-- Threat: !InfrastructureShared
-- Name: !#Lua:WinRMHostedShellAmsiContext.A
-- Type: 12
-- Includes: WinRMSessionInfra
-- MpAttributes: Lua:Context/WinRMHostedShellAmsiCandidate.A

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_SCANREASON)
if not l_0_0 or l_0_1 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if not l_0_2 or type(l_0_3) ~= "string" then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3)
if not string.find(l_0_4, "wsmprovhost.exe", 1, true) then
  return mp.CLEAN
end
mp.set_mpattribute("MpIsWinRMHostedShellAMSIScan")
WinRMSessionTrackProcess("AMSI", "PSRemoting", "HostedShell")
SetWinRMSessionMetadata("AMSI", "transport", "psrp")
return mp.CLEAN
