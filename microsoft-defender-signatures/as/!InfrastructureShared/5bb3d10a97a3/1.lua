local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p1
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = ":\\windows\\system32"
    L2_1 = "%system%\\"
    L3_1 = ":\\windows\\syswow64"
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L0_1
    L6_1 = L1_1
    L7_1 = 2
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L0_1
      L6_1 = L2_1
      L7_1 = 0
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L0_1
        L6_1 = L3_1
        L7_1 = 2
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          goto lbl_52
        end
      end
    end
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    do return L4_1 end
    ::lbl_52::
    L4_1 = bm
    L4_1 = L4_1.add_related_file
    L5_1 = L0_1
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
