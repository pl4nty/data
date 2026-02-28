local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = tostring
L1_1 = headerpage
L0_1 = L0_1(L1_1)
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L0_1 = L0_1 .. L1_1
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "readfile"
L5_1 = "writefile"
L6_1 = "lambda"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
