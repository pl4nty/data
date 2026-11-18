-- Threat: !InfrastructureShared
-- Name: !#LUA:VSTOWithMotw
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_MZ_DLL & HSTR:VSTO_Plugin

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() >= 3 then
  mp.UfsSetMetadataBool("LUA:VSTOWithMotw", true)
  mp.set_mpattribute("BM_VSTO_MOTW")
  return mp.INFECTED
end
return mp.CLEAN
