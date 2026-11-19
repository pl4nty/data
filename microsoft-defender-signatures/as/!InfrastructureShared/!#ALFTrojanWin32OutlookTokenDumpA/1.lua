-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/OutlookTokenDump.A
-- Type: 13
-- MpAttributes: BM_MEMDUMP_FILE & (MpOnModifiedCloseRtpScan | MpOnOpenRtpScan)

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_0:find("outlook.exe", 1, true) ~= 0 then
  return mp.INFECTED
end
return mp.CLEAN
