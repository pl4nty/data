local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.getfilename
    L1_1 = mp
    L1_1 = L1_1.bitor
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_FNAME
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_PATH
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
    L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
    L2_1 = #L1_1
    if not (L2_1 < 8) then
      L2_1 = #L1_1
      if not (22 < L2_1) then
        goto lbl_41
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_41::
    L3_1 = L0_1
    L2_1 = L0_1.find
    L4_1 = "winsxs"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L3_1 = L0_1
      L2_1 = L0_1.find
      L4_1 = "\\os\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L3_1 = L0_1
        L2_1 = L0_1.find
        L4_1 = "\\device\\"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L3_1 = L0_1
          L2_1 = L0_1.find
          L4_1 = "\\src\\"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            L3_1 = L0_1
            L2_1 = L0_1.find
            L4_1 = "amd64"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L3_1 = L0_1
              L2_1 = L0_1.find
              L4_1 = "x86fre"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                L3_1 = L0_1
                L2_1 = L0_1.find
                L4_1 = "ia64fre"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if not L2_1 then
                  L3_1 = L0_1
                  L2_1 = L0_1.find
                  L4_1 = "\\extractedfiles\\"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if not L2_1 then
                    L3_1 = L0_1
                    L2_1 = L0_1.find
                    L4_1 = "\\windowsapps\\"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if not L2_1 then
                      L3_1 = L0_1
                      L2_1 = L0_1.find
                      L4_1 = "\\x86"
                      L5_1 = 1
                      L6_1 = true
                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                      if not L2_1 then
                        L3_1 = L0_1
                        L2_1 = L0_1.find
                        L4_1 = "\\program files\\"
                        L5_1 = 1
                        L6_1 = true
                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                        if not L2_1 then
                          L3_1 = L0_1
                          L2_1 = L0_1.find
                          L4_1 = "\\debug\\"
                          L5_1 = 1
                          L6_1 = true
                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                          if not L2_1 then
                            L3_1 = L0_1
                            L2_1 = L0_1.find
                            L4_1 = "\\release\\"
                            L5_1 = 1
                            L6_1 = true
                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                            if not L2_1 then
                              L3_1 = L0_1
                              L2_1 = L0_1.find
                              L4_1 = "\\obj\\"
                              L5_1 = 1
                              L6_1 = true
                              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                              if not L2_1 then
                                L3_1 = L0_1
                                L2_1 = L0_1.find
                                L4_1 = "\\bin\\"
                                L5_1 = 1
                                L6_1 = true
                                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                if not L2_1 then
                                  L3_1 = L0_1
                                  L2_1 = L0_1.find
                                  L4_1 = "\\stubexe\\"
                                  L5_1 = 1
                                  L6_1 = true
                                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                  if not L2_1 then
                                    L3_1 = L0_1
                                    L2_1 = L0_1.find
                                    L4_1 = "backup"
                                    L5_1 = 1
                                    L6_1 = true
                                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                    if not L2_1 then
                                      L3_1 = L0_1
                                      L2_1 = L0_1.find
                                      L4_1 = "atosc2"
                                      L5_1 = 1
                                      L6_1 = true
                                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                      if not L2_1 then
                                        L3_1 = L0_1
                                        L2_1 = L0_1.find
                                        L4_1 = "system32"
                                        L5_1 = 1
                                        L6_1 = true
                                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                        if not L2_1 then
                                          L3_1 = L0_1
                                          L2_1 = L0_1.find
                                          L4_1 = "syswow64"
                                          L5_1 = 1
                                          L6_1 = true
                                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                          if not L2_1 then
                                            L3_1 = L0_1
                                            L2_1 = L0_1.find
                                            L4_1 = "nservices"
                                            L5_1 = 1
                                            L6_1 = true
                                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                            if not L2_1 then
                                              goto lbl_191
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
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_191::
    L2_1 = {}
    L2_1["wininit.exe"] = true
    L2_1["smss.exe"] = true
    L2_1["explorer.exe"] = true
    L2_1["lsass.exe"] = true
    L2_1["svchost.exe"] = true
    L2_1["conhost.exe"] = true
    L2_1["consent.exe"] = true
    L2_1["csrss.exe"] = true
    L2_1["dllhost.exe"] = true
    L2_1["fontdrvhost.exe"] = true
    L2_1["ie4uinit.exe"] = true
    L2_1["lsaiso.exe"] = true
    L2_1["msdtc.exe"] = true
    L2_1["mshta.exe"] = true
    L2_1["ntoskrnl.exe"] = true
    L2_1["runonce.exe"] = true
    L2_1["runtimebroker.exe"] = true
    L2_1["sdiagnhost.exe"] = true
    L2_1["searchfilterhost.exe"] = true
    L2_1["searchindexer.exe"] = true
    L2_1["searchprotocolhost.exe"] = true
    L2_1["services.exe"] = true
    L2_1["spoolsv.exe"] = true
    L2_1["synchost.exe"] = true
    L2_1["taskmgr.exe"] = true
    L2_1["werfault.exe"] = true
    L2_1["werfaultsecure.exe"] = true
    L2_1["winlogon.exe"] = true
    L2_1["audiodg.exe"] = true
    L2_1["taskhostw.exe"] = true
    L2_1["appvclient.exe"] = true
    L2_1["splwow64.exe"] = true
    L2_1["wmiprvse.exe"] = true
    L2_1["wuauclt.exe"] = true
    L2_1["vssvc.exe"] = true
    L2_1["wsmprovhost.exe"] = true
    L2_1["wmiapsrv.exe"] = true
    L2_1["sppsvc.exe"] = true
    L2_1["fxssvc.exe"] = true
    L3_1 = L2_1[L1_1]
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
