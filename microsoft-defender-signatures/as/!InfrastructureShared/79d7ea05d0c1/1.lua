local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.GetScannedPPID
  L1_1 = L1_1()
  if not L1_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.GetProcessCommandLine
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = L2_1
  L2_1 = L2_1.lower
  L2_1 = L2_1(L3_1)
  L3_1 = L0_1.image_path
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L0_1.image_path
    L3_1 = L3_1(L4_1)
    L5_1 = L3_1
    L4_1 = L3_1.match
    L6_1 = "([^\\]+)$"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == "explorer.exe" then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
  L3_1 = {}
  L4_1 = "hidden"
  L3_1[1] = L4_1
  L4_1 = contains
  L5_1 = L2_1
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
