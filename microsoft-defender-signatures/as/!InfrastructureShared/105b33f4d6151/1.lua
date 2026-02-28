local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[6]
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
L3_1 = "DestIp=([^;]*);"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L2_1 = isPublicIP
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    goto lbl_29
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_29::
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
