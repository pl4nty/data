-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/ScardCallbackModuleRtp.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_MZ_DLL & HSTR:ScardCallbackContent & MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
mp.set_mpattribute("MpInternal_researchdata=ScardCallbackRtpScanReason=" .. tostring(l_0_0))
return mp.INFECTED
