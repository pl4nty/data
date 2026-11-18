-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/SuspSingleScriptResourceDSCMof.A
-- Type: 13
-- MpAttributes: Lua:MOFExt & SCPT:DSCScriptResource

mp.readprotection(false)
local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3 = l_0_1:gsub("instance of MSFT_", "")
mp.readprotection(true)
if l_0_3 == 1 then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
