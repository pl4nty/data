local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
  if not (L2_1 <= 18) then
    goto lbl_21
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_21::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "minidump \"?([%d]+)\"?"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = tonumber
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = mp
L3_1 = L3_1.GetPPidFromPid
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L4_1 = MpCommon
L4_1 = L4_1.GetImagePathFromPid
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L7_1 = L4_1
L6_1 = L4_1.lower
L6_1 = L6_1(L7_1)
L7_1 = "\\windows\\system32\\lsass.exe"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = TrackPidAndTechnique
  L6_1 = "CMDHSTR"
  L7_1 = "T1003.001"
  L8_1 = "credentialdumping_concrete"
  L9_1 = 86400
  L5_1(L6_1, L7_1, L8_1, L9_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
