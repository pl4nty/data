local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.GetExecutablesFromCommandLine
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.GetExecutablesFromCommandLine
      L2_1 = this_sigattrlog
      L2_1 = L2_1[6]
      L2_1 = L2_1.utf8p1
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
  end
end
if L0_1 ~= nil then
  L1_1 = ipairs
  L2_1 = L0_1
  L1_1, L2_1, L3_1 = L1_1(L2_1)
  for L4_1, L5_1 in L1_1, L2_1, L3_1 do
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L5_1
    L8_1 = "/bash"
    L9_1 = -5
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L5_1
      L8_1 = "/zsh"
      L9_1 = -4
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L5_1
        L8_1 = "/wget"
        L9_1 = -5
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L5_1
          L8_1 = "/curl"
          L9_1 = -5
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if not L6_1 then
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L5_1
            L8_1 = "/sh"
            L9_1 = -3
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if not L6_1 then
              L6_1 = string
              L6_1 = L6_1.find
              L7_1 = L5_1
              L8_1 = "/python"
              L9_1 = -7
              L10_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
              if not L6_1 then
                L6_1 = string
                L6_1 = L6_1.find
                L7_1 = L5_1
                L8_1 = "/ruby"
                L9_1 = -5
                L10_1 = true
                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                if not L6_1 then
                  L6_1 = string
                  L6_1 = L6_1.find
                  L7_1 = L5_1
                  L8_1 = "/dd"
                  L9_1 = -3
                  L10_1 = true
                  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                  if not L6_1 then
                    L6_1 = string
                    L6_1 = L6_1.find
                    L7_1 = L5_1
                    L8_1 = "/xattr"
                    L9_1 = -6
                    L10_1 = true
                    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                    if not L6_1 then
                      L6_1 = string
                      L6_1 = L6_1.find
                      L7_1 = L5_1
                      L8_1 = "/launchctl"
                      L9_1 = -10
                      L10_1 = true
                      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                      if not L6_1 then
                        L6_1 = string
                        L6_1 = L6_1.find
                        L7_1 = L5_1
                        L8_1 = "/launchd"
                        L9_1 = -8
                        L10_1 = true
                        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                        if not L6_1 then
                          L6_1 = string
                          L6_1 = L6_1.find
                          L7_1 = L5_1
                          L8_1 = "/syslogd"
                          L9_1 = -8
                          L10_1 = true
                          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                          if not L6_1 then
                            L6_1 = string
                            L6_1 = L6_1.find
                            L7_1 = L5_1
                            L8_1 = "/sysdiagnose"
                            L9_1 = -11
                            L10_1 = true
                            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                            if not L6_1 then
                              L6_1 = string
                              L6_1 = L6_1.find
                              L7_1 = L5_1
                              L8_1 = "/sandboxd"
                              L9_1 = -9
                              L10_1 = true
                              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                              if not L6_1 then
                                L6_1 = string
                                L6_1 = L6_1.find
                                L7_1 = L5_1
                                L8_1 = "/usbagent"
                                L9_1 = -9
                                L10_1 = true
                                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                if not L6_1 then
                                  L6_1 = string
                                  L6_1 = L6_1.find
                                  L7_1 = L5_1
                                  L8_1 = "/trustd"
                                  L9_1 = -7
                                  L10_1 = true
                                  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                  if not L6_1 then
                                    L6_1 = string
                                    L6_1 = L6_1.find
                                    L7_1 = L5_1
                                    L8_1 = "/xpcproxy"
                                    L9_1 = -9
                                    L10_1 = true
                                    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                    if not L6_1 then
                                      goto lbl_216
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
    end
    L6_1 = sysio
    L6_1 = L6_1.IsFileExists
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = bm
      L6_1 = L6_1.add_related_file
      L7_1 = L5_1
      L6_1(L7_1)
    end
    L6_1 = TrackPidAndTechniqueBM
    L7_1 = "BM"
    L8_1 = "T1036"
    L9_1 = "DefenseEvasion"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    do return L6_1 end
    ::lbl_216::
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
