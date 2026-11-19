-- Threat: !InfrastructureShared
-- Name: !#Lua:MsBuildSuspicious.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (SLF:MSIL/HttpInvokeBase64 | SLFPER:MSIL/B64VmAlloc.B)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not string.find(l_0_0, "\\temp\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_1 ~= "msbuild.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_2, MpCommon.SMS_SCAN_MED)
end
return mp.INFECTED
