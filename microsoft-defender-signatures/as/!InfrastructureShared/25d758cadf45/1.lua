local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 then
  L1_1 = mp
  L1_1 = L1_1.GetProcessCommandLine
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = ""
  end
  if L1_1 == "webcache.exe" then
    goto lbl_18
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_18::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.GetImagePathFromPid
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = ""
end
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "appdata.-temp"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = TrackPidAndTechnique
L3_1 = "CMDHSTR"
L4_1 = "T1574.001"
L5_1 = "evasion_searchhijack_webcache"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
