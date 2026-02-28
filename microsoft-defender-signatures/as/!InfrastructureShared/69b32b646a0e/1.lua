local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L0_1 then
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "hkcu\\software\\[^\\]+$"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L2_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L3_1 = L4_1.utf8p2
end
if L2_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = L1_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = #L3_1
    if 10 <= L4_1 then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
