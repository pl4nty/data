local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p2
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "Uri=([^;]+)"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L0_1
  L4_1 = "DestIp=([^;]*);"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L3_1 = isPublicIP
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      goto lbl_36
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_36::
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
