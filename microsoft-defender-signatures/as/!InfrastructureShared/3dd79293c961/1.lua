local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
L1_1 = IsPidExcluded
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = TrackPidAndTechnique
L2_1 = L0_1
L3_1 = "T1490"
L4_1 = "inhibit_backup_restore"
L1_1(L2_1, L3_1, L4_1)
L1_1 = IsDetectionThresholdMet
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = IsTacticObservedForParents
L2_1 = L0_1
L3_1 = "susp_ransomware"
L4_1 = 2
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.image_path
    if L2_1 ~= nil then
      goto lbl_49
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_49::
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
                      L3_1 = L2_1.folderguard_blk
                      if not L3_1 then
                        L3_1 = L2_1.folderguard_folder_blk
                        if not L3_1 then
                          goto lbl_94
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
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_94::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
