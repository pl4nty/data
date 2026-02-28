local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\windows\\explorer.exe"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\system32\\svchost.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\syswow64\\svchost.exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\\program files"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "dfsvc.exe"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "chrome.exe"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "teams.exe"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "msedge.exe"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if not L1_1 then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "iexplore.exe"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if not L1_1 then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "openwith.exe"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if not L1_1 then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "\\webnavigatorbrowser\\"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if not L1_1 then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "\\modernwarfare.exe"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if not L1_1 then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "\\league of legends.exe"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if not L1_1 then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "\\wowclassic.exe"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if not L1_1 then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "\\battle.net\\battle.net.exe"
                            L4_1 = 1
                            L5_1 = true
                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                            if not L1_1 then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "\\grand theft auto v\\gta5.exe"
                              L4_1 = 1
                              L5_1 = true
                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                              if not L1_1 then
                                L1_1 = string
                                L1_1 = L1_1.find
                                L2_1 = L0_1
                                L3_1 = "\\acrord32.exe"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if not L1_1 then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = "\\firefox.exe"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if not L1_1 then
                                    L1_1 = string
                                    L1_1 = L1_1.find
                                    L2_1 = L0_1
                                    L3_1 = "git.exe"
                                    L4_1 = 1
                                    L5_1 = true
                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                    if not L1_1 then
                                      goto lbl_181
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
::lbl_181::
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = mp
  L8_1 = L8_1.bitand
  L9_1 = L7_1.reason_ex
  L10_1 = bm
  L10_1 = L10_1.RELATIONSHIP_INJECTION
  L8_1 = L8_1(L9_1, L10_1)
  L9_1 = bm
  L9_1 = L9_1.RELATIONSHIP_INJECTION
  if L8_1 == L9_1 then
    L9_1 = TrackPidAndTechniqueBM
    L10_1 = L7_1.ppid
    L11_1 = "T1055.001"
    L12_1 = "processinjection_target_k"
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = bm
    L9_1 = L9_1.request_SMS
    L10_1 = L7_1.ppid
    L11_1 = "M"
    L9_1(L10_1, L11_1)
    L9_1 = bm
    L9_1 = L9_1.add_action
    L10_1 = "SmsAsyncScanEvent"
    L11_1 = 1000
    L9_1(L10_1, L11_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
