-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:Winnti.A!dha
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 ~= "smalled.fon" then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_2 ~= "c:\\windows\\fonts" then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
