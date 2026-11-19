-- Threat: !InfrastructureShared
-- Name: !#Lua:InstallBrainDownloadFileName
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if string.sub(l_0_1, -7) == ".decrpt" then
    mp.set_mpattribute("Lua:InstallBrainDownloadFileName")
  end
end
return mp.CLEAN
