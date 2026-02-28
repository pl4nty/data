local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "PACKED_WITH:[CMDEmbedded]"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = 0
L1_1 = mp
L1_1 = L1_1.GetNormalizedScript
L2_1 = true
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "[%'\"]%)?%+%(?[%'\"]"
L5_1 = ""
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
L0_1 = L3_1
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "\"([%l%d]+)\""
L5_1 = "%1"
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
if L0_1 < 2 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.vfo_add_buffer
L3_1 = L1_1
L4_1 = "[StrConcat]"
L5_1 = mp
L5_1 = L5_1.ADD_VFO_TAKE_ACTION_ON_DAD
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
