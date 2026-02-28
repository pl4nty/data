local L0_1, L1_1, L2_1, L3_1
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
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L0_1 = L1_1.utf8p1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[6]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L0_1 = L1_1.utf8p1
      end
    end
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.match
L3_1 = L0_1
L2_1 = L0_1.lower
L2_1 = L2_1(L3_1)
L3_1 = "\\(mpksl[%w]+)"
L1_1 = L1_1(L2_1, L3_1)
L0_1 = L1_1
L1_1 = getService
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
