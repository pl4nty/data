local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L2_1, L3_1 = L2_1(L3_1)
if L2_1 and L3_1 ~= nil then
  L0_1 = L3_1.ppid
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1.image_path
  L4_1 = L4_1(L5_1)
  L1_1 = L4_1
  if L0_1 ~= nil then
    L4_1 = IsPidExcluded
    L5_1 = L0_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L5_1 = L1_1
    L4_1 = L1_1.find
    L6_1 = "ltsvc.exe"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = string
    L4_1 = L4_1.lower
    L6_1 = L1_1
    L5_1 = L1_1.match
    L7_1 = "([^\\]+)$"
    L5_1, L6_1, L7_1, L8_1, L9_1 = L5_1(L6_1, L7_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
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
    L6_1 = TrackPidAndTechnique
    L7_1 = L0_1
    L8_1 = "T1071.001"
    L9_1 = "lolbin_web_github"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = IsDetectionThresholdMet
    L7_1 = L0_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
    L6_1 = mp
    L6_1 = L6_1.LOWFI
    return L6_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
