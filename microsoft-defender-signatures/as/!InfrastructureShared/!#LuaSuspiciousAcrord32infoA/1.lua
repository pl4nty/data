-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousAcrord32info.A
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.sub(l_0_1, -28) == "\\start menu\\programs\\startup" and string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)) == "acrord32info.exe" then
    mp.set_mpattribute("Lua:SuspiciousAcrord32infoStartup.A")
    return mp.INFECTED
  end
end
return mp.CLEAN
