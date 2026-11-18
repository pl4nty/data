-- Threat: !InfrastructureShared
-- Name: !#SLF:Linux/SysmonitorElfDrop.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & MpOnModifiedCloseRtpScan & BM_ELF_FILE

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil then
  return mp.CLEAN
end
if string.match(l_0_0, "^/home/[^/]+/%.sysmonitor$") then
  return mp.INFECTED
end
return mp.CLEAN
