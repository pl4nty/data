local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
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
      L3_1 = "\\microsoft visual studio\\"
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
          L3_1 = "\\adobe\\acrobat"
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
L1_1 = false
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = this_sigattrlog
L6_1 = L6_1[1]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[1]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = this_sigattrlog
    L7_1 = L7_1[1]
    L7_1 = L7_1.utf8p1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
    L6_1 = string
    L6_1 = L6_1.match
    L7_1 = L5_1
    L8_1 = "(.-)([^\\]-)$"
    L6_1, L7_1 = L6_1(L7_1, L8_1)
    L2_1 = L7_1
    _ = L6_1
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[2]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[2]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L7_1 = L7_1.utf8p1
    L6_1 = L6_1(L7_1)
    L7_1 = string
    L7_1 = L7_1.match
    L8_1 = L6_1
    L9_1 = "(.-)([^\\]-)$"
    L7_1, L8_1 = L7_1(L8_1, L9_1)
    L3_1 = L8_1
    _ = L7_1
  end
end
if L2_1 ~= nil and L3_1 ~= nil and L2_1 == L3_1 then
  L1_1 = true
end
L6_1 = this_sigattrlog
L6_1 = L6_1[3]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[3]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = this_sigattrlog
    L7_1 = L7_1[3]
    L7_1 = L7_1.utf8p1
    L6_1 = L6_1(L7_1)
    L7_1 = string
    L7_1 = L7_1.match
    L8_1 = L6_1
    L9_1 = "(.-)([^\\]-)$"
    L7_1, L8_1 = L7_1(L8_1, L9_1)
    L4_1 = L8_1
    _ = L7_1
  end
end
if L2_1 ~= nil and L4_1 ~= nil and L2_1 == L4_1 then
  L1_1 = true
end
if L1_1 == true then
  L6_1 = bm
  L6_1 = L6_1.get_process_relationships
  L6_1, L7_1 = L6_1()
  L8_1 = ipairs
  L9_1 = L7_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = mp
    L13_1 = L13_1.bitand
    L14_1 = L12_1.reason_ex
    L15_1 = bm
    L15_1 = L15_1.RELATIONSHIP_CREATED
    L13_1 = L13_1(L14_1, L15_1)
    L14_1 = bm
    L14_1 = L14_1.RELATIONSHIP_CREATED
    if L13_1 == L14_1 then
      L14_1 = string
      L14_1 = L14_1.lower
      L15_1 = MpCommon
      L15_1 = L15_1.PathToWin32Path
      L16_1 = L12_1.image_path
      L15_1, L16_1, L17_1 = L15_1(L16_1)
      L14_1 = L14_1(L15_1, L16_1, L17_1)
      if L5_1 == L14_1 then
        L14_1 = TrackPidAndTechniqueBM
        L15_1 = L12_1.ppid
        L16_1 = "T1055.002"
        L17_1 = "processinjection_target_s"
        L14_1(L15_1, L16_1, L17_1)
        L14_1 = bm
        L14_1 = L14_1.request_SMS
        L15_1 = L12_1.ppid
        L16_1 = "M"
        L14_1(L15_1, L16_1)
        L14_1 = bm
        L14_1 = L14_1.add_action
        L15_1 = "SmsAsyncScanEvent"
        L16_1 = 1000
        L14_1(L15_1, L16_1)
      end
    end
    L14_1 = mp
    L14_1 = L14_1.bitand
    L15_1 = L12_1.reason_ex
    L16_1 = bm
    L16_1 = L16_1.RELATIONSHIP_INJECTION
    L14_1 = L14_1(L15_1, L16_1)
    L13_1 = L14_1
    L14_1 = bm
    L14_1 = L14_1.RELATIONSHIP_INJECTION
    if L13_1 == L14_1 then
      L14_1 = TrackPidAndTechniqueBM
      L15_1 = L12_1.ppid
      L16_1 = "T1055.002"
      L17_1 = "processinjection_target_s"
      L14_1(L15_1, L16_1, L17_1)
      L14_1 = bm
      L14_1 = L14_1.request_SMS
      L15_1 = L12_1.ppid
      L16_1 = "M"
      L14_1(L15_1, L16_1)
      L14_1 = bm
      L14_1 = L14_1.add_action
      L15_1 = "SmsAsyncScanEvent"
      L16_1 = 1000
      L14_1(L15_1, L16_1)
    end
  end
  L8_1 = TrackPidAndTechniqueBM
  L9_1 = "BM"
  L10_1 = "T1055.002"
  L11_1 = "processinjection_source_s"
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
