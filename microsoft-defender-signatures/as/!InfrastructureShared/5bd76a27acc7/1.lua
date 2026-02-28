local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    L1_1 = GetRealPidForScenario
    L2_1 = "CMDHSTR"
    L1_1 = L1_1(L2_1)
    L2_1 = IsPidExcluded
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = L0_1.image_path
    L3_1 = string
    L3_1 = L3_1.lower
    L5_1 = L2_1
    L4_1 = L2_1.match
    L6_1 = "([^\\]+)$"
    L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1, L6_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    L4_1 = {}
    L4_1["ccmexec.exe"] = true
    L4_1["gpscript.exe"] = true
    L4_1["mpcmdrun.exe"] = true
    L4_1["mssense.exe"] = true
    L4_1["senseir.exe"] = true
    L5_1 = L4_1[L3_1]
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = IsDetectionThresholdMet
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = IsTacticObservedForPid
      L6_1 = L1_1
      L7_1 = "remoteservice-target"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        L5_1 = IsTacticObservedForPid
        L6_1 = L1_1
        L7_1 = "wmi_childproc"
        L5_1 = L5_1(L6_1, L7_1)
        if not L5_1 then
          L5_1 = IsTechniqueObservedForPid
          L6_1 = L1_1
          L7_1 = "T1021.006"
          L5_1 = L5_1(L6_1, L7_1)
          if not L5_1 then
            goto lbl_65
          end
        end
      end
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
::lbl_65::
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
