local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_16
  end
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1070.004"
L3_1 = "DefenseEvasion_IndicatorRemoval_FileDeletion"
L0_1(L1_1, L2_1, L3_1)
::lbl_16::
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1070.003"
L3_1 = "DefenseEvasion_IndicatorRemoval_ClearCmdHistory"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "BM_ClearCmdHistory"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
