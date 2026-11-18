-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/MsiexecDropDllLoad
-- Type: 13
-- MpAttributes: BM_MZ_DLL & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if MpCommon.QueryPersistContext(l_0_1, "DllDroppedByMsiexec") then
  if l_0_0 == "rundll32.exe" then
    mp.set_mpattribute("Lua:Context/MsiexecDropRundllLoad")
  elseif l_0_0 == "regsvr32.exe" then
    mp.set_mpattribute("Lua:Context/MsiexecDropRegsvrLoad")
  end
end
return mp.CLEAN
