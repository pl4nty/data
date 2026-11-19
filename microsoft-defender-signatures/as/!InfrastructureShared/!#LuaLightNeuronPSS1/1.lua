-- Threat: !InfrastructureShared
-- Name: !#Lua:LightNeuron.PS.S1
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:PS1Ext & AGGR:FileInSystemRoot.S1

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or string.len(l_0_0) < 4 or string.len(l_0_0) > 1000 then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:PSInServerSystemRoot.S01")
if l_0_0 == "msinp.ps1" then
  return mp.INFECTED
end
return mp.CLEAN
