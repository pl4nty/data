local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L2_1, L3_1 = L2_1(L3_1)
if L2_1 and L3_1 ~= nil then
  L0_1 = L3_1.ppid
  L1_1 = L3_1.image_path
end
L4_1 = string
L4_1 = L4_1.lower
L6_1 = L1_1
L5_1 = L1_1.match
L7_1 = "([^\\]+)$"
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L5_1 = {}
L5_1["ccmexec.exe"] = true
L5_1["gpscript.exe"] = true
L5_1["mpcmdrun.exe"] = true
L5_1["mssense.exe"] = true
L5_1["senseir.exe"] = true
L6_1 = L5_1[L4_1]
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
if L0_1 ~= nil and L1_1 ~= nil then
  L7_1 = L1_1
  L6_1 = L1_1.find
  L8_1 = "fsprocsvc"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = IsPidExcluded
  L7_1 = L0_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = IsTechniqueObservedForPid
  L7_1 = L0_1
  L8_1 = "T1036"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = TrackPidAndTechnique
    L7_1 = L0_1
    L8_1 = "T1036"
    L9_1 = "child_of_masq"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
