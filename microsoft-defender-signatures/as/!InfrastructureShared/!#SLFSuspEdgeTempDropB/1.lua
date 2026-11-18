-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspEdgeTempDrop.B
-- Type: 13
-- MpAttributes: BM_ZIP_FILE & RPF:TopLevelFile & MpOnOpenOrCloseRtpScan

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:match("\\windows\\temp\\[^\\]+.tmp$") then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 == "msedge.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
