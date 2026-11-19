-- Threat: !InfrastructureShared
-- Name: !#LUA:WithLongNumberFilename
-- Type: 8

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if string.match(l_0_1, "%a%a%a%a%a+%_%d%d%d%d%d%d%d%d%d%d%d+%.exe") then
    mp.set_mpattribute("LUA:WithLongNumberFilename")
  end
end
return mp.CLEAN
