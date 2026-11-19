-- Threat: !InfrastructureShared
-- Name: 25b303f7e073
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
bm.add_threat_file(l_0_0)
return mp.INFECTED
