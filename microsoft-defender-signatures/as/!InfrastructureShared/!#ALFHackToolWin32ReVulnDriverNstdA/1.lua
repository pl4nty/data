-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/ReVulnDriverNstd.A
-- Type: 11
-- MpAttributes: RPF:TopLevelFile & BM_ESRP:Lua:RenamedSignedDriver & BM_ESRP:Lua:VulnerableAsrDriverMatched

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if string.find(l_0_0, ":\\windows\\system32\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\werdbg.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_1, MpCommon.SMS_SCAN_MED)
end
return mp.INFECTED
