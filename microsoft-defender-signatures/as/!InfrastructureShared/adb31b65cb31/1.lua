local L0_1, L1_1, L2_1, L3_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L0_1 = L1_1.utf8p1
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = sysio
  L1_1 = L1_1.IsFileExists
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = bm
    L1_1 = L1_1.add_related_file
    L2_1 = L0_1
    L1_1(L2_1)
    L1_1 = mp
    L1_1 = L1_1.ReportLowfi
    L2_1 = L0_1
    L3_1 = 1131483480
    L1_1(L2_1, L3_1)
  end
end
L1_1 = add_parents
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
