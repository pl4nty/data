-- Threat: !InfrastructureShared
-- Name: 398d4af10e75
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
MpCommon.BmTriggerSig(l_0_1, "BM_LockSmithTool", l_0_0)
return mp.INFECTED
