local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = this_sigattrlog
L0_1 = L0_1[47]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[47]
  L0_1 = L0_1.utf8p2
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[47]
L1_1 = L1_1.ppid
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = GetRollingQueueKeyValues
L3_1 = "gpo_schtasks"
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = bm
  L8_1 = L8_1.add_related_string
  L9_1 = "RemoteInvocation:GPO"
  L10_1 = L7_1.value
  L11_1 = bm
  L11_1 = L11_1.RelatedStringBMReport
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = MpCommon
  L8_1 = L8_1.BmTriggerSigPropagate
  L9_1 = L1_1
  L10_1 = "RemoteInvocation:GPO"
  L11_1 = L7_1.value
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = MpCommon
  L8_1 = L8_1.AddProcessAttribute
  L9_1 = L1_1
  L10_1 = "RemoteInvocation:GPO"
  L11_1 = L0_1
  L12_1 = true
  L8_1(L9_1, L10_1, L11_1, L12_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
