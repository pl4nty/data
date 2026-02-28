local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = "hmdprecisionpulse"
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILEPATH
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L3_1 = string
L3_1 = L3_1.format
L4_1 = "%s\\%s"
L5_1 = L1_1
L6_1 = L2_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = pcall
L5_1 = MpCommon
L5_1 = L5_1.RollingQueueQueryKeyNamespaced
L6_1 = "hmdprecisionpulseregkeyvaluescan"
L7_1 = L0_1
L8_1 = L3_1
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 and L5_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
