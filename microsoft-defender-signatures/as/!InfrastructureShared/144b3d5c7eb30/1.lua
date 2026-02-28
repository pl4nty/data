local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.image_path
  L2_1 = L1_1
  L1_1 = L1_1.lower
  L1_1 = L1_1(L2_1)
  L2_1 = L1_1
  L1_1 = L1_1.find
  L3_1 = "mousocoreworker.exe"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1003"
L4_1 = "credapi_wuauclt"
L1_1(L2_1, L3_1, L4_1)
L1_1 = add_parents
L1_1()
L1_1 = reportSessionInformation
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
