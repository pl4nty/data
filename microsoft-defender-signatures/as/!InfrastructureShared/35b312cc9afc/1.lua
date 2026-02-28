local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= nil then
      L1_1 = L0_1.command_line
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      L4_1 = L2_1
      L3_1 = L2_1.match
      L5_1 = "%s+[%-/]en?c?o?d?e?d?c?o?m?m?a?n?d?%s+"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L4_1 = bm
      L4_1 = L4_1.get_process_relationships
      L4_1, L5_1 = L4_1()
      L6_1 = ipairs
      L7_1 = L4_1
      L6_1, L7_1, L8_1 = L6_1(L7_1)
      for L9_1, L10_1 in L6_1, L7_1, L8_1 do
        L11_1 = L10_1.cmd_line
        if L11_1 ~= nil then
          L12_1 = string
          L12_1 = L12_1.lower
          L13_1 = L11_1
          L12_1 = L12_1(L13_1)
          L11_1 = L12_1
          L13_1 = L11_1
          L12_1 = L11_1.match
          L14_1 = "\\([^\\]+)$"
          L12_1 = L12_1(L13_1, L14_1)
          L13_1 = {}
          L13_1["ruby.exe"] = true
          L13_1["compattelrunner.exe"] = true
          L13_1["choco.exe"] = true
          L13_1["senseir.exe"] = true
          L13_1["gpscript.exe"] = true
          L13_1["wuauclt.exe"] = true
          L13_1["dismhost.exe"] = true
          L14_1 = L13_1[L12_1]
          if L14_1 then
            L14_1 = mp
            L14_1 = L14_1.CLEAN
            return L14_1
          end
        end
      end
      L6_1 = GetTacticsTableForPid
      L7_1 = L0_1.ppid
      L6_1 = L6_1(L7_1)
      if L6_1 ~= nil then
        L7_1 = type
        L8_1 = L6_1
        L7_1 = L7_1(L8_1)
        if L7_1 == "table" then
          L7_1 = 0
          L8_1 = IsTacticObservedForPid
          L9_1 = L0_1.ppid
          L10_1 = "obfuscation_"
          L8_1 = L8_1(L9_1, L10_1)
          if not L8_1 then
            L8_1 = IsTacticObservedForParents
            L9_1 = L0_1.ppid
            L10_1 = "obfuscation_"
            L11_1 = 2
            L8_1 = L8_1(L9_1, L10_1, L11_1)
            if not L8_1 then
              goto lbl_84
            end
          end
          L7_1 = L7_1 + 1
          ::lbl_84::
          L8_1 = L6_1.winrshost_childproc
          if not L8_1 then
            L8_1 = L6_1.wsmprovhost_childproc
            if not L8_1 then
              L8_1 = L6_1.wmi_childproc
              if not L8_1 then
                L8_1 = L6_1.remotedropexe_childproc
                if not L8_1 then
                  L8_1 = L6_1.python_childproc
                  if not L8_1 then
                    L8_1 = L6_1.rundll32_childproc
                    if not L8_1 then
                      L8_1 = L6_1.wscript_childproc
                      if not L8_1 then
                        L8_1 = L6_1.cscript_childproc
                        if not L8_1 then
                          L8_1 = L6_1.mshta_childproc
                          if not L8_1 then
                            L8_1 = L6_1.webshell_childproc
                            if not L8_1 then
                              L8_1 = L6_1.exec_remotedroppedscript_a
                              if not L8_1 then
                                L8_1 = L6_1.folderguard_blk
                                if not L8_1 then
                                  L8_1 = L6_1.folderguard_folder_blk
                                  if not L8_1 then
                                    goto lbl_124
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
          L7_1 = L7_1 + 1
          ::lbl_124::
          L8_1 = L6_1.amsitampering
          if L8_1 then
            L7_1 = L7_1 + 1
          end
          L8_1 = L6_1.processinjection_target_remoteinitiated_a
          if not L8_1 then
            L8_1 = L6_1.processinjection_target_remoteinitiated_b
            if not L8_1 then
              L8_1 = L6_1.processinjection_target_remoteinitiated_c
              if not L8_1 then
                goto lbl_138
              end
            end
          end
          L7_1 = L7_1 + 1
          ::lbl_138::
          if 2 < L7_1 then
            L8_1 = TrackPidAndTechniqueBM
            L9_1 = L0_1.ppid
            L10_1 = "T1027"
            L11_1 = "tt-remediate"
            L8_1(L9_1, L10_1, L11_1)
            L8_1 = mp
            L8_1 = L8_1.INFECTED
            return L8_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
