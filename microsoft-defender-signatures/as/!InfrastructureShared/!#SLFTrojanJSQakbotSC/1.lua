local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.IOAVGetDownloadUrl
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.StringRegExpSearch
L2_1 = "^https?:\\/\\/\\w+.\\w+\\/\\w+\\/\\?\\d+$"
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L0_1
L3_1, L4_1 = L3_1(L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
