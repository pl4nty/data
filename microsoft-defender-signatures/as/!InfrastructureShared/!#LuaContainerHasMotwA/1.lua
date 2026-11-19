-- Threat: !InfrastructureShared
-- Name: !#Lua:ContainerHasMotw.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_CONTAINER_FILE & Lua:FileHasMOTW & MpOnOpenOrCloseRtpScan

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) and mp.GetMOTWZone() >= 3 then
  mp.UfsSetMetadataBool("Lua:ContainerHasMotw.A", true)
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 1024 and mp.get_mpattribute("LuaZipWithSingleJS") then
    mp.set_mpattribute("MpForceScanArchives")
  end
  return mp.INFECTED
end
return mp.CLEAN
