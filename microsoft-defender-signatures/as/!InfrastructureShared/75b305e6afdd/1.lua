local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L3_1 = L1_1.command_line
    if L3_1 ~= nil then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "javaw.exe"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = "node.exe"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L5_1 = L3_1
          L4_1 = L3_1.find
          L6_1 = "code.exe"
          L4_1 = L4_1(L5_1, L6_1)
          if not L4_1 then
            L5_1 = L3_1
            L4_1 = L3_1.find
            L6_1 = "chrome.exe"
            L4_1 = L4_1(L5_1, L6_1)
            if not L4_1 then
              L5_1 = L3_1
              L4_1 = L3_1.find
              L6_1 = "discord.exe"
              L4_1 = L4_1(L5_1, L6_1)
              if not L4_1 then
                L5_1 = L3_1
                L4_1 = L3_1.find
                L6_1 = "java.exe"
                L4_1 = L4_1(L5_1, L6_1)
                if not L4_1 then
                  L5_1 = L3_1
                  L4_1 = L3_1.find
                  L6_1 = "msedge.exe"
                  L4_1 = L4_1(L5_1, L6_1)
                  if not L4_1 then
                    L5_1 = L3_1
                    L4_1 = L3_1.find
                    L6_1 = "letsignit app.exe"
                    L4_1 = L4_1(L5_1, L6_1)
                    if not L4_1 then
                      L5_1 = L3_1
                      L4_1 = L3_1.find
                      L6_1 = "springtoolsuite4.exe"
                      L4_1 = L4_1(L5_1, L6_1)
                      if not L4_1 then
                        L5_1 = L3_1
                        L4_1 = L3_1.find
                        L6_1 = "atom.exe"
                        L4_1 = L4_1(L5_1, L6_1)
                        if not L4_1 then
                          L5_1 = L3_1
                          L4_1 = L3_1.find
                          L6_1 = "iisexpress.exe"
                          L4_1 = L4_1(L5_1, L6_1)
                          if not L4_1 then
                            L5_1 = L3_1
                            L4_1 = L3_1.find
                            L6_1 = "gitkraken.exe"
                            L4_1 = L4_1(L5_1, L6_1)
                            if not L4_1 then
                              L5_1 = L3_1
                              L4_1 = L3_1.find
                              L6_1 = "eclipse.exe"
                              L4_1 = L4_1(L5_1, L6_1)
                              if not L4_1 then
                                L5_1 = L3_1
                                L4_1 = L3_1.find
                                L6_1 = "atom.exe"
                                L4_1 = L4_1(L5_1, L6_1)
                                if not L4_1 then
                                  L5_1 = L3_1
                                  L4_1 = L3_1.find
                                  L6_1 = "springtoolsuite4.exe"
                                  L4_1 = L4_1(L5_1, L6_1)
                                  if not L4_1 then
                                    L5_1 = L3_1
                                    L4_1 = L3_1.find
                                    L6_1 = "gitkraken.exe"
                                    L4_1 = L4_1(L5_1, L6_1)
                                    if not L4_1 then
                                      goto lbl_103
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
        end
      end
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    ::lbl_103::
    L4_1 = IsTacticObservedForPid
    L5_1 = L2_1
    L6_1 = "processinjection_target"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = TrackPidAndTechniqueBM
      L5_1 = "BM"
      L6_1 = "T1059"
      L7_1 = "commandscriptinj"
      L4_1(L5_1, L6_1, L7_1)
      L4_1 = bm
      L4_1 = L4_1.get_process_relationships
      L4_1, L5_1 = L4_1()
      L6_1 = nil
      L7_1 = ipairs
      L8_1 = L5_1
      L7_1, L8_1, L9_1 = L7_1(L8_1)
      for L10_1, L11_1 in L7_1, L8_1, L9_1 do
        L12_1 = mp
        L12_1 = L12_1.bitand
        L13_1 = L11_1.reason_ex
        L14_1 = 1
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 == 1 then
          L13_1 = string
          L13_1 = L13_1.find
          L14_1 = string
          L14_1 = L14_1.lower
          L15_1 = L11_1.image_path
          L14_1 = L14_1(L15_1)
          L15_1 = "\\cmd.exe\\"
          L16_1 = 1
          L17_1 = true
          L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
          if not L13_1 then
            L13_1 = string
            L13_1 = L13_1.find
            L14_1 = string
            L14_1 = L14_1.lower
            L15_1 = L11_1.image_path
            L14_1 = L14_1(L15_1)
            L15_1 = "\\powershell.exe\\"
            L16_1 = 1
            L17_1 = true
            L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
            if not L13_1 then
              L13_1 = string
              L13_1 = L13_1.find
              L14_1 = string
              L14_1 = L14_1.lower
              L15_1 = L11_1.image_path
              L14_1 = L14_1(L15_1)
              L15_1 = "\\wscript.exe\\"
              L16_1 = 1
              L17_1 = true
              L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
              if not L13_1 then
                L13_1 = string
                L13_1 = L13_1.find
                L14_1 = string
                L14_1 = L14_1.lower
                L15_1 = L11_1.image_path
                L14_1 = L14_1(L15_1)
                L15_1 = "\\cscript.exe\\"
                L16_1 = 1
                L17_1 = true
                L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
                if not L13_1 then
                  L13_1 = string
                  L13_1 = L13_1.find
                  L14_1 = string
                  L14_1 = L14_1.lower
                  L15_1 = L11_1.image_path
                  L14_1 = L14_1(L15_1)
                  L15_1 = "\\mshta.exe\\"
                  L16_1 = 1
                  L17_1 = true
                  L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
                  if not L13_1 then
                    goto lbl_195
                  end
                end
              end
            end
          end
          L6_1 = L11_1.ppid
          L13_1 = TrackPidAndTechniqueBM
          L14_1 = L6_1
          L15_1 = "T1059"
          L16_1 = "commandscriptinj"
          L13_1(L14_1, L15_1, L16_1)
        end
        ::lbl_195::
      end
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
