-- Threat: !InfrastructureShared
-- Name: !#LUA:ForceJARScanRemoteDrop
-- Type: 12
-- MpAttributes: MpOnModifiedCloseRtpScan & BM_ZIP_FILE & SCPT:JarFile & RPF:TopLevelFile & Exploit:Java/Javabewhell.A

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
mp.set_mpattribute("MpForceScanArchives")
return mp.INFECTED
