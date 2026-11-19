-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win32/SigFlip.A
-- Type: 10
-- MpAttributes: PEPCODE:HasDigitalSignature & RPF:SuspiciousDigitalSignatureSize & RPF:MpCertStart & RPF:MpSeqCertSz & !pea_is_process

local l_0_0 = mp.get_mpattributevalue("RPF:MpCertStart")
local l_0_1 = mp.get_mpattributevalue("RPF:MpSeqCertSz")
local l_0_2 = l_0_0 + l_0_1 + 8 + 2 + 4
local l_0_3 = l_0_2 - l_0_2 % 8
local l_0_4 = "\254\237\250\206\254\237\250\206"
mp.readprotection(false)
local l_0_5 = mp.readfile(l_0_3, 32)
mp.readprotection(true)
if tostring(l_0_5):find(l_0_4, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
