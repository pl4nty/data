-- Threat: !InfrastructureShared
-- Name: !#Lua:NanocorFilename.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "run.dat" then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if l_0_2:sub(-36) == "7f5ed85d-6828-4f92-858c-f40b0ac68138" or l_0_2:sub(-4) == "nano" then
      mp.set_mpattribute("Lua:NanocorFilename.A")
    end
  end
end
return mp.CLEAN
