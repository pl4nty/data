local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = L0_1.image_path
    if L1_1 ~= nil then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = IsPidExcluded
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = TrackPidAndTechnique
L2_1 = L0_1.ppid
L3_1 = "T1021.006"
L4_1 = "lolbin_winrm"
L1_1(L2_1, L3_1, L4_1)
L1_1 = IsDetectionThresholdMet
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = GetTacticsTableForPid
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = L1_1.winrshost_childproc
if not L2_1 then
  L2_1 = L1_1.wsmprovhost_childproc
  if not L2_1 then
    L2_1 = L1_1.wmi_childproc
    if not L2_1 then
      L2_1 = L1_1.remotedropexe_childproc
      if not L2_1 then
        L2_1 = L1_1.python_childproc
        if not L2_1 then
          L2_1 = L1_1.rundll32_childproc
          if not L2_1 then
            L2_1 = L1_1.wscript_childproc
            if not L2_1 then
              L2_1 = L1_1.cscript_childproc
              if not L2_1 then
                L2_1 = L1_1.mshta_childproc
                if not L2_1 then
                  L2_1 = L1_1.webshell_childproc
                  if not L2_1 then
                    L2_1 = L1_1.exec_remotedroppedscript_a
                    if not L2_1 then
                      goto lbl_75
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
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_75::
L2_1 = mp
L2_1 = L2_1.LOWFI
return L2_1
