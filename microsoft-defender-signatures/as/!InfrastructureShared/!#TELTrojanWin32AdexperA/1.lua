local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 762210679 then
  L0_1 = mp
  L0_1 = L0_1.readu_u32
  L1_1 = headerpage
  L2_1 = 5
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == 1865245793 then
    L0_1 = mp
    L0_1 = L0_1.readu_u16
    L1_1 = headerpage
    L2_1 = 8
    L0_1 = L0_1(L1_1, L2_1)
    if L0_1 == 25199 then
      L0_1 = mp
      L0_1 = L0_1.set_mpattribute
      L1_1 = "BM_ADEXPER_A"
      L0_1(L1_1)
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
