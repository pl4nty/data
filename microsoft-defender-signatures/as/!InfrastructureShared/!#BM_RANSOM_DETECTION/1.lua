-- Threat: !InfrastructureShared
-- Name: !#BM_RANSOM_DETECTION
-- Type: 13

if mp.get_mpattribute("MpContentDetected") and mp.get_mpattributesubstring("Detection:Ransom:") then
  return mp.INFECTED
end
return mp.CLEAN
