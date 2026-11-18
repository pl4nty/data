-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/JsLoadDllOnMountedDrive
-- Type: 13
-- MpAttributes: MpFileIsOnRemovableDrive & BM_MZ_DLL & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2.image_path
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_3, "([^\\]+)$")
if l_0_0 == "rundll32.exe" and l_0_4 == "wscript.exe" then
  mp.set_mpattribute("Lua:Context/WscriptRundllLoadDllOnMountedDrive")
elseif l_0_0 == "regsvr32.exe" and l_0_4 == "wscript.exe" then
  mp.set_mpattribute("Lua:Context/WscriptRegsvrLoadDllOnMountedDrive")
elseif l_0_0 == "rundll32.exe" and l_0_4 == "cscript.exe" then
  mp.set_mpattribute("Lua:Context/CscriptRundllLoadDllOnMountedDrive")
elseif l_0_0 == "regsvr32.exe" and l_0_4 == "cscript.exe" then
  mp.set_mpattribute("Lua:Context/CscriptRegsvrLoadDllOnMountedDrive")
end
return mp.CLEAN
