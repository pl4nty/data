local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = {}
L7_1 = {}
L8_1 = 0
L9_1 = {}
L10_1 = bm
L10_1 = L10_1.get_sig_count
L10_1 = L10_1()
L11_1 = 1
L12_1 = L0_1
L13_1 = 1
for L14_1 = L11_1, L12_1, L13_1 do
  L15_1 = sigattr_tail
  L15_1 = L15_1[L14_1]
  L15_1 = L15_1.attribute
  if L15_1 == 16384 then
    L16_1 = sigattr_tail
    L16_1 = L16_1[L14_1]
    L16_1 = L16_1.utf8p1
    L17_1 = L16_1
    L16_1 = L16_1.lower
    L16_1 = L16_1(L17_1)
    L18_1 = L16_1
    L17_1 = L16_1.match
    L19_1 = "%.[^%.]+$"
    L17_1 = L17_1(L18_1, L19_1)
    if L17_1 ~= nil then
      L18_1 = mp
      L18_1 = L18_1.GetExtensionClass
      L19_1 = L17_1
      L18_1 = L18_1(L19_1)
      if L18_1 == 4 then
        L18_1 = isKnownRansomExtension
        L19_1 = L17_1
        L18_1 = L18_1(L19_1)
        if not L18_1 then
          goto lbl_66
        end
      end
      L18_1 = mp
      L18_1 = L18_1.crc32
      L19_1 = 0
      L20_1 = L16_1
      L21_1 = 1
      L22_1 = #L16_1
      L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
      L19_1 = L1_1[L18_1]
      if L19_1 ~= nil then
        L19_1 = table
        L19_1 = L19_1.insert
        L20_1 = L1_1[L18_1]
        L21_1 = L14_1
        L19_1(L20_1, L21_1)
      else
        L19_1 = {}
        L20_1 = L14_1
        L19_1[1] = L20_1
        L1_1[L18_1] = L19_1
        L8_1 = L8_1 + 1
      end
    end
  end
  ::lbl_66::
end
if L8_1 < 5 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = 1
L12_1 = L0_1
L13_1 = 1
for L14_1 = L11_1, L12_1, L13_1 do
  L15_1 = sigattr_tail
  L15_1 = L15_1[L14_1]
  L15_1 = L15_1.attribute
  if L15_1 == 16389 then
    L16_1 = sigattr_tail
    L16_1 = L16_1[L14_1]
    L16_1 = L16_1.utf8p1
    L17_1 = L16_1
    L16_1 = L16_1.lower
    L16_1 = L16_1(L17_1)
    L17_1 = mp
    L17_1 = L17_1.crc32
    L18_1 = 0
    L19_1 = L16_1
    L20_1 = 1
    L21_1 = #L16_1
    L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
    L18_1 = L3_1[L17_1]
    if L18_1 ~= nil then
      L18_1 = table
      L18_1 = L18_1.insert
      L19_1 = L3_1[L17_1]
      L20_1 = L14_1
      L18_1(L19_1, L20_1)
    else
      L18_1 = {}
      L19_1 = L14_1
      L18_1[1] = L19_1
      L3_1[L17_1] = L18_1
    end
    L18_1 = L1_1[L17_1]
    if L18_1 ~= nil then
      L18_1 = string
      L18_1 = L18_1.find
      L19_1 = L16_1
      L20_1 = "\\[^\\]*$"
      L18_1 = L18_1(L19_1, L20_1)
      if not L18_1 then
        L18_1 = 0
      end
      L19_1 = string
      L19_1 = L19_1.find
      L20_1 = L16_1
      L21_1 = "."
      L22_1 = L18_1
      L23_1 = true
      L19_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
      if L19_1 ~= nil then
        L20_1 = string
        L20_1 = L20_1.sub
        L21_1 = L16_1
        L22_1 = L18_1 + 1
        L23_1 = L19_1 - 1
        L20_1 = L20_1(L21_1, L22_1, L23_1)
        if L20_1 ~= nil then
          L21_1 = L4_1[L20_1]
          if L21_1 == nil then
            L21_1 = {}
            L22_1 = L17_1
            L23_1 = L14_1
            L21_1[1] = L22_1
            L21_1[2] = L23_1
            L4_1[L20_1] = L21_1
          else
            L21_1 = table
            L21_1 = L21_1.insert
            L22_1 = L4_1[L20_1]
            L23_1 = L14_1
            L21_1(L22_1, L23_1)
          end
        end
      end
    end
  end
end
L8_1 = 0
L11_1 = {}
L12_1 = 1
L13_1 = L0_1
L14_1 = 1
for L15_1 = L12_1, L13_1, L14_1 do
  L16_1 = sigattr_tail
  L16_1 = L16_1[L15_1]
  L16_1 = L16_1.attribute
  if L16_1 == 16387 then
    L17_1 = sigattr_tail
    L17_1 = L17_1[L15_1]
    L17_1 = L17_1.utf8p1
    L18_1 = L17_1
    L17_1 = L17_1.lower
    L17_1 = L17_1(L18_1)
    L18_1 = mp
    L18_1 = L18_1.crc32
    L19_1 = 0
    L20_1 = L17_1
    L21_1 = 1
    L22_1 = #L17_1
    L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
    L19_1 = L1_1[L18_1]
    if L19_1 == nil then
      L19_1 = table
      L19_1 = L19_1.insert
      L20_1 = L2_1
      L21_1 = L15_1
      L19_1(L20_1, L21_1)
    else
      L3_1[L18_1] = nil
    end
    L19_1 = L11_1[L18_1]
    if L19_1 == nil then
      L8_1 = L8_1 + 1
      L11_1[L18_1] = 1
    end
  end
end
if L8_1 < 5 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = pairs
L13_1 = L2_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = sigattr_tail
  L17_1 = L17_1[L16_1]
  L17_1 = L17_1.utf8p1
  L18_1 = L17_1
  L17_1 = L17_1.lower
  L17_1 = L17_1(L18_1)
  L18_1 = string
  L18_1 = L18_1.find
  L19_1 = L17_1
  L20_1 = "\\[^\\]*$"
  L18_1 = L18_1(L19_1, L20_1)
  if not L18_1 then
    L18_1 = 0
  end
  L19_1 = string
  L19_1 = L19_1.find
  L20_1 = L17_1
  L21_1 = "."
  L22_1 = L18_1
  L23_1 = true
  L19_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
  if L19_1 ~= nil then
    L20_1 = string
    L20_1 = L20_1.sub
    L21_1 = L17_1
    L22_1 = L18_1 + 1
    L23_1 = -1
    L20_1 = L20_1(L21_1, L22_1, L23_1)
    L21_1 = string
    L21_1 = L21_1.sub
    L22_1 = L17_1
    L23_1 = L18_1 + 1
    L24_1 = L19_1 - 1
    L21_1 = L21_1(L22_1, L23_1, L24_1)
    L22_1 = nil
    if L20_1 ~= nil then
      L24_1 = L20_1
      L23_1 = L20_1.match
      L25_1 = "%.[^%.]+$"
      L23_1 = L23_1(L24_1, L25_1)
      L22_1 = L23_1
    end
    if L21_1 ~= nil and L22_1 ~= nil then
      L23_1 = mp
      L23_1 = L23_1.bitand
      L24_1 = mp
      L24_1 = L24_1.GetExtensionClass
      L25_1 = L22_1
      L24_1 = L24_1(L25_1)
      L25_1 = 3
      L23_1 = L23_1(L24_1, L25_1)
      if L23_1 ~= 0 then
        L23_1 = L4_1[L21_1]
        if L23_1 ~= nil then
          L23_1 = L4_1[L21_1]
          L23_1 = L23_1[1]
          L24_1 = L3_1[L23_1]
          if L24_1 ~= nil then
            L24_1 = sigattr_tail
            L25_1 = L3_1[L23_1]
            L25_1 = L25_1[1]
            L24_1 = L24_1[L25_1]
            L24_1 = L24_1.utf8p1
            L25_1 = L24_1
            L24_1 = L24_1.lower
            L24_1 = L24_1(L25_1)
            L25_1 = L1_1[L23_1]
            if L25_1 ~= nil then
              L25_1 = L1_1[L23_1]
              L25_1 = L25_1[1]
              if L25_1 then
                L25_1 = L1_1[L23_1]
                L25_1 = L25_1[1]
                L7_1[L16_1] = L25_1
              end
            end
            L25_1 = #L24_1
            L26_1 = #L17_1
            if L25_1 > L26_1 then
              L26_1 = L24_1
              L25_1 = L24_1.find
              L27_1 = L17_1
              L28_1 = 1
              L29_1 = true
              L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
              if L25_1 == 1 then
                L26_1 = L24_1
                L25_1 = L24_1.byte
                L27_1 = #L17_1
                L27_1 = L27_1 + 1
                L25_1 = L25_1(L26_1, L27_1)
                if L25_1 ~= 58 then
                  L25_1 = string
                  L25_1 = L25_1.sub
                  L26_1 = L24_1
                  L27_1 = #L17_1
                  L27_1 = L27_1 + 1
                  L25_1 = L25_1(L26_1, L27_1)
                  L26_1 = L5_1[L25_1]
                  if L26_1 ~= nil then
                    L26_1 = L6_1[L23_1]
                    if L26_1 == nil then
                      L6_1[L23_1] = 1
                      L26_1 = table
                      L26_1 = L26_1.insert
                      L27_1 = L5_1[L25_1]
                      L28_1 = L3_1[L23_1]
                      L28_1 = L28_1[1]
                      L26_1(L27_1, L28_1)
                      L26_1 = table
                      L26_1 = L26_1.insert
                      L27_1 = L5_1[L25_1]
                      L28_1 = L16_1
                      L26_1(L27_1, L28_1)
                      L26_1 = L5_1[L25_1]
                      L26_1 = #L26_1
                      if 10 <= L26_1 then
                        L26_1 = false
                        L27_1 = {}
                        L27_1.count = 0
                        L28_1 = pairs
                        L29_1 = L5_1[L25_1]
                        L28_1, L29_1, L30_1 = L28_1(L29_1)
                        for L31_1, L32_1 in L28_1, L29_1, L30_1 do
                          L33_1 = sysio
                          L33_1 = L33_1.ReadFile
                          L34_1 = sigattr_tail
                          L34_1 = L34_1[L32_1]
                          L34_1 = L34_1.utf8p1
                          L35_1 = 0
                          L36_1 = 4
                          L33_1 = L33_1(L34_1, L35_1, L36_1)
                          if L33_1 ~= nil then
                            L34_1 = L27_1[L33_1]
                            if L34_1 == nil then
                              L27_1[L33_1] = 1
                              L34_1 = L27_1.count
                              L34_1 = L34_1 + 1
                              L27_1.count = L34_1
                            end
                          end
                        end
                        L28_1 = L27_1.count
                        if 4 < L28_1 then
                          L26_1 = true
                        end
                        L28_1 = bm
                        L28_1 = L28_1.add_related_string
                        L29_1 = "magic_mismatch"
                        L30_1 = tostring
                        L31_1 = L26_1
                        L30_1 = L30_1(L31_1)
                        L31_1 = bm
                        L31_1 = L31_1.RelatedStringBMReport
                        L28_1(L29_1, L30_1, L31_1)
                        L28_1 = bm
                        L28_1 = L28_1.add_related_string
                        L29_1 = "ransom_extension"
                        L30_1 = L25_1
                        L31_1 = bm
                        L31_1 = L31_1.RelatedStringBMReport
                        L28_1(L29_1, L30_1, L31_1)
                        L28_1 = {}
                        L29_1 = {}
                        L30_1 = {}
                        L31_1 = bm
                        L31_1 = L31_1.get_imagepath
                        L31_1 = L31_1()
                        L32_1 = isnull
                        L33_1 = L31_1
                        L32_1 = L32_1(L33_1)
                        if L32_1 then
                          L31_1 = "NA"
                        else
                          L33_1 = L31_1
                          L32_1 = L31_1.lower
                          L32_1 = L32_1(L33_1)
                          L31_1 = L32_1
                        end
                        L32_1 = bm
                        L32_1 = L32_1.get_current_process_startup_info
                        L32_1 = L32_1()
                        if L32_1 ~= nil then
                          L32_1 = L32_1.ppid
                        else
                          L32_1 = -1
                        end
                        L28_1.cur_image_path = L31_1
                        L28_1.proc_info = L32_1
                        L28_1.appended_ext = L25_1
                        L28_1.magic_mismatch = L26_1
                        L28_1.sig_count = L10_1
                        L28_1.debug_data = L9_1
                        L33_1 = "FileChain_MainSet:"
                        L34_1 = pairs
                        L35_1 = L5_1[L25_1]
                        L34_1, L35_1, L36_1 = L34_1(L35_1)
                        for L37_1, L38_1 in L34_1, L35_1, L36_1 do
                          L39_1 = sigattr_tail
                          L39_1 = L39_1[L38_1]
                          L39_1 = L39_1.utf8p1
                          L40_1 = string
                          L40_1 = L40_1.find
                          L41_1 = L39_1
                          L42_1 = "\\[^\\]*$"
                          L40_1 = L40_1(L41_1, L42_1)
                          if not L40_1 then
                            L40_1 = 0
                          end
                          L41_1 = string
                          L41_1 = L41_1.find
                          L42_1 = L39_1
                          L43_1 = "."
                          L44_1 = L40_1
                          L45_1 = true
                          L41_1 = L41_1(L42_1, L43_1, L44_1, L45_1)
                          if L41_1 ~= nil then
                            L42_1 = string
                            L42_1 = L42_1.sub
                            L43_1 = L39_1
                            L44_1 = L40_1 + 1
                            L45_1 = L41_1 - 1
                            L42_1 = L42_1(L43_1, L44_1, L45_1)
                            L43_1 = L33_1
                            L44_1 = crypto
                            L44_1 = L44_1.CRC32Buffer
                            L45_1 = -1
                            L46_1 = L42_1
                            L47_1 = 0
                            L48_1 = #L42_1
                            L44_1 = L44_1(L45_1, L46_1, L47_1, L48_1)
                            L33_1 = L43_1 .. L44_1
                            L43_1 = L33_1
                            L44_1 = ";"
                            L45_1 = string
                            L45_1 = L45_1.sub
                            L46_1 = L39_1
                            L47_1 = L41_1 + 1
                            L45_1 = L45_1(L46_1, L47_1)
                            L46_1 = ";"
                            L33_1 = L43_1 .. L44_1 .. L45_1 .. L46_1
                          end
                          L42_1 = table
                          L42_1 = L42_1.insert
                          L43_1 = L29_1
                          L44_1 = sigattr_tail
                          L44_1 = L44_1[L38_1]
                          L44_1 = L44_1.utf8p1
                          L42_1(L43_1, L44_1)
                          L42_1 = nil
                          L43_1 = L7_1[L38_1]
                          if L43_1 ~= nil then
                            L43_1 = sigattr_tail
                            L44_1 = L7_1[L38_1]
                            L43_1 = L43_1[L44_1]
                            if L43_1 ~= nil then
                              L43_1 = sigattr_tail
                              L44_1 = L7_1[L38_1]
                              L43_1 = L43_1[L44_1]
                              L43_1 = L43_1.utf8p1
                              L44_1 = L43_1
                              L43_1 = L43_1.lower
                              L43_1 = L43_1(L44_1)
                              L44_1 = sigattr_tail
                              L45_1 = L7_1[L38_1]
                              L44_1 = L44_1[L45_1]
                              L44_1 = L44_1.utf8p2
                              L45_1 = L44_1
                              L44_1 = L44_1.lower
                              L44_1 = L44_1(L45_1)
                              L45_1 = string
                              L45_1 = L45_1.match
                              L46_1 = L44_1
                              L47_1 = "fsize:(%d+)"
                              L45_1 = L45_1(L46_1, L47_1)
                              L42_1 = L45_1
                              if L42_1 == nil then
                                L42_1 = -1
                              end
                              L45_1 = table
                              L45_1 = L45_1.insert
                              L46_1 = L30_1
                              L47_1 = L43_1
                              L45_1(L46_1, L47_1)
                              L45_1 = table
                              L45_1 = L45_1.insert
                              L46_1 = L30_1
                              L47_1 = L42_1
                              L45_1(L46_1, L47_1)
                            end
                            L43_1 = sigattr_tail
                            L43_1 = L43_1[L38_1]
                            if L43_1 ~= nil then
                              L43_1 = sigattr_tail
                              L43_1 = L43_1[L38_1]
                              L43_1 = L43_1.utf8p1
                              L44_1 = L43_1
                              L43_1 = L43_1.lower
                              L43_1 = L43_1(L44_1)
                              L44_1 = sigattr_tail
                              L44_1 = L44_1[L38_1]
                              L44_1 = L44_1.utf8p2
                              L45_1 = L44_1
                              L44_1 = L44_1.lower
                              L44_1 = L44_1(L45_1)
                              L45_1 = string
                              L45_1 = L45_1.match
                              L46_1 = L44_1
                              L47_1 = "fsize:(%d+)"
                              L45_1 = L45_1(L46_1, L47_1)
                              L42_1 = L45_1
                              if L42_1 == nil then
                                L42_1 = -1
                              end
                              L45_1 = table
                              L45_1 = L45_1.insert
                              L46_1 = L30_1
                              L47_1 = L43_1
                              L45_1(L46_1, L47_1)
                              L45_1 = table
                              L45_1 = L45_1.insert
                              L46_1 = L30_1
                              L47_1 = L42_1
                              L45_1(L46_1, L47_1)
                            end
                          end
                        end
                        L28_1.file_list = L29_1
                        L28_1.file_size = L30_1
                        L34_1 = bm
                        L34_1 = L34_1.get_process_relationships
                        L34_1, L35_1 = L34_1()
                        L36_1 = ipairs
                        L37_1 = L34_1
                        L36_1, L37_1, L38_1 = L36_1(L37_1)
                        for L39_1, L40_1 in L36_1, L37_1, L38_1 do
                          L41_1 = L40_1.image_path
                          if L41_1 ~= nil then
                            L41_1 = bm
                            L41_1 = L41_1.add_related_process
                            L42_1 = L40_1.ppid
                            L41_1(L42_1)
                          end
                        end
                        L36_1 = ipairs
                        L37_1 = L35_1
                        L36_1, L37_1, L38_1 = L36_1(L37_1)
                        for L39_1, L40_1 in L36_1, L37_1, L38_1 do
                          L41_1 = L40_1.image_path
                          if L41_1 ~= nil then
                            L41_1 = bm
                            L41_1 = L41_1.add_related_process
                            L42_1 = L40_1.ppid
                            L41_1(L42_1)
                          end
                        end
                        L36_1 = bm
                        L36_1 = L36_1.add_related_string
                        L37_1 = "ransom_files_main"
                        L38_1 = L33_1
                        L39_1 = bm
                        L39_1 = L39_1.RelatedStringBMReport
                        L36_1(L37_1, L38_1, L39_1)
                        L36_1 = safeJsonSerialize
                        L37_1 = L28_1
                        L36_1 = L36_1(L37_1)
                        L37_1 = bm
                        L37_1 = L37_1.add_related_string
                        L38_1 = "gend_ransom_meta"
                        L39_1 = L36_1
                        L40_1 = bm
                        L40_1 = L40_1.RelatedStringBMReport
                        L37_1(L38_1, L39_1, L40_1)
                        L37_1 = bm
                        L37_1 = L37_1.add_related_string
                        L38_1 = "sigcount_type4"
                        L39_1 = L10_1
                        L40_1 = bm
                        L40_1 = L40_1.RelatedStringBMReport
                        L37_1(L38_1, L39_1, L40_1)
                        L37_1 = mp
                        L37_1 = L37_1.INFECTED
                        return L37_1
                      end
                    end
                  else
                    L26_1 = {}
                    L27_1 = L3_1[L23_1]
                    L27_1 = L27_1[1]
                    L28_1 = L16_1
                    L26_1[1] = L27_1
                    L26_1[2] = L28_1
                    L5_1[L25_1] = L26_1
                    L6_1[L23_1] = 1
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
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
