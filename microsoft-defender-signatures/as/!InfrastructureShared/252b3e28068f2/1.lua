local L0_1, L1_1, L2_1, L3_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsTechniqueObservedForPid
  L1_1 = "BM"
  L2_1 = "ttexclusion"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = IsTacticObservedForPid
    L1_1 = "BM"
    L2_1 = "ttexclusion"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      L0_1 = IsTacticObservedForPid
      L1_1 = "BM"
      L2_1 = "ttexclusion_cln"
      L0_1 = L0_1(L1_1, L2_1)
      if not L0_1 then
        goto lbl_26
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_26::
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1489"
L3_1 = "ServiceStop"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
