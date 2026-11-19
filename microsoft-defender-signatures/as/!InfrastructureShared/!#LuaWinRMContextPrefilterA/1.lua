-- Threat: !InfrastructureShared
-- Name: !#Lua:WinRMContextPrefilter.A
-- Type: 32

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_SCANREASON)
if not l_0_0 or l_0_1 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if not l_0_2 or type(l_0_3) ~= "string" then
  return mp.CLEAN
end
if not string.find(string.lower(l_0_3), "wsmprovhost.exe", 1, true) then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:Context/WinRMHostedShellAmsiCandidate.A")
local l_0_4 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if type(l_0_4) ~= "string" then
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_4)
local l_0_6 = string.find(l_0_5, "winrm", 1, true)
local l_0_7 = string.find(l_0_5, "ansible", 1, true)
if l_0_6 or l_0_7 or string.find(l_0_5, "\\wsm", 1, true) or string.find(l_0_5, "\\winrs", 1, true) or string.find(l_0_5, "\\ruby.exe", 1, true) or string.find(l_0_5, "\\ccmexec.exe", 1, true) or string.find(l_0_5, "\\sensendr.exe", 1, true) or string.find(l_0_5, "\\intunemanagementextension.exe", 1, true) then
  mp.set_mpattribute("Lua:Context/WinRMToolFileCandidate.A")
end
if l_0_6 or l_0_7 or string.find(l_0_5, "\\microsoft configuration manager", 1, true) or string.find(l_0_5, "\\ccm\\", 1, true) or string.find(l_0_5, "\\microsoft intune management extension", 1, true) then
  mp.set_mpattribute("Lua:Context/WinRMToolLocationCandidate.A")
end
return mp.CLEAN
