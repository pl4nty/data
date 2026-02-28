local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L4_1 = {}
L4_1["ccmexec.exe"] = true
L4_1["gpscript.exe"] = true
L4_1["mpcmdrun.exe"] = true
L4_1["mssense.exe"] = true
L4_1["senseir.exe"] = true
L4_1["corsearch.exe"] = true
L5_1 = L4_1[L3_1]
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L1_1.image_path
L5_1 = L5_1(L6_1)
L7_1 = L5_1
L6_1 = L5_1.find
L8_1 = "corsearch.exe"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = TrackPidAndTechnique
L7_1 = L0_1
L8_1 = "T1490"
L9_1 = "shadowcopy_delete"
L6_1(L7_1, L8_1, L9_1)
L6_1 = IsDetectionThresholdMet
L7_1 = L0_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = IsTacticObservedForParents
L7_1 = L0_1
L8_1 = "susp_ransomware"
L9_1 = 2
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = GetTacticsTableForPid
L7_1 = L1_1.ppid
L6_1 = L6_1(L7_1)
L7_1 = L6_1.winrshost_childproc
if not L7_1 then
  L7_1 = L6_1.wsmprovhost_childproc
  if not L7_1 then
    L7_1 = L6_1.remotedropexe_childproc
    if not L7_1 then
      L7_1 = L6_1.python_childproc
      if not L7_1 then
        L7_1 = L6_1.rundll32_childproc
        if not L7_1 then
          L7_1 = L6_1.cscript_childproc
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
                      goto lbl_122
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
::lbl_122::
L7_1 = mp
L7_1 = L7_1.LOWFI
return L7_1
