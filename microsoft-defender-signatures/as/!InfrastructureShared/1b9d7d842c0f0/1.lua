local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L0_1.image_path
    L4_1 = -11
    L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 ~= "svchost.exe" then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = GetRollingQueueKeyValues
L4_1 = "gpo_schtasks"
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
