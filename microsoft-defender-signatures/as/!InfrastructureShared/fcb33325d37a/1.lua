local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L0_1 = L1_1.utf8p2
  if L0_1 then
    L1_1 = #L0_1
    if not (L1_1 < 5) then
      goto lbl_17
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_17::
  L1_1 = contains
  L2_1 = L0_1
  L3_1 = {}
  L4_1 = "osdsetuphook"
  L3_1[1] = L4_1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = {}
  L2_1 = 0
  L3_1 = pcall
  L4_1 = mp
  L4_1 = L4_1.GetExecutablesFromCommandLine
  L5_1 = L0_1
  L3_1, L4_1 = L3_1(L4_1, L5_1)
  if L3_1 and L4_1 then
    L5_1 = ipairs
    L6_1 = L4_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = {}
      L10_1.path = L9_1
      L11_1 = mp
      L11_1 = L11_1.ContextualExpandEnvironmentVariables
      L12_1 = L9_1
      L11_1 = L11_1(L12_1)
      L9_1 = L11_1
      if L9_1 then
        L11_1 = mp
        L11_1 = L11_1.IsKnownFriendlyFile
        L12_1 = L9_1
        L13_1 = true
        L14_1 = false
        L11_1 = L11_1(L12_1, L13_1, L14_1)
        L12_1 = bm
        L12_1 = L12_1.add_related_string
        L13_1 = "FriendlyFile"
        L14_1 = L9_1
        L15_1 = bm
        L15_1 = L15_1.RelatedStringBMReport
        L12_1(L13_1, L14_1, L15_1)
        if L11_1 == nil or L11_1 == false then
          L12_1 = 0
          L13_1 = 0
          L14_1 = MpCommon
          L14_1 = L14_1.PathToWin32Path
          L15_1 = L9_1
          L14_1 = L14_1(L15_1)
          if L14_1 then
            L15_1 = string
            L15_1 = L15_1.match
            L16_1 = L14_1
            L17_1 = "^[%a]:\\"
            L15_1 = L15_1(L16_1, L17_1)
            if L15_1 then
              L15_1 = sysio
              L15_1 = L15_1.GetFileSize
              L16_1 = L14_1
              L15_1 = L15_1(L16_1)
              L12_1 = L15_1
              L10_1.size = L12_1
              L15_1 = sysio
              L15_1 = L15_1.IsFileExists
              L16_1 = L14_1
              L15_1 = L15_1(L16_1)
              if L15_1 then
                L15_1 = sysio
                L15_1 = L15_1.GetFileLastWriteTime
                L16_1 = L14_1
                L15_1 = L15_1(L16_1)
                L16_1 = L15_1 / 10000000
                L15_1 = L16_1 - 11644473600
                L16_1 = MpCommon
                L16_1 = L16_1.GetCurrentTimeT
                L16_1 = L16_1()
                L13_1 = L16_1 - L15_1
                L10_1.age = L13_1
                L17_1 = bm
                L17_1 = L17_1.add_related_file
                L18_1 = L14_1
                L17_1(L18_1)
                L17_1 = string
                L17_1 = L17_1.lower
                L18_1 = L14_1
                L17_1 = L17_1(L18_1)
                L18_1 = string
                L18_1 = L18_1.find
                L19_1 = L17_1
                L20_1 = ".exe"
                L21_1 = 1
                L22_1 = true
                L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
                if L18_1 then
                  L18_1 = pcall
                  L19_1 = MpCommon
                  L19_1 = L19_1.RollingQueueQueryKeyRegex
                  L20_1 = "RQ_RecentExecDropped"
                  L21_1 = L17_1
                  L18_1, L19_1 = L18_1(L19_1, L20_1, L21_1)
                  if L18_1 and L19_1 then
                    L20_1 = L19_1.value
                    if L20_1 then
                      L20_1 = {}
                      L21_1 = L19_1
                      L20_1[1] = L21_1
                      L19_1 = L20_1
                    end
                    L20_1 = ipairs
                    L21_1 = L19_1
                    L20_1, L21_1, L22_1 = L20_1(L21_1)
                    for L23_1, L24_1 in L20_1, L21_1, L22_1 do
                      L25_1 = string
                      L25_1 = L25_1.find
                      L26_1 = L24_1.value
                      L27_1 = "UnsignedFile"
                      L28_1 = 1
                      L29_1 = true
                      L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
                      if L25_1 then
                        L25_1 = FiletimeToDaysElapsed
                        L26_1 = L24_1.insert_time
                        L25_1 = L25_1(L26_1)
                        if L25_1 < 2 then
                          L10_1.FileDroppedRecently = true
                          L10_1.FileDropperInfo = L19_1
                          L2_1 = L2_1 + 50
                          L25_1 = string
                          L25_1 = L25_1.match
                          L26_1 = L24_1.value
                          L27_1 = "Process_Img(.*)"
                          L25_1 = L25_1(L26_1, L27_1)
                          if L25_1 then
                            L26_1 = contains
                            L27_1 = L25_1
                            L28_1 = {}
                            L29_1 = "explorer.exe"
                            L30_1 = "WinRAR.exe"
                            L31_1 = "7z.exe"
                            L28_1[1] = L29_1
                            L28_1[2] = L30_1
                            L28_1[3] = L31_1
                            L26_1 = L26_1(L27_1, L28_1)
                            if L26_1 then
                              L2_1 = L2_1 + 50
                            end
                          end
                          L26_1 = string
                          L26_1 = L26_1.find
                          L27_1 = L24_1.value
                          L28_1 = "FileAttributes"
                          L29_1 = 1
                          L30_1 = true
                          L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
                          if L26_1 then
                            L26_1 = string
                            L26_1 = L26_1.match
                            L27_1 = L24_1.value
                            L28_1 = "%[(.*)%]"
                            L26_1 = L26_1(L27_1, L28_1)
                            L27_1 = string
                            L27_1 = L27_1.gmatch
                            L28_1 = L26_1
                            L29_1 = "([^|]+)"
                            L27_1, L28_1, L29_1 = L27_1(L28_1, L29_1)
                            for L30_1 in L27_1, L28_1, L29_1 do
                              L2_1 = L2_1 + 1
                              if L30_1 == "SLF:HighRiskHasMotW" then
                                L2_1 = L2_1 + 100
                              end
                            end
                          end
                          L10_1.score = L2_1
                          break
                        end
                      end
                    end
                  end
                else
                  L18_1 = pcall
                  L19_1 = MpCommon
                  L19_1 = L19_1.RollingQueueQueryKeyRegex
                  L20_1 = "RQ_RecentScriptDropped"
                  L21_1 = L17_1
                  L18_1, L19_1 = L18_1(L19_1, L20_1, L21_1)
                  if L18_1 and L19_1 then
                    L20_1 = L19_1.value
                    if L20_1 then
                      L20_1 = {}
                      L21_1 = L19_1
                      L20_1[1] = L21_1
                      L19_1 = L20_1
                    end
                    L20_1 = ipairs
                    L21_1 = L19_1
                    L20_1, L21_1, L22_1 = L20_1(L21_1)
                    for L23_1, L24_1 in L20_1, L21_1, L22_1 do
                      L25_1 = FiletimeToDaysElapsed
                      L26_1 = L24_1.insert_time
                      L25_1 = L25_1(L26_1)
                      if L25_1 < 2 then
                        L10_1.FileDroppedRecently = true
                        L10_1.FileDropperInfo = L19_1
                        L2_1 = L2_1 + 50
                        L25_1 = string
                        L25_1 = L25_1.match
                        L26_1 = L24_1.value
                        L27_1 = "Process_Img(.*)"
                        L25_1 = L25_1(L26_1, L27_1)
                        if L25_1 then
                          L26_1 = contains
                          L27_1 = L25_1
                          L28_1 = {}
                          L29_1 = "explorer.exe"
                          L30_1 = "WinRAR.exe"
                          L31_1 = "7z.exe"
                          L28_1[1] = L29_1
                          L28_1[2] = L30_1
                          L28_1[3] = L31_1
                          L26_1 = L26_1(L27_1, L28_1)
                          if L26_1 then
                            L2_1 = L2_1 + 50
                          end
                        end
                        L26_1 = string
                        L26_1 = L26_1.find
                        L27_1 = L24_1.value
                        L28_1 = "FileAttributes"
                        L29_1 = 1
                        L30_1 = true
                        L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
                        if L26_1 then
                          L26_1 = string
                          L26_1 = L26_1.match
                          L27_1 = L24_1.value
                          L28_1 = "%[(.*)%]"
                          L26_1 = L26_1(L27_1, L28_1)
                          L27_1 = string
                          L27_1 = L27_1.gmatch
                          L28_1 = L26_1
                          L29_1 = "([^|]+)"
                          L27_1, L28_1, L29_1 = L27_1(L28_1, L29_1)
                          for L30_1 in L27_1, L28_1, L29_1 do
                            L2_1 = L2_1 + 1
                            if L30_1 == "SLF:HighRiskHasMotW" then
                              L2_1 = L2_1 + 100
                            end
                          end
                        end
                        L10_1.score = L2_1
                        break
                      end
                    end
                  end
                end
                L18_1 = table
                L18_1 = L18_1.insert
                L19_1 = L1_1
                L20_1 = L10_1
                L18_1(L19_1, L20_1)
              end
            end
          end
        end
      end
    end
  end
  L5_1 = next
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = safeJsonSerialize
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "UntrustedEntities"
    L8_1 = L5_1
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
    if 0 < L2_1 then
      L6_1 = bm
      L6_1 = L6_1.trigger_sig
      L7_1 = "SetupMode_Block"
      L8_1 = "untrusted_entities"
      L6_1(L7_1, L8_1)
    end
  end
  L5_1 = contains
  L6_1 = L0_1
  L7_1 = {}
  L8_1 = "software\\Microsoft\\"
  L7_1[1] = L8_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = bm
    L5_1 = L5_1.trigger_sig
    L6_1 = "SetupMode_Block"
    L7_1 = "script_in_cmd"
    L5_1(L6_1, L7_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
