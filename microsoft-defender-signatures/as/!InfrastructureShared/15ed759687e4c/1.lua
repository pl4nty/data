local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L2_1, L3_1 = L2_1(L3_1)
if L2_1 and L3_1 ~= nil then
  L0_1 = L3_1.ppid
  L1_1 = L3_1.image_path
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L6_1 = L4_1
  L5_1 = L4_1.match
  L7_1 = "([^\\]+)$"
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = {}
  L6_1["net.exe"] = true
  L6_1["ng bailey image collector.exe"] = true
  L6_1["ltsvc.exe"] = true
  L6_1["explorer.exe"] = true
  L7_1 = L6_1[L5_1]
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
if L0_1 ~= nil and L1_1 ~= nil then
  L4_1 = IsLegacyOrgMachine
  L4_1 = L4_1()
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = IsPidExcluded
  L5_1 = L0_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = TrackPidAndTechnique
  L5_1 = L0_1
  L6_1 = "T1087"
  L7_1 = "account_discovery"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = IsDetectionThresholdMet
  L5_1 = L0_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L4_1 = IsTechniqueObservedForPid
  L5_1 = L0_1
  L6_1 = "T1071"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L4_1 = GetTacticsTableForPid
  L5_1 = L3_1.ppid
  L4_1 = L4_1(L5_1)
  L5_1 = L4_1.winrshost_childproc
  if not L5_1 then
    L5_1 = L4_1.wsmprovhost_childproc
    if not L5_1 then
      L5_1 = L4_1.wmi_childproc
      if not L5_1 then
        L5_1 = L4_1.remotedropexe_childproc
        if not L5_1 then
          L5_1 = L4_1.python_childproc
          if not L5_1 then
            L5_1 = L4_1.mshta_childproc
            if not L5_1 then
              L5_1 = L4_1.webshell_childproc
              if not L5_1 then
                L5_1 = L4_1.exec_remotedroppedscript_a
                if not L5_1 then
                  goto lbl_100
                end
              end
            end
          end
        end
      end
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_100::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
