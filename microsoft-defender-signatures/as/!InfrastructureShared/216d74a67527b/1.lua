local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
L1_1 = IsPidExcluded
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1.image_path
  L2_1 = L2_1(L3_1)
  L3_1 = #L2_1
  if 54 < L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "microsoft.office.datacenter.torus.powershellworker.exe$"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
L2_1 = sysio
L2_1 = L2_1.GetFileLastWriteTime
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L3_1 = L2_1 / 10000000
L2_1 = L3_1 - 11644473600
L3_1 = MpCommon
L3_1 = L3_1.GetCurrentTimeT
L3_1 = L3_1()
L4_1 = L3_1 - L2_1
if L4_1 < 172800 then
  L4_1 = mp
  L4_1 = L4_1.IsKnownFriendlyFile
  L5_1 = L1_1.image_path
  L6_1 = false
  L7_1 = false
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.GetParentProcInfo
L5_1 = L1_1.ppid
L4_1 = L4_1(L5_1)
L5_1 = sysio
L5_1 = L5_1.GetFileLastWriteTime
L6_1 = L4_1.image_path
L5_1 = L5_1(L6_1)
L6_1 = L5_1 / 10000000
L5_1 = L6_1 - 11644473600
L6_1 = L3_1 - L5_1
if L6_1 < 172800 then
  L6_1 = mp
  L6_1 = L6_1.IsKnownFriendlyFile
  L7_1 = L4_1.image_path
  L8_1 = false
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if not L6_1 then
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
