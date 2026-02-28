local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 ~= false then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.timestamp
  if L0_1 ~= nil then
    goto lbl_14
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_14::
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 ~= false then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.timestamp
  if L0_1 ~= nil then
    goto lbl_27
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_27::
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.timestamp
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.timestamp
if L0_1 > L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1 - L0_1
if 3000000000 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1548.002"
L6_1 = "uac_bypass_src"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
