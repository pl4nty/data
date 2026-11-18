-- Threat: !InfrastructureShared
-- Name: !#LUA:ZipRar7ZWithMotw
-- Type: 13
-- MpAttributes: (BM_ZIP_FILE | BM_RAR_FILE | BM_7Z_FILE) & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() >= 3 then
  mp.UfsSetMetadataBool("LUA:ZipRar7ZWithMotw", true)
  mp.set_mpattribute("//LUA:ZipRar7ZWithMotw.A")
  return mp.INFECTED
end
return mp.CLEAN
