local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = GetRollingQueue
L1_1 = "mace_atosev"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pcallEx
L2_1 = "BlockC2Connection"
L3_1 = BlockC2Connection
L4_1 = "cobaltstrike_h"
L1_1(L2_1, L3_1, L4_1)
L1_1 = pcallEx
L2_1 = "maceSendConfig"
L3_1 = maceSendConfig
L4_1 = "mace_atosev"
L1_1(L2_1, L3_1, L4_1)
L1_1 = pcallEx
L2_1 = "reportRelatedBmHits"
L3_1 = reportRelatedBmHits
L1_1(L2_1, L3_1)
L1_1 = pcallEx
L2_1 = "triggerMemoryScanOnProcessTree"
L3_1 = triggerMemoryScanOnProcessTree
L4_1 = false
L5_1 = true
L6_1 = "SMS_H"
L7_1 = 5000
L8_1 = "Behavior:Win32/CobaltStrike.H!sms"
L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L1_1 = reportPcallEx
L1_1()
L1_1 = pcall
L2_1 = reportBmInfo
L1_1, L2_1 = L1_1(L2_1)
if not L1_1 and L2_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "bmInfoFailReason"
  L5_1 = tostring
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
