-- Threat: !InfrastructureShared
-- Name: !#ALFPER:ContextualDropEXEuTorrent.A
-- Type: 9

if peattributes.isdll then
  return mp.CLEAN
end
if peattributes.isdamaged then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_1:find("\\downloads\\", 1, true) then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_2 == "utorrent.exe" or l_0_2 == "utweb.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
