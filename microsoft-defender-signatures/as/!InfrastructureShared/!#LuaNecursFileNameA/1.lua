-- Threat: !InfrastructureShared
-- Name: !#Lua:NecursFileName.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_2 == "syshost.exe" and string.sub(l_0_1, -1) == "}" then
    mp.set_mpattribute("Lua:NecursFileName.A")
  end
end
return mp.CLEAN
