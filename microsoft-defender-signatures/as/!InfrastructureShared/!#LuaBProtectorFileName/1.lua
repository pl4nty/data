-- Threat: !InfrastructureShared
-- Name: !#Lua:BProtectorFileName
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "bitguard.exe" or l_0_1 == "bitguard.dll" then
    mp.set_mpattribute("Lua:BProtectorFileName.A")
  elseif l_0_1 == "browserprotect.exe" or l_0_1 == "browserdefender.exe" or l_0_1 == "browsemngr.exe" then
    mp.set_mpattribute("Lua:BProtectorFileName.B")
  end
end
return mp.CLEAN
