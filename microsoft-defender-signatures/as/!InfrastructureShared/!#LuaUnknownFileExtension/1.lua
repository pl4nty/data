local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = L0_1
L0_1 = L0_1.lower
L0_1 = L0_1(L1_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "(%.[^.]+)$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = ""
  L1_1 = L2_1 or L1_1
  if not L2_1 then
  end
end
L2_1 = 0
if L1_1 ~= "" then
  L3_1 = mp
  L3_1 = L3_1.GetExtensionClass
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 == L2_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
