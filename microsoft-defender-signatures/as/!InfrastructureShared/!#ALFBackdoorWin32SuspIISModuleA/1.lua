-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/SuspIISModule.A
-- Type: 13
-- MpAttributes: MpOnModifiedCloseRtpScan & RPF:TopLevelFile & HSTR:IISModule & BM_UnsignedDll & HSTR:ScriptRuntimeUseHint & !AGGR:CleanModules

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows\\system32\\inetsrv\\", 1, true) == nil and string.find(l_0_0, "\\windows\\syswow64\\inetsrv\\", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
