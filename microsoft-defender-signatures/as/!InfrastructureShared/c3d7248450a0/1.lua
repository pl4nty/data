local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = #L1_1
  if not (L2_1 <= 10) then
    goto lbl_21
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_21::
L2_1 = "\\\\\\\\.*\\\\(?:netlogon|share$)\\\\\\w{3,}.(?:exe|dll)(?:[,\\w]+)?\\s+-u\\s+\\w+\\:\\w+"
L3_1 = false
L4_1 = MpCommon
L4_1 = L4_1.StringRegExpSearch
L5_1 = L2_1
L6_1 = L1_1
L4_1, L5_1 = L4_1(L5_1, L6_1)
_ = L5_1
L3_1 = L4_1
if L3_1 then
  L4_1 = mp
  L4_1 = L4_1.LOWFI
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
