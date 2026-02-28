local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ""
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L1_1
L5_1 = -1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == "\"" then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "-destination (\"[^\"]+\")[%s]*"
  L3_1 = L3_1(L4_1, L5_1)
  L2_1 = L3_1
else
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "-destination (%S+)[%s]*"
  L3_1 = L3_1(L4_1, L5_1)
  L2_1 = L3_1
end
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 600
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L2_1
L6_1 = "BitsadminTarget"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.AppendPersistContext
  L5_1 = L2_1
  L6_1 = "BitsadminTarget"
  L7_1 = L3_1
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = IsTechniqueObservedForParents
L5_1 = L0_1
L6_1 = "T1047"
L7_1 = 2
L4_1 = L4_1(L5_1, L6_1, L7_1)
if not L4_1 then
  L4_1 = IsTechniqueObservedForParents
  L5_1 = L0_1
  L6_1 = "T1021.006"
  L7_1 = 2
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if not L4_1 then
    goto lbl_84
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_84::
L4_1 = mp
L4_1 = L4_1.LOWFI
return L4_1
