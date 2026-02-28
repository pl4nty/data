local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = ""
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 0
L3_1 = L0_1
L2_1 = L0_1.gmatch
L4_1 = "[\194-\244][\128-\191]+"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
for L5_1 in L2_1, L3_1, L4_1 do
  L1_1 = L1_1 + 1
end
if 2 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
