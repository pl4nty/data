-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspRemoteDllLoad.SB
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpOnModifiedCloseRtpScan & RPF:TopLevelFile & BM_MZ_DLL

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "rundll32.exe" and l_0_0 ~= "regsvr32.exe " then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
local l_0_2 = IsKeyInRollingQueue("SuspExeFileDroppedViaSMB", l_0_1, true)
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
