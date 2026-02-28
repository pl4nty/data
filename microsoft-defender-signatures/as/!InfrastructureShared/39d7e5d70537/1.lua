local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetImagePathFromPid
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "psexesvc.exe"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsKeyInRollingQueue
L4_1 = "file_remote_dropped"
L5_1 = L2_1
L6_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.GetParentProcInfo
  L3_1 = L3_1()
  L4_1 = isnull
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L3_1.image_path
    if not L5_1 then
      L5_1 = ""
    end
    L4_1 = L4_1(L5_1)
    L6_1 = L4_1
    L5_1 = L4_1.match
    L7_1 = "([^\\]+)$"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 == "services.exe" then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
