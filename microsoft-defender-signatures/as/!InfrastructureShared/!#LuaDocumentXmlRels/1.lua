local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
L1_1 = "->word/_rels/document.xml.rels"
L2_1 = #L0_1
L3_1 = #L1_1
if L2_1 > L3_1 then
  L3_1 = L0_1
  L2_1 = L0_1.sub
  L4_1 = #L1_1
  L4_1 = -L4_1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == L1_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
