local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = string
        L0_1 = L0_1.lower
        L1_1 = this_sigattrlog
        L1_1 = L1_1[1]
        L1_1 = L1_1.utf8p1
        L0_1 = L0_1(L1_1)
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[1]
        L2_1 = L2_1.utf8p2
        L1_1 = L1_1(L2_1)
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[2]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L0_1
        L5_1 = "\\classes\\(.+)\\shell"
        L3_1 = L3_1(L4_1, L5_1)
        if L2_1 ~= L3_1 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
        L4_1 = string
        L4_1 = L4_1.len
        L5_1 = L1_1
        L4_1 = L4_1(L5_1)
        if L4_1 < 4 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L1_1
        L6_1 = "%1"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        else
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L1_1
          L6_1 = "cmd.exe"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L1_1
            L6_1 = "cmd "
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L1_1
              L6_1 = "powershell"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                L4_1 = string
                L4_1 = L4_1.find
                L5_1 = L1_1
                L6_1 = "schtasks"
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if not L4_1 then
                  L4_1 = string
                  L4_1 = L4_1.find
                  L5_1 = L1_1
                  L6_1 = "cscript"
                  L7_1 = 1
                  L8_1 = true
                  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                  if not L4_1 then
                    L4_1 = string
                    L4_1 = L4_1.find
                    L5_1 = L1_1
                    L6_1 = "wscript"
                    L7_1 = 1
                    L8_1 = true
                    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                    if not L4_1 then
                      L4_1 = string
                      L4_1 = L4_1.find
                      L5_1 = L1_1
                      L6_1 = "mshta"
                      L7_1 = 1
                      L8_1 = true
                      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                      if not L4_1 then
                        L4_1 = string
                        L4_1 = L4_1.find
                        L5_1 = L1_1
                        L6_1 = "reg add"
                        L7_1 = 1
                        L8_1 = true
                        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                        if not L4_1 then
                          L4_1 = string
                          L4_1 = L4_1.find
                          L5_1 = L1_1
                          L6_1 = "reg.exe add"
                          L7_1 = 1
                          L8_1 = true
                          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                          if not L4_1 then
                            L4_1 = string
                            L4_1 = L4_1.find
                            L5_1 = L1_1
                            L6_1 = "regedit.exe"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if not L4_1 then
                              L4_1 = string
                              L4_1 = L4_1.find
                              L5_1 = L1_1
                              L6_1 = "bypass"
                              L7_1 = 1
                              L8_1 = true
                              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                              if not L4_1 then
                                L4_1 = string
                                L4_1 = L4_1.find
                                L5_1 = L1_1
                                L6_1 = "\\appdata\\roaming\\"
                                L7_1 = 1
                                L8_1 = true
                                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                                if not L4_1 then
                                  L4_1 = string
                                  L4_1 = L4_1.find
                                  L5_1 = L1_1
                                  L6_1 = "\\appdata\\local\\"
                                  L7_1 = 1
                                  L8_1 = true
                                  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                                  if not L4_1 then
                                    L4_1 = string
                                    L4_1 = L4_1.find
                                    L5_1 = L1_1
                                    L6_1 = "\\users\\public\\"
                                    L7_1 = 1
                                    L8_1 = true
                                    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                                    if not L4_1 then
                                      L4_1 = string
                                      L4_1 = L4_1.find
                                      L5_1 = L1_1
                                      L6_1 = "\\programdata\\"
                                      L7_1 = 1
                                      L8_1 = true
                                      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                                      if not L4_1 then
                                        L4_1 = string
                                        L4_1 = L4_1.find
                                        L5_1 = L1_1
                                        L6_1 = "%.bat$"
                                        L4_1 = L4_1(L5_1, L6_1)
                                        if not L4_1 then
                                          L4_1 = string
                                          L4_1 = L4_1.find
                                          L5_1 = L1_1
                                          L6_1 = "%.cmd$"
                                          L4_1 = L4_1(L5_1, L6_1)
                                          if not L4_1 then
                                            L4_1 = string
                                            L4_1 = L4_1.find
                                            L5_1 = L1_1
                                            L6_1 = "%.js$"
                                            L4_1 = L4_1(L5_1, L6_1)
                                            if not L4_1 then
                                              L4_1 = string
                                              L4_1 = L4_1.find
                                              L5_1 = L1_1
                                              L6_1 = "%.vbs$"
                                              L4_1 = L4_1(L5_1, L6_1)
                                              if not L4_1 then
                                                L4_1 = string
                                                L4_1 = L4_1.find
                                                L5_1 = L1_1
                                                L6_1 = "%.wsf$"
                                                L4_1 = L4_1(L5_1, L6_1)
                                                if not L4_1 then
                                                  goto lbl_249
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
          L4_1 = TrackPidAndTechniqueBM
          L5_1 = "BM"
          L6_1 = "T1548.002"
          L7_1 = "uac_bypass_src"
          L4_1(L5_1, L6_1, L7_1)
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
  end
end
::lbl_249::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
