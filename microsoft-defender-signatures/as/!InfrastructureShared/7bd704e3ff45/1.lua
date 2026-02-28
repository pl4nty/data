local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L2_1 = GetRealPidForScenario
L3_1 = "CMDHSTR"
L2_1 = L2_1(L3_1)
L3_1 = TrackPidAndTechnique
L4_1 = L2_1
L5_1 = "T1003"
L6_1 = "ntdsutil_shadowcopy_access"
L3_1(L4_1, L5_1, L6_1)
L3_1 = {}
L4_1 = "\\perflogs\\"
L5_1 = "\\public\\"
L6_1 = "c:\\temp"
L7_1 = "\\windows\\temp\\"
L8_1 = "\\music\\"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L4_1 = contains
L5_1 = L1_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.LOWFI
return L4_1
