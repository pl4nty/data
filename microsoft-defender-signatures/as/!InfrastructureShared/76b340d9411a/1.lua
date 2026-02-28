local L0_1, L1_1, L2_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p1
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.utf8p2
    if L0_1 then
      goto lbl_19
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_19::
L0_1 = string
L0_1 = L0_1.lower
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.utf8p2
L0_1 = L0_1(L1_1)
L1_1 = #L0_1
if 500 <= L1_1 then
  L1_1 = bm
  L1_1 = L1_1.set_detection_string
  L2_1 = L0_1
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
