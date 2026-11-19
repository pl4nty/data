-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/NewlyCreatedZip
-- Type: 13
-- MpAttributes: Lua:ZIPExt & MpNewlyCreatedHint & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_1 = "NewlyCreatedZip"
local l_0_2 = MpCommon.QueryPersistContext(l_0_0, l_0_1)
if not l_0_2 then
  MpCommon.AppendPersistContext(l_0_0, l_0_1, 100)
end
return mp.INFECTED
