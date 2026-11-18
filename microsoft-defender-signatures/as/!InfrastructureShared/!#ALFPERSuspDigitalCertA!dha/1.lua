-- Threat: !InfrastructureShared
-- Name: !#ALFPER:SuspDigitalCert.A!dha
-- Type: 10
-- MpAttributes: PEPCODE:HasDigitalSignature & Lua:Company_Microsoft & RPF:SuspiciousDigitalSignatureSize

local l_0_0 = mp.get_mpattributevalue("RPF:SuspiciousDigitalSignatureSize")
if l_0_0 ~= nil and 65536 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
