-- Threat: !InfrastructureShared
-- Name: 51785c9c7ea5
-- Type: 21

if mp.get_mpattribute("MpTrustCheck_NotDigitallySigned") then
  return mp.INFECTED
end
return mp.CLEAN
