local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "/maxsize=(%d+)%%"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= nil then
  L5_1 = tonumber
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if 5 <= L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L6_1 = L3_1
L5_1 = L3_1.match
L7_1 = "/maxsize=(%d+)gb"
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1
if L4_1 ~= nil then
  L5_1 = tonumber
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if 2 <= L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L6_1 = L3_1
L5_1 = L3_1.match
L7_1 = "/maxsize=(%d+)mb"
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1
if L4_1 ~= nil then
  L5_1 = tonumber
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if 2000 <= L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.GetParentProcInfo
L5_1 = L5_1()
if L5_1 ~= nil then
  L6_1 = L5_1.ppid
  if L6_1 ~= nil then
    L6_1 = L5_1.image_path
    if L6_1 ~= nil then
      goto lbl_85
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_85::
L6_1 = L5_1.image_path
L7_1 = string
L7_1 = L7_1.lower
L9_1 = L6_1
L8_1 = L6_1.match
L10_1 = "([^\\]+)$"
L8_1, L9_1, L10_1, L11_1, L12_1 = L8_1(L9_1, L10_1)
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
L8_1 = {}
L8_1["ccmexec.exe"] = true
L8_1["gpscript.exe"] = true
L8_1["mpcmdrun.exe"] = true
L8_1["mssense.exe"] = true
L8_1["senseir.exe"] = true
L9_1 = L8_1[L7_1]
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = IsPidExcluded
L10_1 = L0_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = IsPidExcluded
  L10_1 = L5_1.ppid
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    goto lbl_117
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_117::
L9_1 = TrackPidAndTechnique
L10_1 = L0_1
L11_1 = "T1490"
L12_1 = "shadowcopy_delete_resize"
L9_1(L10_1, L11_1, L12_1)
L9_1 = IsTacticObservedForParents
L10_1 = L0_1
L11_1 = "susp_ransomware"
L12_1 = 2
L9_1 = L9_1(L10_1, L11_1, L12_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = GetTacticsTableForPid
L10_1 = L5_1.ppid
L9_1 = L9_1(L10_1)
L10_1 = L9_1.winrshost_childproc
if not L10_1 then
  L10_1 = L9_1.wsmprovhost_childproc
  if not L10_1 then
    L10_1 = L9_1.wmi_childproc
    if not L10_1 then
      L10_1 = L9_1.remotedropexe_childproc
      if not L10_1 then
        L10_1 = L9_1.python_childproc
        if not L10_1 then
          L10_1 = L9_1.rundll32_childproc
          if not L10_1 then
            L10_1 = L9_1.wscript_childproc
            if not L10_1 then
              L10_1 = L9_1.cscript_childproc
              if not L10_1 then
                L10_1 = L9_1.mshta_childproc
                if not L10_1 then
                  L10_1 = L9_1.webshell_childproc
                  if not L10_1 then
                    L10_1 = L9_1.exec_remotedroppedscript_a
                    if not L10_1 then
                      L10_1 = L9_1.folderguard_blk
                      if not L10_1 then
                        L10_1 = L9_1.folderguard_folder_blk
                        if not L10_1 then
                          goto lbl_177
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
L10_1 = mp
L10_1 = L10_1.INFECTED
do return L10_1 end
::lbl_177::
L10_1 = IsDetectionThresholdMet
L11_1 = L5_1.ppid
L10_1 = L10_1(L11_1)
if L10_1 then
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
