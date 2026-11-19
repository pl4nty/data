-- Threat: !InfrastructureShared
-- Name: fdd7c8187339
-- Type: 21

local l_0_0 = {}
local l_0_1 = MpCommon.GetCurrentTimeT()
table.insert(l_0_0, l_0_1)
MpCommon.SetPersistContextNoPath("TaskSchedMiscTrigger", l_0_0, 3)
return mp.CLEAN
