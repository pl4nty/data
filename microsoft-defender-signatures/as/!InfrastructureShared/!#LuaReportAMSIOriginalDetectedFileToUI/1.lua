-- Threat: !InfrastructureShared
-- Name: !#LuaReportAMSIOriginalDetectedFileToUI
-- Type: 28

if not mp.get_mpattribute("MpIsOfficeVbaAMSIScan") and not mp.get_mpattribute("MpIsVBScriptAMSIScan") and not mp.get_mpattribute("MpIsJScriptAMSIScan") and not mp.get_mpattribute("MpPowershellHasValidAmsiContentName") and not mp.get_mpattribute("MpIsXl4mAmsiScan") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 and sysio.IsFileExists(l_0_1) and not mp.IsKnownFriendlyFile(l_0_1, false, false) then
  mp.SetAmsiReportPath(l_0_1)
  mp.ReportLowfi(l_0_1, 1649668719)
  return mp.CLEAN
end
return mp.CLEAN
