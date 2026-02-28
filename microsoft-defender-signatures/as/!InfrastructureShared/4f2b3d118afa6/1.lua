local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = this_sigattrlog
L2_1 = L2_1[26]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[26]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[26]
    L2_1 = L2_1.ppid
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[26]
      L1_1 = L2_1.ppid
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[26]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
    end
  end
end
if L0_1 and L1_1 then
  L2_1 = GetTacticsTableForPid
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = L2_1.winrshost_childproc
  if not L3_1 then
    L3_1 = L2_1.amsitampering
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
                              goto lbl_90
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
  end
  L3_1 = bm_AddRelatedFileFromCommandLine
  L4_1 = L0_1
  L5_1 = nil
  L6_1 = nil
  L7_1 = 1
  L3_1(L4_1, L5_1, L6_1, L7_1)
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = this_sigattrlog
  L4_1 = L4_1[26]
  L4_1 = L4_1.ppid
  L5_1 = "T1546.013"
  L6_1 = "posh_profile_create"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_90::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
