local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.CLEAN
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    L1_1 = reportGenericRansomware
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p2
    L3_1 = true
    L1_1 = L1_1(L2_1, L3_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.utf8p2
    if L1_1 then
      L1_1 = reportGenericRansomware
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.utf8p2
      L3_1 = true
      L1_1 = L1_1(L2_1, L3_1)
      L0_1 = L1_1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[6]
      L1_1 = L1_1.utf8p2
      if L1_1 then
        L1_1 = reportGenericRansomware
        L2_1 = this_sigattrlog
        L2_1 = L2_1[6]
        L2_1 = L2_1.utf8p2
        L3_1 = true
        L1_1 = L1_1(L2_1, L3_1)
        L0_1 = L1_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
