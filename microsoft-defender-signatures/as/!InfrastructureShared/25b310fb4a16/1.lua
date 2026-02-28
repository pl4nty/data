local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "fsprocsvc.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = pcall
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L1_1, L2_1 = L1_1(L2_1)
if L1_1 and L2_1 ~= nil then
  L3_1 = L2_1.ppid
  if L3_1 ~= nil then
    L4_1 = IsTechniqueObservedForPid
    L5_1 = L3_1
    L6_1 = "T1036"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = TrackPidAndTechniqueBM
      L5_1 = "BM"
      L6_1 = "T1059"
      L7_1 = "masqamsi"
      L4_1(L5_1, L6_1, L7_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
