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
  L2_1 = L1_1.image_path
  if L2_1 ~= nil then
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
    L4_1["monitoringhost.exe"] = true
    L4_1["orchestrator.sandbox.exe"] = true
    L5_1 = L4_1[L3_1]
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = mp
    L5_1 = L5_1.GetParentProcInfo
    L6_1 = L1_1.ppid
    L5_1 = L5_1(L6_1)
    if L5_1 ~= nil then
      L6_1 = L5_1.image_path
      if L6_1 ~= nil then
        L6_1 = L1_1.image_path
        L7_1 = string
        L7_1 = L7_1.lower
        L9_1 = L6_1
        L8_1 = L6_1.match
        L10_1 = "([^\\]+)$"
        L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
        L7_1 = L7_1(L8_1, L9_1, L10_1)
        L8_1 = L4_1[L7_1]
        if L8_1 then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        end
        L8_1 = GetTacticsTableForPid
        L9_1 = L1_1.ppid
        L8_1 = L8_1(L9_1)
        L9_1 = GetTacticsTableForPid
        L10_1 = L5_1.ppid
        L9_1 = L9_1(L10_1)
        L10_1 = L8_1.winrshost_childproc
        if not L10_1 then
          L10_1 = L8_1.wsmprovhost_childproc
          if not L10_1 then
            L10_1 = L8_1.wmi_childproc
            if not L10_1 then
              L10_1 = L8_1.remotedropexe_childproc
              if not L10_1 then
                L10_1 = L8_1.exec_remotedroppedscript_a
                if not L10_1 then
                  L10_1 = L8_1.folderguard_blk
                  if not L10_1 then
                    L10_1 = L8_1.folderguard_folder_blk
                    if not L10_1 then
                      goto lbl_93
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
        ::lbl_93::
        L10_1 = L9_1.winrshost_childproc
        if not L10_1 then
          L10_1 = L9_1.wsmprovhost_childproc
          if not L10_1 then
            L10_1 = L9_1.wmi_childproc
            if not L10_1 then
              L10_1 = L9_1.remotedropexe_childproc
              if not L10_1 then
                L10_1 = L9_1.exec_remotedroppedscript_a
                if not L10_1 then
                  L10_1 = L9_1.folderguard_blk
                  if not L10_1 then
                    L10_1 = L9_1.folderguard_folder_blk
                    if not L10_1 then
                      goto lbl_117
                    end
                  end
                end
              end
            end
          end
        end
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
::lbl_117::
L2_1 = TrackPidAndTechnique
L3_1 = L0_1
L4_1 = "T1003"
L5_1 = "ntdsutil_shadowcopy_access"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.LOWFI
return L2_1
