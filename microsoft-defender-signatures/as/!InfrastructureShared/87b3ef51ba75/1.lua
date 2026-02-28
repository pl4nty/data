local L0_1, L1_1, L2_1
L0_1 = IsTacticObservedGlobal
L1_1 = "processinjection_source_dridex"
L2_1 = true
L0_1 = L0_1(L1_1, L2_1)
if not L0_1 then
  L0_1 = IsTacticObservedGlobal
  L1_1 = "processinjection_target_dridex"
  L2_1 = true
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
