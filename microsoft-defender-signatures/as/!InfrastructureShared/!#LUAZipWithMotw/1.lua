-- Threat: !InfrastructureShared
-- Name: !#LUA:ZipWithMotw
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_ZIP_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  local l_0_1 = mp.GetMOTWZone()
  if l_0_1 and 3 <= l_0_1 then
    mp.UfsSetMetadataBool("LUA:ZipWithMotw", true)
    return mp.INFECTED
  end
end
return mp.CLEAN
