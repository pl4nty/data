local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = bm
  L0_1 = L0_1.get_current_process_startup_info
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= nil then
      L1_1 = GetTacticsTableForPid
      L2_1 = L0_1.ppid
      L1_1 = L1_1(L2_1)
      L2_1 = IsDetectionThresholdMet
      L3_1 = L0_1.ppid
      L2_1 = L2_1(L3_1)
      if not L2_1 then
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
                              goto lbl_69
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
      L2_1 = bm_AddRelatedFileFromCommandLine
      L3_1 = L0_1.command_line
      L4_1 = nil
      L5_1 = nil
      L6_1 = 1
      L2_1(L3_1, L4_1, L5_1, L6_1)
      L2_1 = TrackPidAndTechniqueBM
      L3_1 = L0_1.ppid
      L4_1 = "T1003"
      L5_1 = "tt_remediate"
      L2_1(L3_1, L4_1, L5_1)
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
::lbl_69::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
