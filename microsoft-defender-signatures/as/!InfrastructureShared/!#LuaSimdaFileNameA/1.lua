-- Threat: !InfrastructureShared
-- Name: !#Lua:SimdaFileName.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if l_0_1 ~= "flashsec.exe" then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.sub(l_0_2, -23) == "\\application data\\flash" or string.sub(l_0_2, -22) == "\\appdata\\roaming\\flash" then
    mp.set_mpattribute("Lua:SimdaFileName.A")
    return mp.INFECTED
  end
end
return mp.CLEAN
