-- Threat: !InfrastructureShared
-- Name: !#LUA:ArchiveWithMotw
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_CONTAINER_FILE

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  local l_0_0 = mp.GetMOTWZone()
  if l_0_0 and 3 <= l_0_0 then
    mp.set_mpattribute("//LUA:ArchiveWithMotw")
    return mp.INFECTED
  end
end
return mp.CLEAN
