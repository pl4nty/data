local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = IsPidExcluded
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = {}
  L3_1["ossec-agent.exe"] = true
  L3_1["911 location manager.exe"] = true
  L3_1["pdqinventoryscanner.exe"] = true
  L3_1["exechostserver64.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "uninstallservice.cmd"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = TrackPidAndTechnique
L3_1 = "CMDHSTR"
L4_1 = "T1018"
L5_1 = "remote_system_discovery"
L2_1(L3_1, L4_1, L5_1)
L2_1 = IsDetectionThresholdMet
L3_1 = "CMDHSTR"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = GetTacticsTableForPid
L3_1 = L0_1.ppid
L2_1 = L2_1(L3_1)
L3_1 = L2_1.winrshost_childproc
if not L3_1 then
  L3_1 = L2_1.wsmprovhost_childproc
  if not L3_1 then
    L3_1 = L2_1.wmi_childproc
    if not L3_1 then
      L3_1 = L2_1.remotedropexe_childproc
      if not L3_1 then
        L3_1 = L2_1.python_childproc
        if not L3_1 then
          L3_1 = L2_1.rundll32_childproc
          if not L3_1 then
            L3_1 = L2_1.wscript_childproc
            if not L3_1 then
              L3_1 = L2_1.cscript_childproc
              if not L3_1 then
                L3_1 = L2_1.mshta_childproc
                if not L3_1 then
                  L3_1 = L2_1.webshell_childproc
                  if not L3_1 then
                    L3_1 = L2_1.exec_remotedroppedscript_a
                    if not L3_1 then
                      goto lbl_103
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_103::
L3_1 = mp
L3_1 = L3_1.LOWFI
return L3_1
