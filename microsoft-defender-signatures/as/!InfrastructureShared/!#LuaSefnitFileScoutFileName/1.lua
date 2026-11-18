-- Threat: !InfrastructureShared
-- Name: !#Lua:SefnitFileScoutFileName
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "setup_fsu_cid.exe" then
    mp.set_mpattribute("Lua:SefnitFileScoutFileName")
  end
end
return mp.CLEAN
