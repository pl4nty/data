-- Threat: !InfrastructureShared
-- Name: !#ALF:RansomAESRSACryptoAlgoInUse.A
-- Type: 13
-- MpAttributes: AESRSAProviderUse & RSAPublicKeyUse & HSTR:CryptoAPI

if mp.get_mpattribute("MpContentDetected") and mp.get_mpattributesubstring("Detection:Ransom:") then
  return mp.INFECTED
end
return mp.CLEAN
