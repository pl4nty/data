local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.GetExecutablesFromCommandLine
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.GetExecutablesFromCommandLine
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.GetExecutablesFromCommandLine
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L2_1 = L2_1.utf8p2
        L1_1 = L1_1(L2_1)
        L0_1 = L1_1
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = ipairs
  L2_1 = L0_1
  L1_1, L2_1, L3_1 = L1_1(L2_1)
  for L4_1, L5_1 in L1_1, L2_1, L3_1 do
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L5_1
    L8_1 = ".json"
    L9_1 = -5
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L5_1
      L8_1 = ".yaml"
      L9_1 = -5
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L5_1
        L8_1 = ".xml"
        L9_1 = -4
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L5_1
          L8_1 = ".jpg"
          L9_1 = -4
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if not L6_1 then
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L5_1
            L8_1 = ".gz"
            L9_1 = -3
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if not L6_1 then
              L6_1 = string
              L6_1 = L6_1.find
              L7_1 = L5_1
              L8_1 = ".pdf"
              L9_1 = -4
              L10_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
              if not L6_1 then
                L6_1 = string
                L6_1 = L6_1.find
                L7_1 = L5_1
                L8_1 = ".mp3"
                L9_1 = -4
                L10_1 = true
                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                if not L6_1 then
                  L6_1 = string
                  L6_1 = L6_1.find
                  L7_1 = L5_1
                  L8_1 = ".doc"
                  L9_1 = -4
                  L10_1 = true
                  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                  if not L6_1 then
                    L6_1 = string
                    L6_1 = L6_1.find
                    L7_1 = L5_1
                    L8_1 = ".docx"
                    L9_1 = -5
                    L10_1 = true
                    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                    if not L6_1 then
                      L6_1 = string
                      L6_1 = L6_1.find
                      L7_1 = L5_1
                      L8_1 = ".py"
                      L9_1 = -3
                      L10_1 = true
                      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                      if not L6_1 then
                        L6_1 = string
                        L6_1 = L6_1.find
                        L7_1 = L5_1
                        L8_1 = ".png"
                        L9_1 = -4
                        L10_1 = true
                        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                        if not L6_1 then
                          L6_1 = string
                          L6_1 = L6_1.find
                          L7_1 = L5_1
                          L8_1 = ".nib"
                          L9_1 = -4
                          L10_1 = true
                          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                          if not L6_1 then
                            L6_1 = string
                            L6_1 = L6_1.find
                            L7_1 = L5_1
                            L8_1 = ".rtf"
                            L9_1 = -4
                            L10_1 = true
                            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                            if not L6_1 then
                              L6_1 = string
                              L6_1 = L6_1.find
                              L7_1 = L5_1
                              L8_1 = ".xls"
                              L9_1 = -4
                              L10_1 = true
                              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                              if not L6_1 then
                                L6_1 = string
                                L6_1 = L6_1.find
                                L7_1 = L5_1
                                L8_1 = ".txt"
                                L9_1 = -4
                                L10_1 = true
                                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                if not L6_1 then
                                  L6_1 = string
                                  L6_1 = L6_1.find
                                  L7_1 = L5_1
                                  L8_1 = ".wmv"
                                  L9_1 = -4
                                  L10_1 = true
                                  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                  if not L6_1 then
                                    L6_1 = string
                                    L6_1 = L6_1.find
                                    L7_1 = L5_1
                                    L8_1 = "/etc/"
                                    L9_1 = 1
                                    L10_1 = true
                                    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                    if not L6_1 then
                                      L6_1 = string
                                      L6_1 = L6_1.find
                                      L7_1 = L5_1
                                      L8_1 = "/tmp/"
                                      L9_1 = 1
                                      L10_1 = true
                                      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                      if not L6_1 then
                                        L6_1 = string
                                        L6_1 = L6_1.find
                                        L7_1 = L5_1
                                        L8_1 = "/var/"
                                        L9_1 = 1
                                        L10_1 = true
                                        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                        if not L6_1 then
                                          L6_1 = string
                                          L6_1 = L6_1.find
                                          L7_1 = L5_1
                                          L8_1 = "/users/"
                                          L9_1 = 1
                                          L10_1 = true
                                          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                          if not L6_1 then
                                            goto lbl_261
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
    L8_1 = "T1222.002"
    L9_1 = "DefenseEvasion_PermissionModification_MacChmodToExec"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    do return L6_1 end
    ::lbl_261::
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
