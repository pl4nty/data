local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= "" then
      goto lbl_19
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L0_1 = L1_1.utf8p2
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = " -x "
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L3_1 = " -u "
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = " -s "
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_58
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1087.001"
L4_1 = "Discovery_Local_Account_dsmemberutil"
L1_1(L2_1, L3_1, L4_1)
goto lbl_99
::lbl_58::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = " -X "
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L3_1 = " -g "
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = " -S "
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_94
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1087.002"
L4_1 = "Discovery_Group_Account_dsmemberutil"
L1_1(L2_1, L3_1, L4_1)
goto lbl_99
::lbl_94::
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1087"
L4_1 = "Discovery_Group_Account_dsmemberutil"
L1_1(L2_1, L3_1, L4_1)
::lbl_99::
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
