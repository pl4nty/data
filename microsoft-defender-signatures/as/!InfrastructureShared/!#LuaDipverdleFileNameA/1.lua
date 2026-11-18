-- Threat: !InfrastructureShared
-- Name: !#Lua:DipverdleFileName.A
-- Type: 8

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "svchost.exe" then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if string.sub(l_0_2, -34) == "\\appdata\\roaming\\microsoft\\windows" or string.sub(l_0_2, -35) == "\\application data\\microsoft\\windows" then
      mp.set_mpattribute("Lua:DipverdleFileName.A")
    end
  end
end
return mp.CLEAN
