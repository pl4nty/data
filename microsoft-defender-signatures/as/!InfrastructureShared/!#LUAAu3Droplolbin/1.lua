-- Threat: !InfrastructureShared
-- Name: !#LUA:Au3Droplolbin
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if l_0_1 == "lol.bin" then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if l_0_2 == nil then
      return mp.CLEAN
    end
    if string.find(l_0_2, "\\appdata\\local\\temp", 1, true) then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
