-- Threat: !InfrastructureShared
-- Name: d77880cf3770
-- Type: 21

if mp.get_mpattribute("BM_MZ_DLL") and mp.get_mpattribute("MpTrustCheck_NotDigitallySigned") then
  return mp.INFECTED
end
return mp.CLEAN
