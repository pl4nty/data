-- Threat: !InfrastructureShared
-- Name: 121b34846fa73
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  MpCommon.TurnNriOnProcess(l_0_0.ppid)
end
return mp.INFECTED
