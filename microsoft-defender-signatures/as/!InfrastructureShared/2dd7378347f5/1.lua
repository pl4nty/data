local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_22
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_22::
L2_1 = TrackPidAndTechnique
L3_1 = L0_1
L4_1 = "T1003"
L5_1 = "shadowcopy_access"
L2_1(L3_1, L4_1, L5_1)
L2_1 = IsDetectionThresholdMet
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = IsDetectionThresholdMet
  L3_1 = L1_1.ppid
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_40
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_40::
L2_1 = GetTacticsTableForPid
L3_1 = L1_1.ppid
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
                      goto lbl_79
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
::lbl_79::
L3_1 = mp
L3_1 = L3_1.LOWFI
return L3_1
