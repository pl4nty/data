-- Threat: !InfrastructureShared
-- Name: !#Lua:NewWrittenBySystemProcess
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & MpOnModifiedCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
if l_0_0 == 4 then
  return mp.INFECTED
end
return mp.CLEAN
