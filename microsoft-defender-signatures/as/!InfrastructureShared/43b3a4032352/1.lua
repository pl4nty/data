local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = GetRealPidForScenario
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = {}
L3_1 = GetRollingQueueKeysAsString
L4_1 = "Tech-"
L5_1 = L1_1
L4_1 = L4_1 .. L5_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = L0_1.ppid
  L5_1 = " tech table missing"
  L3_1 = L4_1 .. L5_1
end
L2_1.TrackedPidTechniques = L3_1
L4_1 = GetRollingQueueKeysAsString
L5_1 = "Tact-"
L6_1 = L1_1
L5_1 = L5_1 .. L6_1
L4_1 = L4_1(L5_1)
if L4_1 == nil then
  L5_1 = L0_1.ppid
  L6_1 = " tact table missing"
  L4_1 = L5_1 .. L6_1
end
L2_1.TrackedPidTactics = L4_1
L5_1 = GetDetectionThresholdMetLinuxReason
L6_1 = L0_1.ppid
L5_1, L6_1 = L5_1(L6_1)
L7_1 = tostring
L8_1 = L5_1
L7_1 = L7_1(L8_1)
L2_1.IsThresholdMet = L7_1
L7_1 = "000"
L8_1 = tostring
L9_1 = L6_1
L8_1 = L8_1(L9_1)
L7_1 = L7_1 .. L8_1
L2_1.ThresholdMetReason = L7_1
L7_1 = safeJsonSerialize
L8_1 = L2_1
L7_1 = L7_1(L8_1)
if L7_1 ~= nil then
  L8_1 = bm
  L8_1 = L8_1.add_related_string
  L9_1 = "TTData"
  L10_1 = L7_1
  L11_1 = bm
  L11_1 = L11_1.RelatedStringBMReport
  L8_1(L9_1, L10_1, L11_1)
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
