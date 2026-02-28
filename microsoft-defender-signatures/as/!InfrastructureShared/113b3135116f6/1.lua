local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = sysio
L1_1 = L1_1.RegOpenKey
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = 1
L5_1 = -10
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L2_1 = sysio
  L2_1 = L2_1.GetRegValueAsBinary
  L3_1 = L1_1
  L4_1 = "element"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L3_1 = #L2_1
    if not (1 < L3_1) then
      L3_1 = string
      L3_1 = L3_1.byte
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if L3_1 == 0 then
        goto lbl_53
      end
    end
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
::lbl_53::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
