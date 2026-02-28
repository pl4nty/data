local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = {}
L8_1 = bm
L8_1 = L8_1.get_sig_count
L8_1 = L8_1()
L9_1 = 1
L10_1 = L0_1
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = sigattr_tail
  L13_1 = L13_1[L12_1]
  L13_1 = L13_1.attribute
  if L13_1 == 16384 then
    L14_1 = sigattr_tail
    L14_1 = L14_1[L12_1]
    L14_1 = L14_1.utf8p1
    L15_1 = L14_1
    L14_1 = L14_1.lower
    L14_1 = L14_1(L15_1)
    L16_1 = L14_1
    L15_1 = L14_1.match
    L17_1 = "%.[^%.]+$"
    L15_1 = L15_1(L16_1, L17_1)
    if L15_1 ~= nil then
      L16_1 = L15_1
      L17_1 = "\""
      L15_1 = L16_1 .. L17_1
      L16_1 = mp
      L16_1 = L16_1.GetExtensionClass
      L17_1 = L15_1
      L16_1 = L16_1(L17_1)
      if L16_1 ~= 0 then
        L16_1 = mp
        L16_1 = L16_1.crc32
        L17_1 = 0
        L18_1 = L14_1
        L19_1 = 1
        L20_1 = #L14_1
        L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
        L17_1 = L1_1[L16_1]
        if L17_1 ~= nil then
          L17_1 = table
          L17_1 = L17_1.insert
          L18_1 = L1_1[L16_1]
          L19_1 = L12_1
          L17_1(L18_1, L19_1)
        else
          L17_1 = {}
          L18_1 = L12_1
          L17_1[1] = L18_1
          L1_1[L16_1] = L17_1
        end
        L6_1 = L6_1 + 1
      end
    end
  end
end
if L6_1 < 5 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L6_1 = 0
L9_1 = 1
L10_1 = L0_1
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = sigattr_tail
  L13_1 = L13_1[L12_1]
  L13_1 = L13_1.attribute
  if L13_1 == 16387 then
    L14_1 = sigattr_tail
    L14_1 = L14_1[L12_1]
    L14_1 = L14_1.utf8p1
    L15_1 = L14_1
    L14_1 = L14_1.lower
    L14_1 = L14_1(L15_1)
    L15_1 = mp
    L15_1 = L15_1.crc32
    L16_1 = 0
    L17_1 = L14_1
    L18_1 = 1
    L19_1 = #L14_1
    L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
    L16_1 = L1_1[L15_1]
    if L16_1 == nil then
      L6_1 = L6_1 + 1
      L16_1 = string
      L16_1 = L16_1.find
      L17_1 = L14_1
      L18_1 = "\\[^\\]*$"
      L16_1 = L16_1(L17_1, L18_1)
      if not L16_1 then
        L16_1 = 0
      end
      L17_1 = string
      L17_1 = L17_1.find
      L18_1 = L14_1
      L19_1 = "."
      L20_1 = L16_1
      L21_1 = true
      L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
      if L17_1 ~= nil then
        L18_1 = string
        L18_1 = L18_1.sub
        L19_1 = L14_1
        L20_1 = L16_1 + 1
        L21_1 = L17_1 - 1
        L18_1 = L18_1(L19_1, L20_1, L21_1)
        if L18_1 ~= nil then
          L19_1 = L2_1[L18_1]
          if L19_1 == nil then
            L19_1 = {}
            L20_1 = L15_1
            L21_1 = L12_1
            L19_1[1] = L20_1
            L19_1[2] = L21_1
            L2_1[L18_1] = L19_1
          else
            L19_1 = table
            L19_1 = L19_1.insert
            L20_1 = L2_1[L18_1]
            L21_1 = L12_1
            L19_1(L20_1, L21_1)
          end
        end
      end
    end
  end
end
if L6_1 < 5 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = pairs
L10_1 = L1_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L14_1 = L13_1[1]
  L15_1 = sigattr_tail
  L15_1 = L15_1[L14_1]
  L15_1 = L15_1.utf8p1
  L16_1 = L15_1
  L15_1 = L15_1.lower
  L15_1 = L15_1(L16_1)
  L16_1 = string
  L16_1 = L16_1.find
  L17_1 = L15_1
  L18_1 = "\\[^\\]*$"
  L16_1 = L16_1(L17_1, L18_1)
  if not L16_1 then
    L16_1 = 0
  end
  L17_1 = string
  L17_1 = L17_1.find
  L18_1 = L15_1
  L19_1 = "."
  L20_1 = L16_1
  L21_1 = true
  L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
  if L17_1 ~= nil then
    L18_1 = string
    L18_1 = L18_1.sub
    L19_1 = L15_1
    L20_1 = L16_1 + 1
    L21_1 = -1
    L18_1 = L18_1(L19_1, L20_1, L21_1)
    L19_1 = string
    L19_1 = L19_1.sub
    L20_1 = L15_1
    L21_1 = L16_1 + 1
    L22_1 = L17_1 - 1
    L19_1 = L19_1(L20_1, L21_1, L22_1)
    L20_1 = nil
    if L18_1 ~= nil then
      L22_1 = L18_1
      L21_1 = L18_1.match
      L23_1 = "%.[^%.]+$"
      L21_1 = L21_1(L22_1, L23_1)
      L20_1 = L21_1
    end
    if L19_1 ~= nil and L20_1 ~= nil then
      L21_1 = mp
      L21_1 = L21_1.GetExtensionClass
      L22_1 = L20_1
      L21_1 = L21_1(L22_1)
      if L21_1 ~= 0 then
        L21_1 = L2_1[L19_1]
        if L21_1 ~= nil then
          L21_1 = L2_1[L19_1]
          L21_1 = L21_1[1]
          L22_1 = L2_1[L19_1]
          L22_1 = L22_1[2]
          L23_1 = L1_1[L21_1]
          if L23_1 == nil then
            L23_1 = sigattr_tail
            L23_1 = L23_1[L22_1]
            L23_1 = L23_1.utf8p1
            L24_1 = L23_1
            L23_1 = L23_1.lower
            L23_1 = L23_1(L24_1)
            L5_1[L14_1] = L22_1
            L24_1 = #L23_1
            L25_1 = #L15_1
            if L24_1 > L25_1 then
              L25_1 = L23_1
              L24_1 = L23_1.find
              L26_1 = L15_1
              L27_1 = 1
              L28_1 = true
              L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1)
              if L24_1 == 1 then
                L25_1 = L23_1
                L24_1 = L23_1.byte
                L26_1 = #L15_1
                L26_1 = L26_1 + 1
                L24_1 = L24_1(L25_1, L26_1)
                if L24_1 ~= 58 then
                  L24_1 = string
                  L24_1 = L24_1.sub
                  L25_1 = L23_1
                  L26_1 = #L15_1
                  L26_1 = L26_1 + 1
                  L24_1 = L24_1(L25_1, L26_1)
                  L25_1 = L3_1[L24_1]
                  if L25_1 ~= nil then
                    L25_1 = L4_1[L21_1]
                    if L25_1 == nil then
                      L4_1[L21_1] = 1
                      L25_1 = table
                      L25_1 = L25_1.insert
                      L26_1 = L3_1[L24_1]
                      L27_1 = L22_1
                      L25_1(L26_1, L27_1)
                      L25_1 = table
                      L25_1 = L25_1.insert
                      L26_1 = L3_1[L24_1]
                      L27_1 = L14_1
                      L25_1(L26_1, L27_1)
                      L25_1 = L3_1[L24_1]
                      L25_1 = #L25_1
                      if 10 <= L25_1 then
                        L25_1 = {}
                        L25_1.count = 0
                        L26_1 = pairs
                        L27_1 = L3_1[L24_1]
                        L26_1, L27_1, L28_1 = L26_1(L27_1)
                        for L29_1, L30_1 in L26_1, L27_1, L28_1 do
                          L31_1 = sysio
                          L31_1 = L31_1.ReadFile
                          L32_1 = sigattr_tail
                          L32_1 = L32_1[L30_1]
                          L32_1 = L32_1.utf8p1
                          L33_1 = 0
                          L34_1 = 4
                          L31_1 = L31_1(L32_1, L33_1, L34_1)
                          if L31_1 ~= nil then
                            L32_1 = L25_1[L31_1]
                            if L32_1 == nil then
                              L25_1[L31_1] = 1
                              L32_1 = L25_1.count
                              L32_1 = L32_1 + 1
                              L25_1.count = L32_1
                            end
                          end
                        end
                        L26_1 = bm
                        L26_1 = L26_1.add_related_string
                        L27_1 = "ransom_extension"
                        L28_1 = L24_1
                        L29_1 = bm
                        L29_1 = L29_1.RelatedStringBMReport
                        L26_1(L27_1, L28_1, L29_1)
                        L26_1 = {}
                        L27_1 = {}
                        L28_1 = {}
                        L29_1 = bm
                        L29_1 = L29_1.get_imagepath
                        L29_1 = L29_1()
                        L30_1 = isnull
                        L31_1 = L29_1
                        L30_1 = L30_1(L31_1)
                        if L30_1 then
                          L29_1 = "NA"
                        else
                          L31_1 = L29_1
                          L30_1 = L29_1.lower
                          L30_1 = L30_1(L31_1)
                          L29_1 = L30_1
                        end
                        L30_1 = bm
                        L30_1 = L30_1.get_current_process_startup_info
                        L30_1 = L30_1()
                        if L30_1 ~= nil then
                          L30_1 = L30_1.ppid
                        else
                          L30_1 = -1
                        end
                        L26_1.cur_image_path = L29_1
                        L26_1.proc_info = L30_1
                        L26_1.appended_ext = L24_1
                        L26_1.sig_count = L8_1
                        L26_1.debug_data = L7_1
                        L31_1 = "FileChain_MainSet:"
                        L32_1 = pairs
                        L33_1 = L3_1[L24_1]
                        L32_1, L33_1, L34_1 = L32_1(L33_1)
                        for L35_1, L36_1 in L32_1, L33_1, L34_1 do
                          L37_1 = sigattr_tail
                          L37_1 = L37_1[L36_1]
                          L37_1 = L37_1.utf8p1
                          L38_1 = string
                          L38_1 = L38_1.find
                          L39_1 = L37_1
                          L40_1 = "\\[^\\]*$"
                          L38_1 = L38_1(L39_1, L40_1)
                          if not L38_1 then
                            L38_1 = 0
                          end
                          L39_1 = string
                          L39_1 = L39_1.find
                          L40_1 = L37_1
                          L41_1 = "."
                          L42_1 = L38_1
                          L43_1 = true
                          L39_1 = L39_1(L40_1, L41_1, L42_1, L43_1)
                          if L39_1 ~= nil then
                            L40_1 = string
                            L40_1 = L40_1.sub
                            L41_1 = L37_1
                            L42_1 = L38_1 + 1
                            L43_1 = L39_1 - 1
                            L40_1 = L40_1(L41_1, L42_1, L43_1)
                            L41_1 = L31_1
                            L42_1 = crypto
                            L42_1 = L42_1.CRC32Buffer
                            L43_1 = -1
                            L44_1 = L40_1
                            L45_1 = 0
                            L46_1 = #L40_1
                            L42_1 = L42_1(L43_1, L44_1, L45_1, L46_1)
                            L31_1 = L41_1 .. L42_1
                            L41_1 = L31_1
                            L42_1 = ";"
                            L43_1 = string
                            L43_1 = L43_1.sub
                            L44_1 = L37_1
                            L45_1 = L39_1 + 1
                            L43_1 = L43_1(L44_1, L45_1)
                            L44_1 = ";"
                            L31_1 = L41_1 .. L42_1 .. L43_1 .. L44_1
                          end
                          L40_1 = table
                          L40_1 = L40_1.insert
                          L41_1 = L27_1
                          L42_1 = sigattr_tail
                          L42_1 = L42_1[L36_1]
                          L42_1 = L42_1.utf8p1
                          L40_1(L41_1, L42_1)
                          L40_1 = nil
                          L41_1 = L5_1[L36_1]
                          if L41_1 ~= nil then
                            L41_1 = sigattr_tail
                            L42_1 = L5_1[L36_1]
                            L41_1 = L41_1[L42_1]
                            if L41_1 ~= nil then
                              L41_1 = sigattr_tail
                              L42_1 = L5_1[L36_1]
                              L41_1 = L41_1[L42_1]
                              L41_1 = L41_1.utf8p1
                              L42_1 = L41_1
                              L41_1 = L41_1.lower
                              L41_1 = L41_1(L42_1)
                              L42_1 = sigattr_tail
                              L43_1 = L5_1[L36_1]
                              L42_1 = L42_1[L43_1]
                              L42_1 = L42_1.utf8p2
                              L43_1 = L42_1
                              L42_1 = L42_1.lower
                              L42_1 = L42_1(L43_1)
                              L43_1 = string
                              L43_1 = L43_1.match
                              L44_1 = L42_1
                              L45_1 = "fsize:(%d+)"
                              L43_1 = L43_1(L44_1, L45_1)
                              L40_1 = L43_1
                              if L40_1 == nil then
                                L40_1 = -1
                              end
                              L43_1 = table
                              L43_1 = L43_1.insert
                              L44_1 = L28_1
                              L45_1 = L41_1
                              L43_1(L44_1, L45_1)
                              L43_1 = table
                              L43_1 = L43_1.insert
                              L44_1 = L28_1
                              L45_1 = L40_1
                              L43_1(L44_1, L45_1)
                            end
                            L41_1 = sigattr_tail
                            L41_1 = L41_1[L36_1]
                            if L41_1 ~= nil then
                              L41_1 = sigattr_tail
                              L41_1 = L41_1[L36_1]
                              L41_1 = L41_1.utf8p1
                              L42_1 = L41_1
                              L41_1 = L41_1.lower
                              L41_1 = L41_1(L42_1)
                              L42_1 = sigattr_tail
                              L42_1 = L42_1[L36_1]
                              L42_1 = L42_1.utf8p2
                              L43_1 = L42_1
                              L42_1 = L42_1.lower
                              L42_1 = L42_1(L43_1)
                              L43_1 = string
                              L43_1 = L43_1.match
                              L44_1 = L42_1
                              L45_1 = "fsize:(%d+)"
                              L43_1 = L43_1(L44_1, L45_1)
                              L40_1 = L43_1
                              if L40_1 == nil then
                                L40_1 = -1
                              end
                              L43_1 = table
                              L43_1 = L43_1.insert
                              L44_1 = L28_1
                              L45_1 = L41_1
                              L43_1(L44_1, L45_1)
                              L43_1 = table
                              L43_1 = L43_1.insert
                              L44_1 = L28_1
                              L45_1 = L40_1
                              L43_1(L44_1, L45_1)
                            end
                          end
                        end
                        L26_1.file_list = L27_1
                        L26_1.file_size = L28_1
                        L32_1 = bm
                        L32_1 = L32_1.add_related_string
                        L33_1 = "ransom_files_main"
                        L34_1 = L31_1
                        L35_1 = bm
                        L35_1 = L35_1.RelatedStringBMReport
                        L32_1(L33_1, L34_1, L35_1)
                        L32_1 = safeJsonSerialize
                        L33_1 = L26_1
                        L32_1 = L32_1(L33_1)
                        L33_1 = bm
                        L33_1 = L33_1.add_related_string
                        L34_1 = "gendrv_ransom_meta"
                        L35_1 = L32_1
                        L36_1 = bm
                        L36_1 = L36_1.RelatedStringBMReport
                        L33_1(L34_1, L35_1, L36_1)
                        L33_1 = bm
                        L33_1 = L33_1.add_related_string
                        L34_1 = "sigcount_type4_rv"
                        L35_1 = L8_1
                        L36_1 = bm
                        L36_1 = L36_1.RelatedStringBMReport
                        L33_1(L34_1, L35_1, L36_1)
                        L33_1 = reportSessionInformationInclusive
                        L33_1()
                        L33_1 = pcall
                        L34_1 = reportBmInfo
                        L33_1, L34_1 = L33_1(L34_1)
                        if not L33_1 and L34_1 then
                          L35_1 = bm
                          L35_1 = L35_1.add_related_string
                          L36_1 = "bmInfoFailReason"
                          L37_1 = tostring
                          L38_1 = L34_1
                          L37_1 = L37_1(L38_1)
                          L38_1 = bm
                          L38_1 = L38_1.RelatedStringBMReport
                          L35_1(L36_1, L37_1, L38_1)
                        end
                        L35_1 = mp
                        L35_1 = L35_1.INFECTED
                        return L35_1
                      end
                    end
                  else
                    L25_1 = {}
                    L26_1 = L22_1
                    L27_1 = L14_1
                    L25_1[1] = L26_1
                    L25_1[2] = L27_1
                    L3_1[L24_1] = L25_1
                    L4_1[L21_1] = 1
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
