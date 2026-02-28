local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if not L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if not L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[4]
      L0_1 = L0_1.matched
      if not L0_1 then
        L0_1 = this_sigattrlog
        L0_1 = L0_1[5]
        L0_1 = L0_1.matched
        if not L0_1 then
          L0_1 = this_sigattrlog
          L0_1 = L0_1[6]
          L0_1 = L0_1.matched
          if not L0_1 then
            L0_1 = this_sigattrlog
            L0_1 = L0_1[7]
            L0_1 = L0_1.matched
            if not L0_1 then
              L0_1 = this_sigattrlog
              L0_1 = L0_1[8]
              L0_1 = L0_1.matched
              if not L0_1 then
                L0_1 = this_sigattrlog
                L0_1 = L0_1[9]
                L0_1 = L0_1.matched
                if not L0_1 then
                  L0_1 = this_sigattrlog
                  L0_1 = L0_1[10]
                  L0_1 = L0_1.matched
                  if not L0_1 then
                    L0_1 = this_sigattrlog
                    L0_1 = L0_1[11]
                    L0_1 = L0_1.matched
                    if not L0_1 then
                      L0_1 = this_sigattrlog
                      L0_1 = L0_1[12]
                      L0_1 = L0_1.matched
                      if not L0_1 then
                        L0_1 = this_sigattrlog
                        L0_1 = L0_1[13]
                        L0_1 = L0_1.matched
                        if not L0_1 then
                          L0_1 = this_sigattrlog
                          L0_1 = L0_1[14]
                          L0_1 = L0_1.matched
                          if not L0_1 then
                            L0_1 = this_sigattrlog
                            L0_1 = L0_1[15]
                            L0_1 = L0_1.matched
                            if not L0_1 then
                              L0_1 = this_sigattrlog
                              L0_1 = L0_1[16]
                              L0_1 = L0_1.matched
                              if not L0_1 then
                                L0_1 = this_sigattrlog
                                L0_1 = L0_1[17]
                                L0_1 = L0_1.matched
                                if not L0_1 then
                                  L0_1 = this_sigattrlog
                                  L0_1 = L0_1[18]
                                  L0_1 = L0_1.matched
                                  if not L0_1 then
                                    L0_1 = this_sigattrlog
                                    L0_1 = L0_1[19]
                                    L0_1 = L0_1.matched
                                    if not L0_1 then
                                      L0_1 = this_sigattrlog
                                      L0_1 = L0_1[20]
                                      L0_1 = L0_1.matched
                                      if not L0_1 then
                                        L0_1 = this_sigattrlog
                                        L0_1 = L0_1[22]
                                        L0_1 = L0_1.matched
                                        if not L0_1 then
                                          L0_1 = this_sigattrlog
                                          L0_1 = L0_1[23]
                                          L0_1 = L0_1.matched
                                          if not L0_1 then
                                            L0_1 = this_sigattrlog
                                            L0_1 = L0_1[24]
                                            L0_1 = L0_1.matched
                                            if not L0_1 then
                                              goto lbl_240
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
    end
  end
end
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.bitand
    L8_1 = L6_1.reason_ex
    L9_1 = 1
    L7_1 = L7_1(L8_1, L9_1)
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = L6_1.image_path
    L8_1 = L8_1(L9_1)
    if L7_1 == 1 then
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L8_1
      L11_1 = "\\sdiagnhost.exe"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if not L9_1 then
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "\\qualysagent.exe"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if not L9_1 then
          L9_1 = string
          L9_1 = L9_1.find
          L10_1 = L8_1
          L11_1 = "\\pulsesecureservice.exe"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if not L9_1 then
            L9_1 = string
            L9_1 = L9_1.find
            L10_1 = L8_1
            L11_1 = "\\javaw.exe"
            L12_1 = 1
            L13_1 = true
            L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
            if not L9_1 then
              L9_1 = string
              L9_1 = L9_1.find
              L10_1 = L8_1
              L11_1 = "\\java.exe"
              L12_1 = 1
              L13_1 = true
              L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
              if not L9_1 then
                L9_1 = string
                L9_1 = L9_1.find
                L10_1 = L8_1
                L11_1 = "\\ruby.exe"
                L12_1 = 1
                L13_1 = true
                L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                if not L9_1 then
                  L9_1 = string
                  L9_1 = L9_1.find
                  L10_1 = L8_1
                  L11_1 = "\\logmein.exe"
                  L12_1 = 1
                  L13_1 = true
                  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                  if not L9_1 then
                    L9_1 = string
                    L9_1 = L9_1.find
                    L10_1 = L8_1
                    L11_1 = "\\fasm.exe"
                    L12_1 = 1
                    L13_1 = true
                    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                    if not L9_1 then
                      L9_1 = string
                      L9_1 = L9_1.find
                      L10_1 = L8_1
                      L11_1 = ":\\windows\\assembly\\"
                      L12_1 = 1
                      L13_1 = true
                      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                      if not L9_1 then
                        L9_1 = string
                        L9_1 = L9_1.find
                        L10_1 = L8_1
                        L11_1 = "\\911 location manager.exe"
                        L12_1 = 1
                        L13_1 = true
                        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                        if not L9_1 then
                          goto lbl_230
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
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
    ::lbl_230::
    L9_1 = TrackPidAndTechniqueBM
    L10_1 = "BM"
    L11_1 = "T1047"
    L12_1 = "windows_management_instrumentation"
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = mp
    L9_1 = L9_1.INFECTED
    return L9_1
  end
end
::lbl_240::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
