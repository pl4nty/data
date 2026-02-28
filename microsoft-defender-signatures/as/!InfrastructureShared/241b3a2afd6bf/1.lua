local L0_1, L1_1, L2_1, L3_1, L4_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L1_1 = L2_1.utf8p1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L0_1 = L2_1.utf8p1
      L2_1 = this_sigattrlog
      L2_1 = L2_1[6]
      L1_1 = L2_1.utf8p1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[7]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L0_1 = L2_1.utf8p1
        L2_1 = this_sigattrlog
        L2_1 = L2_1[7]
        L1_1 = L2_1.utf8p1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[8]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[4]
          L0_1 = L2_1.utf8p1
          L2_1 = this_sigattrlog
          L2_1 = L2_1[8]
          L1_1 = L2_1.utf8p1
      end
      else
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    end
  end
end
if not L0_1 or not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.lower
L2_1 = L2_1(L3_1)
L4_1 = L1_1
L3_1 = L1_1.lower
L3_1 = L3_1(L4_1)
if L2_1 ~= L3_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.add_related_file
L3_1 = L0_1
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
