-- Threat: !InfrastructureShared
-- Name: !#SLF:LanchAfterDropBySystemDL
-- Type: 10

if peattributes.isdamaged then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) == true then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
  if not MpCommon.QueryPersistContext(l_0_0, "SystemDrop") then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
