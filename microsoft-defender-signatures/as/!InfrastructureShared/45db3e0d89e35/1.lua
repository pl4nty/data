local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
if 60 < L0_1 then
  L1_1 = {}
  L2_1 = ""
  L3_1 = ""
  L4_1 = 0
  L5_1 = 1
  L6_1 = L0_1
  L7_1 = 1
  for L8_1 = L5_1, L6_1, L7_1 do
    L9_1 = sigattr_tail
    L9_1 = L9_1[L8_1]
    L9_1 = L9_1.attribute
    if L9_1 == 16384 then
      L9_1 = sigattr_tail
      L9_1 = L9_1[L8_1]
      L2_1 = L9_1.utf8p1
      L9_1 = mp
      L9_1 = L9_1.crc32
      L10_1 = 0
      L11_1 = L2_1
      L12_1 = 1
      L13_1 = #L2_1
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      L3_1 = L9_1
      L1_1[L3_1] = 1
      L4_1 = L4_1 + 1
    end
  end
  if 20 < L4_1 then
    L5_1 = ""
    L6_1 = ""
    L7_1 = ""
    L8_1 = ""
    L9_1 = ""
    L10_1 = {}
    L11_1 = ""
    L12_1 = 0
    L13_1 = 0
    L14_1 = ""
    L15_1 = 0
    L16_1 = 0
    L17_1 = 0
    L18_1 = {}
    L19_1 = bm
    L19_1 = L19_1.get_current_process_startup_info
    L19_1 = L19_1()
    L20_1 = L19_1.ppid
    L19_1 = L20_1 or L19_1
    if not L20_1 then
      L19_1 = -1
    end
    L20_1 = "genc_ransom_meta_"
    L21_1 = L19_1
    L20_1 = L20_1 .. L21_1
    L21_1 = "CreateFile"
    L22_1 = ""
    L23_1 = 1800
    L24_1 = 100
    L25_1 = 1
    L26_1 = L0_1
    L27_1 = 1
    for L28_1 = L25_1, L26_1, L27_1 do
      L29_1 = sigattr_tail
      L29_1 = L29_1[L28_1]
      L29_1 = L29_1.attribute
      if L29_1 == 16389 then
        L29_1 = sigattr_tail
        L29_1 = L29_1[L28_1]
        L29_1 = L29_1.utf8p2
        if L29_1 == "ATTR_c09458eb" then
          L29_1 = sigattr_tail
          L29_1 = L29_1[L28_1]
          L29_1 = L29_1.utf8p1
          if L29_1 ~= nil then
            L29_1 = sigattr_tail
            L29_1 = L29_1[L28_1]
            L5_1 = L29_1.utf8p1
            L29_1 = mp
            L29_1 = L29_1.crc32
            L30_1 = 0
            L31_1 = L5_1
            L32_1 = 1
            L33_1 = #L5_1
            L29_1 = L29_1(L30_1, L31_1, L32_1, L33_1)
            L6_1 = L29_1
            L29_1 = L1_1[L6_1]
            if L29_1 == 1 then
              L29_1 = string
              L29_1 = L29_1.match
              L30_1 = L5_1
              L31_1 = "[^\\]+$"
              L29_1 = L29_1(L30_1, L31_1)
              L7_1 = L29_1
              L29_1 = string
              L29_1 = L29_1.match
              L30_1 = L5_1
              L31_1 = "(.*[/\\])"
              L29_1 = L29_1(L30_1, L31_1)
              L8_1 = L29_1
              L29_1 = string
              L29_1 = L29_1.gsub
              L30_1 = L7_1
              L31_1 = "%."
              L32_1 = ""
              L29_1, L30_1 = L29_1(L30_1, L31_1, L32_1)
              L12_1 = L30_1
              _ = L29_1
              if 1 < L12_1 then
                L29_1 = string
                L29_1 = L29_1.match
                L30_1 = L7_1
                L31_1 = "%.[^%.]+$"
                L29_1 = L29_1(L30_1, L31_1)
                L11_1 = L29_1
                L29_1 = mp
                L29_1 = L29_1.GetExtensionClass
                L30_1 = L11_1
                L29_1 = L29_1(L30_1)
                if L29_1 ~= 4 then
                  L29_1 = #L11_1
                  if 4 < L29_1 then
                    L29_1 = sysio
                    L29_1 = L29_1.GetFileSize
                    L30_1 = L5_1
                    L29_1 = L29_1(L30_1)
                    L13_1 = L29_1
                    if L13_1 ~= nil and 256 < L13_1 then
                      L29_1 = sysio
                      L29_1 = L29_1.ReadFile
                      L30_1 = L5_1
                      L31_1 = 0
                      L32_1 = 256
                      L29_1 = L29_1(L30_1, L31_1, L32_1)
                      if L29_1 ~= nil then
                        L30_1 = string
                        L30_1 = L30_1.format
                        L31_1 = "\\x%02X\\x%02X\\x%02X\\x%02X"
                        L32_1 = string
                        L32_1 = L32_1.byte
                        L33_1 = L29_1
                        L34_1 = 1
                        L35_1 = 4
                        L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1 = L32_1(L33_1, L34_1, L35_1)
                        L30_1 = L30_1(L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1)
                        L14_1 = L30_1
                        L30_1 = crypto
                        L30_1 = L30_1.ComputeEntropy
                        L31_1 = L29_1
                        L30_1 = L30_1(L31_1)
                        L15_1 = L30_1
                        if 7 <= L15_1 then
                          L30_1 = mp
                          L30_1 = L30_1.crc32
                          L31_1 = 0
                          L32_1 = L8_1
                          L33_1 = 1
                          L34_1 = #L8_1
                          L30_1 = L30_1(L31_1, L32_1, L33_1, L34_1)
                          L9_1 = L30_1
                          L30_1 = L10_1[L9_1]
                          if L30_1 ~= 1 then
                            L17_1 = L17_1 + 1
                            L10_1[L9_1] = 1
                          end
                          L30_1 = table
                          L30_1 = L30_1.insert
                          L31_1 = L18_1
                          L32_1 = {}
                          L32_1.FileName = L7_1
                          L32_1.FolderPath = L8_1
                          L32_1.FileSize = L13_1
                          L32_1.Magic = L14_1
                          L32_1.Entropy100 = L15_1
                          L30_1(L31_1, L32_1)
                          L16_1 = L16_1 + 1
                          L30_1 = L5_1
                          L31_1 = "|"
                          L32_1 = L8_1
                          L33_1 = "|"
                          L34_1 = L7_1
                          L35_1 = "|"
                          L36_1 = L12_1
                          L37_1 = "|"
                          L38_1 = L11_1
                          L39_1 = "|"
                          L40_1 = L13_1
                          L41_1 = "|"
                          L42_1 = L14_1
                          L43_1 = "|"
                          L44_1 = L15_1
                          L45_1 = "|"
                          L22_1 = L30_1 .. L31_1 .. L32_1 .. L33_1 .. L34_1 .. L35_1 .. L36_1 .. L37_1 .. L38_1 .. L39_1 .. L40_1 .. L41_1 .. L42_1 .. L43_1 .. L44_1 .. L45_1
                          L30_1 = AppendToRollingQueue
                          L31_1 = L20_1
                          L32_1 = L21_1
                          L33_1 = L22_1
                          L34_1 = L23_1
                          L35_1 = L24_1
                          L36_1 = 0
                          L30_1(L31_1, L32_1, L33_1, L34_1, L35_1, L36_1)
                          if 20 < L16_1 and 3 < L17_1 then
                            L30_1 = bm
                            L30_1 = L30_1.add_related_string
                            L31_1 = "GenCRansom_encryptedData"
                            L32_1 = safeJsonSerialize
                            L33_1 = L18_1
                            L32_1 = L32_1(L33_1)
                            L33_1 = bm
                            L33_1 = L33_1.RelatedStringBMReport
                            L30_1(L31_1, L32_1, L33_1)
                            L30_1 = reportTimingData
                            L30_1()
                            L30_1 = mp
                            L30_1 = L30_1.INFECTED
                            return L30_1
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
return L1_1
