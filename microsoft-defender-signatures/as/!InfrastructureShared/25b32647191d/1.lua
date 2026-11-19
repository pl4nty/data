-- Threat: !InfrastructureShared
-- Name: 25b32647191d
-- Type: 21

local l_0_0 = {}
table.insert(l_0_0, bm.get_imagepath())
MpCommon.SetPersistContextNoPath("GenericSystemWinlogon", l_0_0, 0)
return mp.CLEAN
