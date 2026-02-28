local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.matched
      if L0_1 then
        L0_1 = this_sigattrlog
        L0_1 = L0_1[3]
        L0_1 = L0_1.utf8p2
        if L0_1 ~= nil then
          L0_1 = this_sigattrlog
          L0_1 = L0_1[3]
          L0_1 = L0_1.utf8p2
          if L0_1 ~= "" then
            goto lbl_34
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_34::
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.utf8p2
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.utf8p2
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if L2_1 == L3_1 then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
