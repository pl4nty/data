local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pcallEx
L1_1 = "BlockC2Connection"
L2_1 = BlockC2Connection
L3_1 = "cobaltstrike_j"
L0_1(L1_1, L2_1, L3_1)
L0_1 = pcallEx
L1_1 = "triggerMemoryScanOnProcessTree"
L2_1 = triggerMemoryScanOnProcessTree
L3_1 = false
L4_1 = true
L5_1 = "SMS_H"
L6_1 = 5000
L7_1 = "Behavior:Win32/CobaltStrike.J!sms"
L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L0_1 = pcallEx
L1_1 = "reportRelatedBmHits"
L2_1 = reportRelatedBmHits
L0_1(L1_1, L2_1)
L0_1 = pcallEx
L1_1 = "addChildrenAsThreat"
L2_1 = addChildrenAsThreat
L0_1(L1_1, L2_1)
L0_1 = reportPcallEx
L0_1()
L0_1 = pcall
L1_1 = reportBmInfo
L0_1, L1_1 = L0_1(L1_1)
if not L0_1 and L1_1 then
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "bmInfoFailReason"
  L4_1 = tostring
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
