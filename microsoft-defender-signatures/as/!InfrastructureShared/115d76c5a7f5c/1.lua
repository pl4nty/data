local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = IsBasToolProcessForPpid
L1_1 = "CMDHSTR"
L2_1 = "SafeBreach"
L3_1 = "AccessibilityEscalation"
L0_1 = L0_1(L1_1, L2_1, L3_1)
if not L0_1 then
  L0_1 = IsBasToolProcessFoundInParents
  L1_1 = "CMDHSTR"
  L2_1 = "SafeBreach"
  L3_1 = 3
  L4_1 = "AccessibilityEscalation"
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
  if not L0_1 then
    goto lbl_19
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_19::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
