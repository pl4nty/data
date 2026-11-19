-- Threat: !InfrastructureShared
-- Name: !#LUA:Trojan:JS/Kilim!FB_filename
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if nil ~= string.find(l_0_1, "asdfrtv%l%l%l%l%l%l%l%l%.js") then
    mp.set_mpattribute("LUA:Trojan:JS/Kilim!FB_filename")
  end
end
return mp.CLEAN
