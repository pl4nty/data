-- Threat: !InfrastructureShared
-- Name: !#Lua:HtaInsideZipWithMotw
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & Lua:HTAExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() >= 3 then
  return mp.INFECTED
end
return mp.CLEAN
