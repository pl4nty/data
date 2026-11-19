-- Threat: !InfrastructureShared
-- Name: !#TELPER:ContextualDropPEDesktop.B
-- Type: 9

if peattributes.isdamaged then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_1:find("\\desktop$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
