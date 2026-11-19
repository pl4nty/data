-- Threat: !InfrastructureShared
-- Name: !#Lua:OpenBySystemProcess
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
  if l_0_0 == 4 then
    return mp.INFECTED
  end
end
return mp.CLEAN
