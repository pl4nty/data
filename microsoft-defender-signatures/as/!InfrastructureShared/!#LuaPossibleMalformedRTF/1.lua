local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = headerpage
L0_1 = L0_1[1]
if L0_1 == 123 then
  L0_1 = headerpage
  L0_1 = L0_1[2]
  if L0_1 == 92 then
    L0_1 = headerpage
    L0_1 = L0_1[3]
    if L0_1 == 114 then
      L0_1 = headerpage
      L0_1 = L0_1[4]
      if L0_1 == 116 then
        goto lbl_20
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_20::
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "rtfextradata"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "amd64"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "x86"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = "nsis"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L2_1 = L0_1
        L1_1 = L0_1.find
        L3_1 = "pluginsdir"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L2_1 = L0_1
          L1_1 = L0_1.find
          L3_1 = "resources"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L2_1 = L0_1
            L1_1 = L0_1.find
            L3_1 = "ia64"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              L2_1 = L0_1
              L1_1 = L0_1.find
              L3_1 = "winsxs"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if not L1_1 then
                L2_1 = L0_1
                L1_1 = L0_1.find
                L3_1 = "\\os\\"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if not L1_1 then
                  L2_1 = L0_1
                  L1_1 = L0_1.find
                  L3_1 = "\\device\\"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if not L1_1 then
                    L2_1 = L0_1
                    L1_1 = L0_1.find
                    L3_1 = "\\src\\"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if not L1_1 then
                      L2_1 = L0_1
                      L1_1 = L0_1.find
                      L3_1 = "\\extractedfiles\\"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if not L1_1 then
                        L2_1 = L0_1
                        L1_1 = L0_1.find
                        L3_1 = "\\windowsapps\\"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if not L1_1 then
                          L2_1 = L0_1
                          L1_1 = L0_1.find
                          L3_1 = "\\program files\\"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if not L1_1 then
                            L2_1 = L0_1
                            L1_1 = L0_1.find
                            L3_1 = "\\debug\\"
                            L4_1 = 1
                            L5_1 = true
                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                            if not L1_1 then
                              L2_1 = L0_1
                              L1_1 = L0_1.find
                              L3_1 = "\\release\\"
                              L4_1 = 1
                              L5_1 = true
                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                              if not L1_1 then
                                L2_1 = L0_1
                                L1_1 = L0_1.find
                                L3_1 = "\\obj\\"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if not L1_1 then
                                  L2_1 = L0_1
                                  L1_1 = L0_1.find
                                  L3_1 = "\\bin\\"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if not L1_1 then
                                    L2_1 = L0_1
                                    L1_1 = L0_1.find
                                    L3_1 = "\\stubexe\\"
                                    L4_1 = 1
                                    L5_1 = true
                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                    if not L1_1 then
                                      L2_1 = L0_1
                                      L1_1 = L0_1.find
                                      L3_1 = "backup"
                                      L4_1 = 1
                                      L5_1 = true
                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                      if not L1_1 then
                                        L2_1 = L0_1
                                        L1_1 = L0_1.find
                                        L3_1 = "atosc2"
                                        L4_1 = 1
                                        L5_1 = true
                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                        if not L1_1 then
                                          L2_1 = L0_1
                                          L1_1 = L0_1.find
                                          L3_1 = "system32"
                                          L4_1 = 1
                                          L5_1 = true
                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                          if not L1_1 then
                                            L2_1 = L0_1
                                            L1_1 = L0_1.find
                                            L3_1 = "syswow64"
                                            L4_1 = 1
                                            L5_1 = true
                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                            if not L1_1 then
                                              L2_1 = L0_1
                                              L1_1 = L0_1.find
                                              L3_1 = "nservices"
                                              L4_1 = 1
                                              L5_1 = true
                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                              if not L1_1 then
                                                goto lbl_197
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
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_197::
L1_1 = headerpage
L1_1 = L1_1[1]
if L1_1 == 123 then
  L1_1 = headerpage
  L1_1 = L1_1[2]
  if L1_1 == 92 then
    L1_1 = headerpage
    L1_1 = L1_1[3]
    if L1_1 == 114 then
      L1_1 = headerpage
      L1_1 = L1_1[4]
      if L1_1 == 116 then
        L1_1 = headerpage
        L1_1 = L1_1[5]
        if L1_1 ~= 102 then
          L1_1 = mp
          L1_1 = L1_1.INFECTED
          return L1_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
