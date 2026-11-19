-- Threat: !InfrastructureShared
-- Name: !#Lua:HtaFileWithMotw
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & Lua:HTAExt & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() >= 3 then
  return mp.INFECTED
end
return mp.CLEAN
