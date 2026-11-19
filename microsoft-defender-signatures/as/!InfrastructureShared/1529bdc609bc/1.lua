-- Threat: !InfrastructureShared
-- Name: 1529bdc609bc
-- Type: 21

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if l_0_0 then
  MpCommon.BmTriggerSig(l_0_0, "BM_UtimePresent", l_0_1)
end
return mp.INFECTED
