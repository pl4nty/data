-- Threat: !InfrastructureShared
-- Name: !#Lua:DorkbotFileName.B
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if string.lower(l_0_1) ~= "screensaverpro.scr" then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.sub(l_0_2, -17) == "\\application data" or string.sub(l_0_2, -16) == "\\appdata\\roaming" then
    mp.set_mpattribute("Lua:DorkbotFileName.B")
    return mp.INFECTED
  end
end
return mp.CLEAN
