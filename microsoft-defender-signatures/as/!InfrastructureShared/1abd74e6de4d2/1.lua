local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.image_path
    L1_1 = L1_1(L2_1)
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = -15
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = L2_1
    L2_1 = L2_1.match
    L4_1 = "\\([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = {}
    L3_1["scriptftp.exe"] = true
    L3_1["sqlagent.exe"] = true
    L3_1["acroinst2.exe"] = true
    L3_1["kagentsilent.exe"] = true
    L3_1["taddmwmi.exe"] = true
    L3_1["madservice.exe"] = true
    L3_1["ccmexec.exe"] = true
    L3_1["gpscript.exe"] = true
    L3_1["mpcmdrun.exe"] = true
    L3_1["mssense.exe"] = true
    L3_1["senseir.exe"] = true
    L4_1 = L3_1[L2_1]
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = GetRealPidForScenario
    L5_1 = "CMDHSTR"
    L4_1 = L4_1(L5_1)
    L5_1 = IsPidExcluded
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = IsDetectionThresholdMet
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = IsTacticObservedForPid
      L6_1 = L4_1
      L7_1 = "remoteservice-target"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        L5_1 = IsTacticObservedForPid
        L6_1 = L4_1
        L7_1 = "wmi_childproc"
        L5_1 = L5_1(L6_1, L7_1)
        if not L5_1 then
          L5_1 = IsTechniqueObservedForPid
          L6_1 = L4_1
          L7_1 = "T1021.006"
          L5_1 = L5_1(L6_1, L7_1)
          if not L5_1 then
            goto lbl_76
          end
        end
      end
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
::lbl_76::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
