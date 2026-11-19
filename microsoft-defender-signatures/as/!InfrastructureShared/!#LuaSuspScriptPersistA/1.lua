-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspScriptPersist.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_NewlyCreatedScriptFile & SCRIPT:SuspScriptPersist.A

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_0))
local l_0_1 = {}
table.insert(l_0_1, l_0_0)
MpCommon.SetPersistContextNoPath("SuspScriptPersist", l_0_1, 0)
return mp.CLEAN
