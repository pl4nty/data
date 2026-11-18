-- Threat: !InfrastructureShared
-- Name: !#Lua:MSIL/Metload
-- Type: 13
-- MpAttributes: SLFPER:MSIL/Metload.A & Lua:EXEExt & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = {}
table.insert(l_0_1, l_0_0)
MpCommon.SetPersistContextNoPath("Lua:Metload.A", l_0_1, 0)
return mp.INFECTED
