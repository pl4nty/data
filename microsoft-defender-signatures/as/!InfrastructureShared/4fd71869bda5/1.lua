local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
    L2_1 = L1_1.image_path
    if L2_1 ~= nil then
      goto lbl_25
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_25::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "ltsvc.exe$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = TrackPidAndTechnique
L4_1 = L0_1
L5_1 = "T1490"
L6_1 = "shadowcopy_delete"
L3_1(L4_1, L5_1, L6_1)
L3_1 = IsDetectionThresholdMet
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsDetectionThresholdMet
  L4_1 = L1_1.ppid
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_55
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_55::
L3_1 = GetTacticsTableForPid
L4_1 = L1_1.ppid
L3_1 = L3_1(L4_1)
L4_1 = L3_1.winrshost_childproc
if not L4_1 then
  L4_1 = L3_1.wsmprovhost_childproc
  if not L4_1 then
    L4_1 = L3_1.wmi_childproc
    if not L4_1 then
      L4_1 = L3_1.remotedropexe_childproc
      if not L4_1 then
        L4_1 = L3_1.python_childproc
        if not L4_1 then
          L4_1 = L3_1.rundll32_childproc
          if not L4_1 then
            L4_1 = L3_1.wscript_childproc
            if not L4_1 then
              L4_1 = L3_1.cscript_childproc
              if not L4_1 then
                L4_1 = L3_1.mshta_childproc
                if not L4_1 then
                  L4_1 = L3_1.webshell_childproc
                  if not L4_1 then
                    L4_1 = L3_1.exec_remotedroppedscript_a
                    if not L4_1 then
                      L4_1 = L3_1.folderguard_blk
                      if not L4_1 then
                        L4_1 = L3_1.folderguard_folder_blk
                        if not L4_1 then
                          goto lbl_100
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
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_100::
L4_1 = mp
L4_1 = L4_1.LOWFI
return L4_1
