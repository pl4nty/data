local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.image_path
    if L2_1 ~= nil then
      goto lbl_26
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_26::
L2_1 = L1_1.image_path
L3_1 = string
L3_1 = L3_1.lower
L5_1 = L2_1
L4_1 = L2_1.match
L6_1 = "([^\\]+)$"
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L4_1 = {}
L4_1["ccmexec.exe"] = true
L4_1["gpscript.exe"] = true
L4_1["mpcmdrun.exe"] = true
L4_1["mssense.exe"] = true
L4_1["senseir.exe"] = true
L4_1["corsearch.exe"] = true
L4_1["microsoft.bdd.tasksequencepshost40.exe"] = true
L5_1 = L4_1[L3_1]
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = TrackPidAndTechnique
L6_1 = L0_1
L7_1 = "T1490"
L8_1 = "inhibit_backup_restore"
L5_1(L6_1, L7_1, L8_1)
L5_1 = IsDetectionThresholdMet
L6_1 = L0_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = IsTacticObservedForParents
L6_1 = L0_1
L7_1 = "susp_ransomware"
L8_1 = 2
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.GetParentProcInfo
L5_1 = L5_1()
if L5_1 ~= nil then
  L6_1 = L5_1.ppid
  if L6_1 ~= nil then
    L6_1 = L5_1.image_path
    if L6_1 ~= nil then
      goto lbl_84
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_84::
L6_1 = GetTacticsTableForPid
L7_1 = L5_1.ppid
L6_1 = L6_1(L7_1)
L7_1 = L6_1.winrshost_childproc
if not L7_1 then
  L7_1 = L6_1.wsmprovhost_childproc
  if not L7_1 then
    L7_1 = L6_1.wmi_childproc
    if not L7_1 then
      L7_1 = L6_1.remotedropexe_childproc
      if not L7_1 then
        L7_1 = L6_1.python_childproc
        if not L7_1 then
          L7_1 = L6_1.rundll32_childproc
          if not L7_1 then
            L7_1 = L6_1.mshta_childproc
            if not L7_1 then
              L7_1 = L6_1.webshell_childproc
              if not L7_1 then
                L7_1 = L6_1.exec_remotedroppedscript_a
                if not L7_1 then
                  L7_1 = L6_1.folderguard_blk
                  if not L7_1 then
                    L7_1 = L6_1.folderguard_folder_blk
                    if not L7_1 then
                      goto lbl_123
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
L7_1 = mp
L7_1 = L7_1.INFECTED
do return L7_1 end
::lbl_123::
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
