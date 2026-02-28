local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = string
      L0_1 = L0_1.lower
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.utf8p2
      L0_1 = L0_1(L1_1)
      L1_1 = 1
      L2_1 = mp
      L2_1 = L2_1.SIGATTR_LOG_SZ
      L3_1 = 1
      for L4_1 = L1_1, L2_1, L3_1 do
        L5_1 = sigattr_head
        L5_1 = L5_1[L4_1]
        L5_1 = L5_1.matched
        if L5_1 then
          L5_1 = sigattr_head
          L5_1 = L5_1[L4_1]
          L5_1 = L5_1.attribute
          if L5_1 == 16400 then
            L5_1 = string
            L5_1 = L5_1.lower
            L6_1 = sigattr_head
            L6_1 = L6_1[L4_1]
            L6_1 = L6_1.utf8p1
            L5_1 = L5_1(L6_1)
            L6_1 = string
            L6_1 = L6_1.match
            L7_1 = L5_1
            L8_1 = "\\([^\\]+)$"
            L6_1 = L6_1(L7_1, L8_1)
            L7_1 = string
            L7_1 = L7_1.find
            L8_1 = L0_1
            L9_1 = L6_1
            L10_1 = 1
            L11_1 = true
            L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
            if L7_1 then
              L7_1 = IsKeyInRollingQueue
              L8_1 = "SuspExeFileDroppedViaSMB"
              L9_1 = L5_1
              L10_1 = true
              L7_1 = L7_1(L8_1, L9_1, L10_1)
              if L7_1 then
                L8_1 = string
                L8_1 = L8_1.find
                L9_1 = L5_1
                L10_1 = "psexesvc"
                L11_1 = 1
                L12_1 = true
                L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                if not L8_1 then
                  L8_1 = string
                  L8_1 = L8_1.find
                  L9_1 = L5_1
                  L10_1 = "winexesvc"
                  L11_1 = 1
                  L12_1 = true
                  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                  if not L8_1 then
                    L8_1 = string
                    L8_1 = L8_1.find
                    L9_1 = L5_1
                    L10_1 = "framepkg"
                    L11_1 = 1
                    L12_1 = true
                    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                    if not L8_1 then
                      L8_1 = string
                      L8_1 = L8_1.find
                      L9_1 = L5_1
                      L10_1 = "paexec"
                      L11_1 = 1
                      L12_1 = true
                      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                      if not L8_1 then
                        L8_1 = string
                        L8_1 = L8_1.find
                        L9_1 = L5_1
                        L10_1 = "pskllsvc"
                        L11_1 = 1
                        L12_1 = true
                        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                        if not L8_1 then
                          L8_1 = string
                          L8_1 = L8_1.find
                          L9_1 = L5_1
                          L10_1 = "eset-remote"
                          L11_1 = 1
                          L12_1 = true
                          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                          if not L8_1 then
                            L8_1 = string
                            L8_1 = L8_1.find
                            L9_1 = L5_1
                            L10_1 = "mbremoteexec"
                            L11_1 = 1
                            L12_1 = true
                            L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                            if not L8_1 then
                              L8_1 = string
                              L8_1 = L8_1.find
                              L9_1 = L5_1
                              L10_1 = "medplsvc"
                              L11_1 = 1
                              L12_1 = true
                              L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                              if not L8_1 then
                                L8_1 = string
                                L8_1 = L8_1.find
                                L9_1 = L5_1
                                L10_1 = "remcomsvc"
                                L11_1 = 1
                                L12_1 = true
                                L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                if not L8_1 then
                                  L8_1 = string
                                  L8_1 = L8_1.find
                                  L9_1 = L5_1
                                  L10_1 = "remsvc"
                                  L11_1 = 1
                                  L12_1 = true
                                  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                  if not L8_1 then
                                    L8_1 = string
                                    L8_1 = L8_1.find
                                    L9_1 = L5_1
                                    L10_1 = "retinalss"
                                    L11_1 = 1
                                    L12_1 = true
                                    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                    if not L8_1 then
                                      L8_1 = string
                                      L8_1 = L8_1.find
                                      L9_1 = L5_1
                                      L10_1 = "tenable_mw_scan_"
                                      L11_1 = 1
                                      L12_1 = true
                                      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                      if not L8_1 then
                                        L8_1 = string
                                        L8_1 = L8_1.find
                                        L9_1 = L5_1
                                        L10_1 = "pdqinventory"
                                        L11_1 = 1
                                        L12_1 = true
                                        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                        if not L8_1 then
                                          L8_1 = string
                                          L8_1 = L8_1.find
                                          L9_1 = L5_1
                                          L10_1 = "pdqdeployrunner"
                                          L11_1 = 1
                                          L12_1 = true
                                          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                          if not L8_1 then
                                            L8_1 = string
                                            L8_1 = L8_1.find
                                            L9_1 = L5_1
                                            L10_1 = "\\veeam"
                                            L11_1 = 1
                                            L12_1 = true
                                            L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                            if not L8_1 then
                                              L8_1 = string
                                              L8_1 = L8_1.find
                                              L9_1 = L5_1
                                              L10_1 = "\\patchagent"
                                              L11_1 = 1
                                              L12_1 = true
                                              L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                              if not L8_1 then
                                                L8_1 = string
                                                L8_1 = L8_1.find
                                                L9_1 = L5_1
                                                L10_1 = "\\qualys"
                                                L11_1 = 1
                                                L12_1 = true
                                                L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                                if not L8_1 then
                                                  L8_1 = string
                                                  L8_1 = L8_1.find
                                                  L9_1 = L5_1
                                                  L10_1 = "\\sdpod"
                                                  L11_1 = 1
                                                  L12_1 = true
                                                  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                                  if not L8_1 then
                                                    L8_1 = string
                                                    L8_1 = L8_1.find
                                                    L9_1 = L5_1
                                                    L10_1 = "\\bfcrx"
                                                    L11_1 = 1
                                                    L12_1 = true
                                                    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                                    if not L8_1 then
                                                      L8_1 = string
                                                      L8_1 = L8_1.find
                                                      L9_1 = L5_1
                                                      L10_1 = "tniservice"
                                                      L11_1 = 1
                                                      L12_1 = true
                                                      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
                                                      if not L8_1 then
                                                        goto lbl_247
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
                L8_1 = mp
                L8_1 = L8_1.CLEAN
                do return L8_1 end
                ::lbl_247::
                L8_1 = mp
                L8_1 = L8_1.ReportLowfi
                L9_1 = L5_1
                L10_1 = 3414579111
                L8_1(L9_1, L10_1)
                L8_1 = bm
                L8_1 = L8_1.add_related_file
                L9_1 = L5_1
                L8_1(L9_1)
                L8_1 = mp
                L8_1 = L8_1.INFECTED
                return L8_1
              end
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
