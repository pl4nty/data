local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
L1_1 = IsTacticObservedForPid
L2_1 = L0_1
L3_1 = "bas_tool_safebreach_process"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = IsTacticObservedForParents
  L2_1 = L0_1
  L3_1 = "bas_tool_safebreach_process"
  L4_1 = 4
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if not L1_1 then
    goto lbl_20
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_20::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
