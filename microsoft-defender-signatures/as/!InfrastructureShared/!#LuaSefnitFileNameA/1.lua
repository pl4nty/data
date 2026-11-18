-- Threat: !InfrastructureShared
-- Name: !#Lua:SefnitFileName.A
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if (l_0_2 == "wnetprof.exe" or l_0_2 == "wnetprofmon.exe") and (string.sub(l_0_1, -8) == "system32" or string.sub(l_0_1, -8) == "syswow64") then
    mp.set_mpattribute("Lua:SefnitFileName.A")
  end
end
return mp.CLEAN
