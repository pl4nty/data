-- Threat: !InfrastructureShared
-- Name: !#FDR:ContextualDropEXEDownloads!111P20
-- Type: 9

if peattributes.isdll then
  return mp.CLEAN
end
if peattributes.isdamaged then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_1:find("\\downloads$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
