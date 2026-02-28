local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = peattributes
L0_1 = L0_1.hasappendeddata
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = footerpage
L0_1 = L0_1[3988]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = footerpage
L0_1 = L0_1[3989]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = footerpage
L0_1 = L0_1[3990]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = footerpage
L0_1 = L0_1[3991]
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = footerpage
L0_1 = L0_1[3992]
if L0_1 ~= 119 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = footerpage
L0_1 = L0_1[3993]
if L0_1 ~= 102 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = footerpage
L0_1 = L0_1[3994]
if L0_1 ~= 68 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = footerpage
L0_1 = L0_1[3995]
if L0_1 ~= 85 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = footerpage
L3_1 = 3996
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = footerpage
L4_1 = 4096
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
