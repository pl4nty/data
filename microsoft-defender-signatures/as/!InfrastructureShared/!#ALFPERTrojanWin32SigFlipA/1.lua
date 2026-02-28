local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:MpCertStart"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_mpattributevalue
L2_1 = "RPF:MpSeqCertSz"
L1_1 = L1_1(L2_1)
L2_1 = L0_1 + L1_1
L2_1 = L2_1 + 8
L2_1 = L2_1 + 2
L2_1 = L2_1 + 4
L3_1 = L2_1 % 8
L3_1 = L2_1 - L3_1
L4_1 = "\254\237\250\206\254\237\250\206"
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L3_1
L7_1 = 32
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = true
L6_1(L7_1)
L6_1 = tostring
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L7_1 = L6_1
L6_1 = L6_1.find
L8_1 = L4_1
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
