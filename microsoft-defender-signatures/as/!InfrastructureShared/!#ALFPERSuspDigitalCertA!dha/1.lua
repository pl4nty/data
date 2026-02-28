local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:SuspiciousDigitalSignatureSize"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil and 65536 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
