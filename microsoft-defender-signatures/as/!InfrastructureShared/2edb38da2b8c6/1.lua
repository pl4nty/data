local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = 0
L3_1 = bm
L3_1 = L3_1.get_sig_count
L3_1 = L3_1()
L4_1 = 1
L5_1 = L0_1
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = sigattr_tail
  L8_1 = L8_1[L7_1]
  L8_1 = L8_1.attribute
  if L8_1 == 16385 then
    L8_1 = sigattr_tail
    L8_1 = L8_1[L7_1]
    L8_1 = L8_1.utf8p1
    L9_1 = L8_1
    L8_1 = L8_1.lower
    L8_1 = L8_1(L9_1)
    L9_1 = mp
    L9_1 = L9_1.crc32
    L10_1 = 0
    L11_1 = L8_1
    L12_1 = 1
    L13_1 = #L8_1
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    L10_1 = L1_1[L9_1]
    if L10_1 == nil then
      L2_1 = L2_1 + 1
    end
    L1_1[L9_1] = L7_1
  end
end
if L2_1 < 5 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = {}
L6_1 = {}
L7_1 = {}
L8_1 = {}
L9_1 = {}
L10_1 = nil
L11_1 = nil
L12_1 = nil
L13_1 = nil
L14_1 = ""
L15_1 = false
L16_1 = false
L17_1 = 1
L18_1 = L0_1
L19_1 = 1
for L20_1 = L17_1, L18_1, L19_1 do
  L21_1 = sigattr_tail
  L21_1 = L21_1[L20_1]
  L21_1 = L21_1.attribute
  if L21_1 == 16386 then
    L21_1 = sigattr_tail
    L21_1 = L21_1[L20_1]
    L21_1 = L21_1.utf8p2
    L22_1 = L21_1
    L21_1 = L21_1.lower
    L21_1 = L21_1(L22_1)
    L22_1 = sigattr_tail
    L22_1 = L22_1[L20_1]
    L22_1 = L22_1.utf8p1
    L23_1 = L22_1
    L22_1 = L22_1.lower
    L22_1 = L22_1(L23_1)
    L23_1 = mp
    L23_1 = L23_1.crc32
    L24_1 = 0
    L25_1 = L21_1
    L26_1 = 1
    L27_1 = #L21_1
    L23_1 = L23_1(L24_1, L25_1, L26_1, L27_1)
    L24_1 = mp
    L24_1 = L24_1.crc32
    L25_1 = 0
    L26_1 = L22_1
    L27_1 = 1
    L28_1 = #L22_1
    L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1)
    L25_1 = L1_1[L24_1]
    if L25_1 == nil then
      L25_1 = L1_1[L23_1]
      if L25_1 == nil then
        goto lbl_792
      end
    end
    L25_1 = L6_1[L23_1]
    if L25_1 == nil then
      L26_1 = L21_1
      L25_1 = L21_1.match
      L27_1 = "%.[^%.]+$"
      L25_1 = L25_1(L26_1, L27_1)
      if L25_1 ~= nil then
        L26_1 = mp
        L26_1 = L26_1.bitand
        L27_1 = mp
        L27_1 = L27_1.GetExtensionClass
        L28_1 = L25_1
        L27_1 = L27_1(L28_1)
        L28_1 = 3
        L26_1 = L26_1(L27_1, L28_1)
        if L26_1 ~= 0 then
          L26_1 = #L21_1
          L27_1 = #L22_1
          if L26_1 < L27_1 then
            L27_1 = L22_1
            L26_1 = L22_1.find
            L28_1 = L21_1
            L29_1 = 1
            L30_1 = true
            L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
            if L26_1 == 1 then
              L27_1 = L22_1
              L26_1 = L22_1.byte
              L28_1 = #L21_1
              L28_1 = L28_1 + 1
              L26_1 = L26_1(L27_1, L28_1)
              if L26_1 ~= 58 then
                L6_1[L23_1] = 1
                L27_1 = L22_1
                L26_1 = L22_1.match
                L28_1 = "%.[^%.]+$"
                L26_1 = L26_1(L27_1, L28_1)
                L27_1 = mp
                L27_1 = L27_1.GetExtensionClass
                L28_1 = L26_1
                L27_1 = L27_1(L28_1)
                if L27_1 == 4 then
                  L27_1 = isKnownRansomExtension
                  L28_1 = L26_1
                  L27_1 = L27_1(L28_1)
                  if not L27_1 then
                    goto lbl_792
                  end
                end
                L27_1 = L1_1[L24_1]
                if L27_1 ~= nil then
                  L27_1 = L1_1[L24_1]
                  L7_1[L20_1] = L27_1
                else
                  L27_1 = L1_1[L23_1]
                  if L27_1 ~= nil then
                    L27_1 = L1_1[L23_1]
                    L7_1[L20_1] = L27_1
                  end
                end
                L27_1 = string
                L27_1 = L27_1.sub
                L28_1 = L22_1
                L29_1 = #L21_1
                L29_1 = L29_1 + 1
                L27_1 = L27_1(L28_1, L29_1)
                L28_1 = L4_1[L27_1]
                if L28_1 ~= nil then
                  L28_1 = table
                  L28_1 = L28_1.insert
                  L29_1 = L4_1[L27_1]
                  L30_1 = L20_1
                  L28_1(L29_1, L30_1)
                else
                  L28_1 = {}
                  L29_1 = L20_1
                  L28_1[1] = L29_1
                  L4_1[L27_1] = L28_1
                end
                L29_1 = L27_1
                L28_1 = L27_1.match
                L30_1 = "%.[^%.]+$"
                L31_1 = 1
                L32_1 = true
                L28_1 = L28_1(L29_1, L30_1, L31_1, L32_1)
                if L28_1 ~= nil then
                  L29_1 = L5_1[L28_1]
                  if L29_1 ~= nil then
                    L29_1 = table
                    L29_1 = L29_1.insert
                    L30_1 = L5_1[L28_1]
                    L31_1 = L20_1
                    L29_1(L30_1, L31_1)
                  else
                    L29_1 = {}
                    L30_1 = L20_1
                    L29_1[1] = L30_1
                    L5_1[L28_1] = L29_1
                  end
                  L29_1 = L5_1[L28_1]
                  L29_1 = #L29_1
                  if 5 <= L29_1 then
                    L29_1 = 0
                    L30_1 = pairs
                    L31_1 = L4_1
                    L30_1, L31_1, L32_1 = L30_1(L31_1)
                    for L33_1, L34_1 in L30_1, L31_1, L32_1 do
                      L35_1 = L4_1[L33_1]
                      L35_1 = #L35_1
                      if L35_1 == 1 then
                        L29_1 = L29_1 + 1
                      end
                    end
                    if 5 <= L29_1 then
                      L4_1 = L5_1
                      L27_1 = L28_1
                      L16_1 = true
                    end
                  end
                end
                L29_1 = L4_1[L27_1]
                L29_1 = #L29_1
                if 5 <= L29_1 then
                  L29_1 = false
                  L30_1 = {}
                  L30_1.count = 0
                  L31_1 = pairs
                  L32_1 = L4_1[L27_1]
                  L31_1, L32_1, L33_1 = L31_1(L32_1)
                  for L34_1, L35_1 in L31_1, L32_1, L33_1 do
                    L36_1 = sysio
                    L36_1 = L36_1.GetFileSize
                    L37_1 = sigattr_tail
                    L37_1 = L37_1[L35_1]
                    L37_1 = L37_1.utf8p1
                    L36_1 = L36_1(L37_1)
                    L37_1 = sysio
                    L37_1 = L37_1.ReadFile
                    L38_1 = sigattr_tail
                    L38_1 = L38_1[L35_1]
                    L38_1 = L38_1.utf8p1
                    L39_1 = 0
                    L40_1 = 4
                    L37_1 = L37_1(L38_1, L39_1, L40_1)
                    if L37_1 ~= nil then
                      L38_1 = L30_1[L37_1]
                      if L38_1 == nil then
                        L30_1[L37_1] = 1
                        L38_1 = L30_1.count
                        L38_1 = L38_1 + 1
                        L30_1.count = L38_1
                      end
                    end
                    L38_1 = L7_1[L35_1]
                    if L38_1 ~= nil and L15_1 == false then
                      L38_1 = sigattr_tail
                      L39_1 = L7_1[L35_1]
                      L38_1 = L38_1[L39_1]
                      L38_1 = L38_1.utf8p2
                      L39_1 = #L38_1
                      if 136 < L39_1 then
                        L39_1 = string
                        L39_1 = L39_1.find
                        L40_1 = L38_1
                        L41_1 = "RemoteIp"
                        L42_1 = 100
                        L43_1 = true
                        L39_1 = L39_1(L40_1, L41_1, L42_1, L43_1)
                        if L39_1 ~= nil then
                          L40_1 = #L38_1
                          L40_1 = L40_1 - L39_1
                          if 20 < L40_1 then
                            L40_1 = {}
                            L41_1 = string
                            L41_1 = L41_1.gmatch
                            L42_1 = L38_1
                            L43_1 = "(%w+):([^;]+)"
                            L41_1, L42_1, L43_1 = L41_1(L42_1, L43_1)
                            for L44_1, L45_1 in L41_1, L42_1, L43_1 do
                              L40_1[L44_1] = L45_1
                            end
                            L41_1 = L40_1.UsrName
                            if L41_1 ~= nil then
                              L41_1 = L40_1.Domain
                              if L41_1 ~= nil then
                                L41_1 = L40_1.RemoteIp
                                if L41_1 ~= nil then
                                  L10_1 = L40_1.UsrName
                                  L11_1 = L40_1.Domain
                                  L41_1 = scrubData
                                  L42_1 = L40_1.UsrName
                                  L41_1 = L41_1(L42_1)
                                  L12_1 = L41_1
                                  L41_1 = scrubData
                                  L42_1 = L40_1.Domain
                                  L41_1 = L41_1(L42_1)
                                  L13_1 = L41_1
                                  L41_1 = string
                                  L41_1 = L41_1.match
                                  L42_1 = L40_1.RemoteIp
                                  L43_1 = "(.*):(.*)"
                                  L41_1 = L41_1(L42_1, L43_1)
                                  L42_1 = "NA"
                                  if L37_1 ~= nil then
                                    L43_1 = string
                                    L43_1 = L43_1.format
                                    L44_1 = "0x%02X%02X%02X%02X"
                                    L45_1 = string
                                    L45_1 = L45_1.byte
                                    L46_1 = L37_1
                                    L47_1 = 1
                                    L48_1 = 4
                                    L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1 = L45_1(L46_1, L47_1, L48_1)
                                    L43_1 = L43_1(L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1)
                                    L42_1 = L43_1
                                  end
                                  if L41_1 ~= nil and (L14_1 == "" or L14_1 == L41_1) then
                                    L43_1 = table
                                    L43_1 = L43_1.insert
                                    L44_1 = L9_1
                                    L45_1 = {}
                                    L46_1 = sigattr_tail
                                    L46_1 = L46_1[L35_1]
                                    L46_1 = L46_1.utf8p1
                                    L45_1.path = L46_1
                                    L45_1.magic = L42_1
                                    L45_1.fileSize = L36_1
                                    L43_1(L44_1, L45_1)
                                    L14_1 = L41_1
                                  else
                                    L15_1 = true
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  L31_1 = L30_1.count
                  if 4 < L31_1 then
                    L29_1 = true
                  end
                  L31_1 = bm
                  L31_1 = L31_1.add_related_string
                  L32_1 = "magic_mismatch"
                  L33_1 = tostring
                  L34_1 = L29_1
                  L33_1 = L33_1(L34_1)
                  L34_1 = bm
                  L34_1 = L34_1.RelatedStringBMReport
                  L31_1(L32_1, L33_1, L34_1)
                  L31_1 = bm
                  L31_1 = L31_1.add_related_string
                  L32_1 = "ransom_extension"
                  L33_1 = L27_1
                  L34_1 = bm
                  L34_1 = L34_1.RelatedStringBMReport
                  L31_1(L32_1, L33_1, L34_1)
                  L31_1 = {}
                  L32_1 = {}
                  L33_1 = bm
                  L33_1 = L33_1.get_imagepath
                  L33_1 = L33_1()
                  L34_1 = isnull
                  L35_1 = L33_1
                  L34_1 = L34_1(L35_1)
                  if L34_1 then
                    L33_1 = "NA"
                  else
                    L35_1 = L33_1
                    L34_1 = L33_1.lower
                    L34_1 = L34_1(L35_1)
                    L33_1 = L34_1
                  end
                  L34_1 = bm
                  L34_1 = L34_1.get_current_process_startup_info
                  L34_1 = L34_1()
                  L35_1 = ""
                  if L34_1 ~= nil then
                    L35_1 = L34_1.command_line
                    L34_1 = L34_1.ppid
                  else
                    L34_1 = -1
                  end
                  L31_1.cur_image_path = L33_1
                  L31_1.proc_info = L34_1
                  L31_1.appended_ext = L27_1
                  L31_1.magic_mismatch = L29_1
                  L31_1.is_double_ext = L16_1
                  L31_1.sig_count = L3_1
                  L36_1 = "FileChain_MainSet:"
                  L37_1 = pairs
                  L38_1 = L4_1[L27_1]
                  L37_1, L38_1, L39_1 = L37_1(L38_1)
                  for L40_1, L41_1 in L37_1, L38_1, L39_1 do
                    L42_1 = sigattr_tail
                    L42_1 = L42_1[L41_1]
                    L42_1 = L42_1.utf8p1
                    L43_1 = string
                    L43_1 = L43_1.find
                    L44_1 = L42_1
                    L45_1 = "\\[^\\]*$"
                    L43_1 = L43_1(L44_1, L45_1)
                    if not L43_1 then
                      L43_1 = 0
                    end
                    L44_1 = string
                    L44_1 = L44_1.find
                    L45_1 = L42_1
                    L46_1 = "."
                    L47_1 = L43_1
                    L48_1 = true
                    L44_1 = L44_1(L45_1, L46_1, L47_1, L48_1)
                    if L44_1 ~= nil then
                      L45_1 = string
                      L45_1 = L45_1.sub
                      L46_1 = L42_1
                      L47_1 = L43_1 + 1
                      L48_1 = L44_1 - 1
                      L45_1 = L45_1(L46_1, L47_1, L48_1)
                      L46_1 = L36_1
                      L47_1 = crypto
                      L47_1 = L47_1.CRC32Buffer
                      L48_1 = -1
                      L49_1 = L45_1
                      L50_1 = 0
                      L51_1 = #L45_1
                      L47_1 = L47_1(L48_1, L49_1, L50_1, L51_1)
                      L36_1 = L46_1 .. L47_1
                      L46_1 = L36_1
                      L47_1 = ";"
                      L48_1 = string
                      L48_1 = L48_1.sub
                      L49_1 = L42_1
                      L50_1 = L44_1 + 1
                      L48_1 = L48_1(L49_1, L50_1)
                      L49_1 = ";"
                      L36_1 = L46_1 .. L47_1 .. L48_1 .. L49_1
                    end
                    L45_1 = sigattr_tail
                    L45_1 = L45_1[L41_1]
                    L42_1 = L45_1.utf8p2
                    L45_1 = string
                    L45_1 = L45_1.find
                    L46_1 = L42_1
                    L47_1 = "\\[^\\]*$"
                    L45_1 = L45_1(L46_1, L47_1)
                    L43_1 = L45_1 or L43_1
                    if not L45_1 then
                      L43_1 = 0
                    end
                    L45_1 = string
                    L45_1 = L45_1.find
                    L46_1 = L42_1
                    L47_1 = "."
                    L48_1 = L43_1
                    L49_1 = true
                    L45_1 = L45_1(L46_1, L47_1, L48_1, L49_1)
                    L44_1 = L45_1
                    if L44_1 ~= nil then
                      L45_1 = string
                      L45_1 = L45_1.sub
                      L46_1 = L42_1
                      L47_1 = L43_1 + 1
                      L48_1 = L44_1 - 1
                      L45_1 = L45_1(L46_1, L47_1, L48_1)
                      L46_1 = L36_1
                      L47_1 = crypto
                      L47_1 = L47_1.CRC32Buffer
                      L48_1 = -1
                      L49_1 = L45_1
                      L50_1 = 0
                      L51_1 = #L45_1
                      L47_1 = L47_1(L48_1, L49_1, L50_1, L51_1)
                      L36_1 = L46_1 .. L47_1
                      L46_1 = L36_1
                      L47_1 = ";"
                      L48_1 = string
                      L48_1 = L48_1.sub
                      L49_1 = L42_1
                      L50_1 = L44_1 + 1
                      L48_1 = L48_1(L49_1, L50_1)
                      L49_1 = ";"
                      L36_1 = L46_1 .. L47_1 .. L48_1 .. L49_1
                    end
                    L45_1 = table
                    L45_1 = L45_1.insert
                    L46_1 = L32_1
                    L47_1 = sigattr_tail
                    L47_1 = L47_1[L41_1]
                    L47_1 = L47_1.utf8p1
                    L45_1(L46_1, L47_1)
                    L45_1 = table
                    L45_1 = L45_1.insert
                    L46_1 = L32_1
                    L47_1 = sigattr_tail
                    L47_1 = L47_1[L41_1]
                    L47_1 = L47_1.utf8p2
                    L45_1(L46_1, L47_1)
                  end
                  L31_1.file_list = L32_1
                  L37_1 = bm
                  L37_1 = L37_1.get_process_relationships
                  L37_1, L38_1 = L37_1()
                  L39_1 = ipairs
                  L40_1 = L37_1
                  L39_1, L40_1, L41_1 = L39_1(L40_1)
                  for L42_1, L43_1 in L39_1, L40_1, L41_1 do
                    L44_1 = L43_1.image_path
                    if L44_1 ~= nil then
                      L44_1 = bm
                      L44_1 = L44_1.add_related_process
                      L45_1 = L43_1.ppid
                      L44_1(L45_1)
                    end
                  end
                  L39_1 = ipairs
                  L40_1 = L38_1
                  L39_1, L40_1, L41_1 = L39_1(L40_1)
                  for L42_1, L43_1 in L39_1, L40_1, L41_1 do
                    L44_1 = L43_1.image_path
                    if L44_1 ~= nil then
                      L44_1 = bm
                      L44_1 = L44_1.add_related_process
                      L45_1 = L43_1.ppid
                      L44_1(L45_1)
                    end
                  end
                  L39_1 = bm
                  L39_1 = L39_1.add_related_string
                  L40_1 = "ransom_files_main"
                  L41_1 = L36_1
                  L42_1 = bm
                  L42_1 = L42_1.RelatedStringBMReport
                  L39_1(L40_1, L41_1, L42_1)
                  L39_1 = safeJsonSerialize
                  L40_1 = L31_1
                  L39_1 = L39_1(L40_1)
                  L40_1 = bm
                  L40_1 = L40_1.add_related_string
                  L41_1 = "genb_ransom_meta"
                  L42_1 = L39_1
                  L43_1 = bm
                  L43_1 = L43_1.RelatedStringBMReport
                  L40_1(L41_1, L42_1, L43_1)
                  L40_1 = sms_untrusted_process
                  L40_1()
                  L40_1 = reportTimingData
                  L40_1()
                  L40_1 = reportSessionInformationInclusive
                  L40_1()
                  L40_1 = pcall
                  L41_1 = reportBmInfo
                  L40_1, L41_1 = L40_1(L41_1)
                  if not L40_1 and L41_1 then
                    L42_1 = bm
                    L42_1 = L42_1.add_related_string
                    L43_1 = "bmInfoFailReason"
                    L44_1 = tostring
                    L45_1 = L41_1
                    L44_1 = L44_1(L45_1)
                    L45_1 = bm
                    L45_1 = L45_1.RelatedStringBMReport
                    L42_1(L43_1, L44_1, L45_1)
                  end
                  if L15_1 == false then
                    L42_1 = #L9_1
                    if 0 < L42_1 and L14_1 ~= nil and L14_1 ~= "" then
                      L42_1 = mp
                      L42_1 = L42_1.GetExtensionClass
                      L43_1 = L27_1
                      L42_1 = L42_1(L43_1)
                      L43_1 = isnull
                      L44_1 = L42_1
                      L43_1 = L43_1(L44_1)
                      if L43_1 then
                        L42_1 = 1000
                      end
                      L43_1 = nil
                      L44_1 = nil
                      L45_1 = MpCommon
                      L45_1 = L45_1.GetBehavioralNetworkBlocksSettings
                      if L45_1 then
                        L45_1 = pcall
                        L46_1 = MpCommon
                        L46_1 = L46_1.GetBehavioralNetworkBlocksSettings
                        L47_1 = MpCommon
                        L47_1 = L47_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
                        L45_1, L46_1 = L45_1(L46_1, L47_1)
                        L44_1 = L46_1
                        L43_1 = L45_1
                      end
                      if not L43_1 or L44_1 == nil then
                        L45_1 = {}
                        L46_1 = MpCommon
                        L46_1 = L46_1.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                        L45_1.State = L46_1
                        L45_1.MaxTimeout = 0
                        L45_1.Exclusions = ""
                        L45_1.AggressiveLevel = 0
                        L44_1 = L45_1
                      end
                      L45_1 = {}
                      L45_1.Extension = L27_1
                      L45_1.ExtensionClass = L42_1
                      L45_1.imagePath = L33_1
                      L45_1.commandLine = L35_1
                      L45_1.ppID = L34_1
                      L45_1.UserName = L12_1
                      L45_1.Domain = L13_1
                      L45_1.file_list = L9_1
                      L45_1.Type = "Type2"
                      L45_1.RemoteEncConfig = L44_1
                      L8_1 = L45_1
                      L45_1 = safeJsonSerialize
                      L46_1 = L8_1
                      L45_1 = L45_1(L46_1)
                      L46_1 = "1bb146aa"
                      L47_1 = "app_ext_"
                      L48_1 = L27_1
                      L47_1 = L47_1 .. L48_1
                      L48_1 = MpCommon
                      L48_1 = L48_1.AtomicCounterValueExNamespaced
                      L49_1 = L47_1
                      L50_1 = L46_1
                      L48_1 = L48_1(L49_1, L50_1)
                      L8_1.ACSource = 3
                      L8_1.SignatureCountT2 = L3_1
                      if L48_1 ~= nil then
                        L49_1 = L48_1.count
                        L8_1.ACFilesEncryptCount = L49_1
                        L49_1 = L48_1.insert_time
                        L8_1.ACCreationTime = L49_1
                        L49_1 = L48_1.expire_time
                        L8_1.ACExpirationTime = L49_1
                        L49_1 = L48_1.update_time
                        L8_1.ACRecentTime = L49_1
                      else
                        L8_1.ACFilesEncryptCount = -1
                      end
                      L49_1 = bm
                      L49_1 = L49_1.add_related_string
                      L50_1 = "RemoteClientData"
                      L51_1 = L45_1
                      L52_1 = bm
                      L52_1 = L52_1.RelatedStringBMReport
                      L49_1(L50_1, L51_1, L52_1)
                      L49_1 = bm
                      L49_1 = L49_1.trigger_sig
                      L50_1 = "RemoteGenericRansomware:Type2"
                      L51_1 = L45_1
                      L49_1(L50_1, L51_1)
                      L49_1 = pcall
                      L50_1 = updateSystemDNSServers
                      L49_1, L50_1 = L49_1(L50_1)
                      if not L49_1 then
                        L51_1 = bm
                        L51_1 = L51_1.add_related_string
                        L52_1 = "updateSystemDNSServers_fail"
                        L53_1 = L50_1
                        L54_1 = bm
                        L54_1 = L54_1.RelatedStringBMReport
                        L51_1(L52_1, L53_1, L54_1)
                      end
                      L51_1 = pcall
                      L52_1 = updateDomainInfo
                      L51_1, L52_1, L53_1, L54_1 = L51_1(L52_1)
                      if L51_1 then
                        L55_1 = GetRollingQueueKeyValue
                        L56_1 = "domainInfo"
                        L57_1 = L14_1
                        L55_1 = L55_1(L56_1, L57_1)
                        L8_1.ipTypeFlags = L55_1
                      else
                        L55_1 = bm
                        L55_1 = L55_1.add_related_string
                        L56_1 = "updateDomainInfo_fail"
                        L57_1 = L52_1
                        L58_1 = bm
                        L58_1 = L58_1.RelatedStringBMReport
                        L55_1(L56_1, L57_1, L58_1)
                      end
                      L55_1 = SafeGetUrlReputation
                      L56_1 = {}
                      L57_1 = L14_1
                      L56_1[1] = L57_1
                      L57_1 = {}
                      L57_1.SIG_CONTEXT = "BM"
                      L57_1.CONTEXT_SOURCE = "GenRansom3"
                      L57_1.TAG = "NOLOOKUP"
                      L58_1 = safeJsonSerialize
                      L59_1 = L8_1
                      L58_1 = L58_1(L59_1)
                      L57_1.data = L58_1
                      L58_1 = false
                      L59_1 = 3000
                      L60_1 = false
                      L55_1 = L55_1(L56_1, L57_1, L58_1, L59_1, L60_1)
                      if L55_1 then
                        L56_1 = L55_1.error
                        if L56_1 == 3 then
                          L8_1.CRReportError = "Failed the first attempt"
                          L56_1 = SafeGetUrlReputation
                          L57_1 = {}
                          L58_1 = L14_1
                          L57_1[1] = L58_1
                          L58_1 = {}
                          L58_1.SIG_CONTEXT = "BM"
                          L58_1.CONTEXT_SOURCE = "GenRansom3"
                          L58_1.TAG = "NOLOOKUP"
                          L59_1 = safeJsonSerialize
                          L60_1 = L8_1
                          L59_1 = L59_1(L60_1)
                          L58_1.data = L59_1
                          L59_1 = false
                          L60_1 = 3000
                          L61_1 = false
                          L56_1 = L56_1(L57_1, L58_1, L59_1, L60_1, L61_1)
                          L55_1 = L56_1
                        end
                      end
                      L56_1 = L55_1.urls
                      L56_1 = L56_1[L14_1]
                      if L56_1 then
                        L56_1 = L55_1.urls
                        L56_1 = L56_1[L14_1]
                        L56_1 = L56_1.confidence
                        L8_1.confidence = L56_1
                        L56_1 = L55_1.urls
                        L56_1 = L56_1[L14_1]
                        L56_1 = L56_1.context
                        L56_1 = L56_1.Family
                        L8_1.family = L56_1
                        L56_1 = L55_1.urls
                        L56_1 = L56_1[L14_1]
                        L56_1 = L56_1.determination
                        L8_1.determination = L56_1
                        L56_1 = {}
                        L57_1 = L55_1.urls
                        L57_1 = L57_1[L14_1]
                        L57_1 = L57_1.context
                        L57_1 = L57_1.action
                        L56_1.action = L57_1
                        L57_1 = L55_1.urls
                        L57_1 = L57_1[L14_1]
                        L57_1 = L57_1.context
                        L57_1 = L57_1.action_parameter
                        L56_1.parameter = L57_1
                        L57_1 = L55_1.urls
                        L57_1 = L57_1[L14_1]
                        L57_1 = L57_1.context
                        L57_1 = L57_1.action_ttl
                        L56_1.ttl = L57_1
                        L8_1.action = L56_1
                        L57_1 = L55_1.urls
                        L57_1 = L57_1[L14_1]
                        L57_1 = L57_1.context
                        L8_1.context = L57_1
                        L8_1.ip = L14_1
                        L8_1.unscrubbed_username = L10_1
                        L8_1.unscrubbed_domain = L11_1
                        L57_1 = safeJsonSerialize
                        L58_1 = L8_1
                        L57_1 = L57_1(L58_1)
                        L58_1 = bm
                        L58_1 = L58_1.trigger_sig_delayed
                        L59_1 = "RemoteGenericRansomwareDelay:Type2"
                        L60_1 = L57_1
                        L61_1 = 570000
                        L58_1(L59_1, L60_1, L61_1)
                      end
                    end
                  end
                  L42_1 = bm
                  L42_1 = L42_1.add_related_string
                  L43_1 = "sigcount_type2"
                  L44_1 = L3_1
                  L45_1 = bm
                  L45_1 = L45_1.RelatedStringBMReport
                  L42_1(L43_1, L44_1, L45_1)
                  L42_1 = mp
                  L42_1 = L42_1.INFECTED
                  return L42_1
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_792::
end
L17_1 = mp
L17_1 = L17_1.CLEAN
return L17_1
