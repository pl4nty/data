-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:ContextualMotwJetDbFile
-- Type: 13
-- MpAttributes: BM_JETDB_FILE & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  local l_0_1 = mp.GetMOTWZone()
  if l_0_1 == 3 or l_0_1 == 4 then
    return mp.INFECTED
  end
end
return mp.CLEAN
