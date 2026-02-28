local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = bm
L2_1 = L2_1.get_sig_count
L2_1 = L2_1()
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_tail
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.attribute
  if L7_1 == 16385 then
    L7_1 = sigattr_tail
    L7_1 = L7_1[L6_1]
    L7_1 = L7_1.utf8p1
    L8_1 = L7_1
    L7_1 = L7_1.lower
    L7_1 = L7_1(L8_1)
    L8_1 = mp
    L8_1 = L8_1.crc32
    L9_1 = 0
    L10_1 = L7_1
    L11_1 = 1
    L12_1 = #L7_1
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    L1_1[L8_1] = L6_1
  end
end
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = {}
L7_1 = {}
L8_1 = {}
L9_1 = nil
L10_1 = nil
L11_1 = nil
L12_1 = nil
L13_1 = ""
L14_1 = false
L15_1 = false
L16_1 = 1
L17_1 = L0_1
L18_1 = 1
for L19_1 = L16_1, L17_1, L18_1 do
  L20_1 = sigattr_tail
  L20_1 = L20_1[L19_1]
  L20_1 = L20_1.attribute
  if L20_1 == 16386 then
    L20_1 = sigattr_tail
    L20_1 = L20_1[L19_1]
    L20_1 = L20_1.utf8p2
    L21_1 = L20_1
    L20_1 = L20_1.lower
    L20_1 = L20_1(L21_1)
    L21_1 = sigattr_tail
    L21_1 = L21_1[L19_1]
    L21_1 = L21_1.utf8p1
    L22_1 = L21_1
    L21_1 = L21_1.lower
    L21_1 = L21_1(L22_1)
    L22_1 = mp
    L22_1 = L22_1.crc32
    L23_1 = 0
    L24_1 = L20_1
    L25_1 = 1
    L26_1 = #L20_1
    L22_1 = L22_1(L23_1, L24_1, L25_1, L26_1)
    L23_1 = mp
    L23_1 = L23_1.crc32
    L24_1 = 0
    L25_1 = L21_1
    L26_1 = 1
    L27_1 = #L21_1
    L23_1 = L23_1(L24_1, L25_1, L26_1, L27_1)
    L24_1 = L1_1[L23_1]
    if L24_1 == nil then
      L24_1 = L1_1[L22_1]
      if L24_1 == nil then
        goto lbl_804
      end
    end
    L24_1 = L5_1[L22_1]
    if L24_1 == nil then
      L25_1 = L20_1
      L24_1 = L20_1.match
      L26_1 = "%.[^%.]+$"
      L24_1 = L24_1(L25_1, L26_1)
      if L24_1 ~= nil then
        L25_1 = mp
        L25_1 = L25_1.bitand
        L26_1 = mp
        L26_1 = L26_1.GetExtensionClass
        L27_1 = L24_1
        L26_1 = L26_1(L27_1)
        L27_1 = 3
        L25_1 = L25_1(L26_1, L27_1)
        if L25_1 ~= 0 then
          L25_1 = #L20_1
          L26_1 = #L21_1
          if L25_1 < L26_1 then
            L26_1 = L21_1
            L25_1 = L21_1.find
            L27_1 = L20_1
            L28_1 = 1
            L29_1 = true
            L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
            if L25_1 == 1 then
              L26_1 = L21_1
              L25_1 = L21_1.byte
              L27_1 = #L20_1
              L27_1 = L27_1 + 1
              L25_1 = L25_1(L26_1, L27_1)
              if L25_1 ~= 58 then
                L5_1[L22_1] = 1
                L26_1 = L21_1
                L25_1 = L21_1.match
                L27_1 = "%.[^%.]+$"
                L25_1 = L25_1(L26_1, L27_1)
                L26_1 = mp
                L26_1 = L26_1.GetExtensionClass
                L27_1 = L25_1
                L26_1 = L26_1(L27_1)
                if L26_1 ~= 4 then
                  L26_1 = L1_1[L23_1]
                  if L26_1 ~= nil then
                    L26_1 = L1_1[L23_1]
                    L6_1[L19_1] = L26_1
                  else
                    L26_1 = L1_1[L22_1]
                    if L26_1 ~= nil then
                      L26_1 = L1_1[L22_1]
                      L6_1[L19_1] = L26_1
                    end
                  end
                  L26_1 = string
                  L26_1 = L26_1.sub
                  L27_1 = L21_1
                  L28_1 = #L20_1
                  L28_1 = L28_1 + 1
                  L26_1 = L26_1(L27_1, L28_1)
                  L27_1 = L3_1[L26_1]
                  if L27_1 ~= nil then
                    L27_1 = table
                    L27_1 = L27_1.insert
                    L28_1 = L3_1[L26_1]
                    L29_1 = L19_1
                    L27_1(L28_1, L29_1)
                  else
                    L27_1 = {}
                    L28_1 = L19_1
                    L27_1[1] = L28_1
                    L3_1[L26_1] = L27_1
                  end
                  L28_1 = L26_1
                  L27_1 = L26_1.match
                  L29_1 = "%.[^%.]+$"
                  L30_1 = 1
                  L31_1 = true
                  L27_1 = L27_1(L28_1, L29_1, L30_1, L31_1)
                  if L27_1 ~= nil then
                    L28_1 = L4_1[L27_1]
                    if L28_1 ~= nil then
                      L28_1 = table
                      L28_1 = L28_1.insert
                      L29_1 = L4_1[L27_1]
                      L30_1 = L19_1
                      L28_1(L29_1, L30_1)
                    else
                      L28_1 = {}
                      L29_1 = L19_1
                      L28_1[1] = L29_1
                      L4_1[L27_1] = L28_1
                    end
                    L28_1 = L4_1[L27_1]
                    L28_1 = #L28_1
                    if 5 <= L28_1 then
                      L28_1 = 0
                      L29_1 = pairs
                      L30_1 = L3_1
                      L29_1, L30_1, L31_1 = L29_1(L30_1)
                      for L32_1, L33_1 in L29_1, L30_1, L31_1 do
                        L34_1 = L3_1[L32_1]
                        L34_1 = #L34_1
                        if L34_1 == 1 then
                          L28_1 = L28_1 + 1
                        end
                      end
                      if 5 <= L28_1 then
                        L3_1 = L4_1
                        L26_1 = L27_1
                        L15_1 = true
                      end
                    end
                  end
                  L28_1 = L3_1[L26_1]
                  L28_1 = #L28_1
                  if 5 <= L28_1 then
                    L28_1 = false
                    L29_1 = {}
                    L29_1.count = 0
                    L30_1 = pairs
                    L31_1 = L3_1[L26_1]
                    L30_1, L31_1, L32_1 = L30_1(L31_1)
                    for L33_1, L34_1 in L30_1, L31_1, L32_1 do
                      L35_1 = sysio
                      L35_1 = L35_1.GetFileSize
                      L36_1 = sigattr_tail
                      L36_1 = L36_1[L34_1]
                      L36_1 = L36_1.utf8p1
                      L35_1 = L35_1(L36_1)
                      L36_1 = sysio
                      L36_1 = L36_1.ReadFile
                      L37_1 = sigattr_tail
                      L37_1 = L37_1[L34_1]
                      L37_1 = L37_1.utf8p1
                      L38_1 = 0
                      L39_1 = 4
                      L36_1 = L36_1(L37_1, L38_1, L39_1)
                      if L36_1 ~= nil then
                        L37_1 = L29_1[L36_1]
                        if L37_1 == nil then
                          L29_1[L36_1] = 1
                          L37_1 = L29_1.count
                          L37_1 = L37_1 + 1
                          L29_1.count = L37_1
                        end
                      end
                      L37_1 = L6_1[L34_1]
                      if L37_1 ~= nil and L14_1 == false then
                        L37_1 = sigattr_tail
                        L38_1 = L6_1[L34_1]
                        L37_1 = L37_1[L38_1]
                        L37_1 = L37_1.utf8p2
                        L38_1 = #L37_1
                        if 136 < L38_1 then
                          L38_1 = string
                          L38_1 = L38_1.find
                          L39_1 = L37_1
                          L40_1 = "RemoteIp"
                          L41_1 = 100
                          L42_1 = true
                          L38_1 = L38_1(L39_1, L40_1, L41_1, L42_1)
                          if L38_1 ~= nil then
                            L39_1 = #L37_1
                            L39_1 = L39_1 - L38_1
                            if 20 < L39_1 then
                              L39_1 = {}
                              L40_1 = string
                              L40_1 = L40_1.gmatch
                              L41_1 = L37_1
                              L42_1 = "(%w+):([^;]+)"
                              L40_1, L41_1, L42_1 = L40_1(L41_1, L42_1)
                              for L43_1, L44_1 in L40_1, L41_1, L42_1 do
                                L39_1[L43_1] = L44_1
                              end
                              L40_1 = L39_1.UsrName
                              if L40_1 ~= nil then
                                L40_1 = L39_1.Domain
                                if L40_1 ~= nil then
                                  L40_1 = L39_1.RemoteIp
                                  if L40_1 ~= nil then
                                    L9_1 = L39_1.UsrName
                                    L10_1 = L39_1.Domain
                                    L40_1 = scrubData
                                    L41_1 = L39_1.UsrName
                                    L40_1 = L40_1(L41_1)
                                    L11_1 = L40_1
                                    L40_1 = scrubData
                                    L41_1 = L39_1.Domain
                                    L40_1 = L40_1(L41_1)
                                    L12_1 = L40_1
                                    L40_1 = string
                                    L40_1 = L40_1.match
                                    L41_1 = L39_1.RemoteIp
                                    L42_1 = "(.*):(.*)"
                                    L40_1 = L40_1(L41_1, L42_1)
                                    L41_1 = "NA"
                                    if L36_1 ~= nil then
                                      L42_1 = string
                                      L42_1 = L42_1.format
                                      L43_1 = "0x%02X%02X%02X%02X"
                                      L44_1 = string
                                      L44_1 = L44_1.byte
                                      L45_1 = L36_1
                                      L46_1 = 1
                                      L47_1 = 4
                                      L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1 = L44_1(L45_1, L46_1, L47_1)
                                      L42_1 = L42_1(L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1)
                                      L41_1 = L42_1
                                    end
                                    if L40_1 ~= nil and (L13_1 == "" or L13_1 == L40_1) then
                                      L42_1 = table
                                      L42_1 = L42_1.insert
                                      L43_1 = L8_1
                                      L44_1 = {}
                                      L45_1 = sigattr_tail
                                      L45_1 = L45_1[L34_1]
                                      L45_1 = L45_1.utf8p1
                                      L44_1.path = L45_1
                                      L44_1.magic = L41_1
                                      L44_1.fileSize = L35_1
                                      L42_1(L43_1, L44_1)
                                      L13_1 = L40_1
                                    else
                                      L14_1 = true
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    L30_1 = L29_1.count
                    if 4 < L30_1 then
                      L28_1 = true
                    end
                    L30_1 = bm
                    L30_1 = L30_1.add_related_string
                    L31_1 = "magic_mismatch"
                    L32_1 = tostring
                    L33_1 = L28_1
                    L32_1 = L32_1(L33_1)
                    L33_1 = bm
                    L33_1 = L33_1.RelatedStringBMReport
                    L30_1(L31_1, L32_1, L33_1)
                    L30_1 = bm
                    L30_1 = L30_1.add_related_string
                    L31_1 = "ransom_extension"
                    L32_1 = L26_1
                    L33_1 = bm
                    L33_1 = L33_1.RelatedStringBMReport
                    L30_1(L31_1, L32_1, L33_1)
                    L30_1 = {}
                    L31_1 = {}
                    L32_1 = bm
                    L32_1 = L32_1.get_imagepath
                    L32_1 = L32_1()
                    L33_1 = isnull
                    L34_1 = L32_1
                    L33_1 = L33_1(L34_1)
                    if L33_1 then
                      L32_1 = "NA"
                    else
                      L34_1 = L32_1
                      L33_1 = L32_1.lower
                      L33_1 = L33_1(L34_1)
                      L32_1 = L33_1
                    end
                    L33_1 = bm
                    L33_1 = L33_1.get_current_process_startup_info
                    L33_1 = L33_1()
                    L34_1 = ""
                    if L33_1 ~= nil then
                      L34_1 = L33_1.command_line
                      L33_1 = L33_1.ppid
                    else
                      L33_1 = -1
                    end
                    L30_1.cur_image_path = L32_1
                    L30_1.proc_info = L33_1
                    L30_1.appended_ext = L26_1
                    L30_1.magic_mismatch = L28_1
                    L30_1.is_double_ext = L15_1
                    L30_1.sig_count = L2_1
                    L35_1 = "FileChain_MainSet:"
                    L36_1 = pairs
                    L37_1 = L3_1[L26_1]
                    L36_1, L37_1, L38_1 = L36_1(L37_1)
                    for L39_1, L40_1 in L36_1, L37_1, L38_1 do
                      L41_1 = sigattr_tail
                      L41_1 = L41_1[L40_1]
                      L41_1 = L41_1.utf8p1
                      L42_1 = string
                      L42_1 = L42_1.find
                      L43_1 = L41_1
                      L44_1 = "\\[^\\]*$"
                      L42_1 = L42_1(L43_1, L44_1)
                      if not L42_1 then
                        L42_1 = 0
                      end
                      L43_1 = string
                      L43_1 = L43_1.find
                      L44_1 = L41_1
                      L45_1 = "."
                      L46_1 = L42_1
                      L47_1 = true
                      L43_1 = L43_1(L44_1, L45_1, L46_1, L47_1)
                      if L43_1 ~= nil then
                        L44_1 = string
                        L44_1 = L44_1.sub
                        L45_1 = L41_1
                        L46_1 = L42_1 + 1
                        L47_1 = L43_1 - 1
                        L44_1 = L44_1(L45_1, L46_1, L47_1)
                        L45_1 = L35_1
                        L46_1 = crypto
                        L46_1 = L46_1.CRC32Buffer
                        L47_1 = -1
                        L48_1 = L44_1
                        L49_1 = 0
                        L50_1 = #L44_1
                        L46_1 = L46_1(L47_1, L48_1, L49_1, L50_1)
                        L35_1 = L45_1 .. L46_1
                        L45_1 = L35_1
                        L46_1 = ";"
                        L47_1 = string
                        L47_1 = L47_1.sub
                        L48_1 = L41_1
                        L49_1 = L43_1 + 1
                        L47_1 = L47_1(L48_1, L49_1)
                        L48_1 = ";"
                        L35_1 = L45_1 .. L46_1 .. L47_1 .. L48_1
                      end
                      L44_1 = sigattr_tail
                      L44_1 = L44_1[L40_1]
                      L41_1 = L44_1.utf8p2
                      L44_1 = string
                      L44_1 = L44_1.find
                      L45_1 = L41_1
                      L46_1 = "\\[^\\]*$"
                      L44_1 = L44_1(L45_1, L46_1)
                      L42_1 = L44_1 or L42_1
                      if not L44_1 then
                        L42_1 = 0
                      end
                      L44_1 = string
                      L44_1 = L44_1.find
                      L45_1 = L41_1
                      L46_1 = "."
                      L47_1 = L42_1
                      L48_1 = true
                      L44_1 = L44_1(L45_1, L46_1, L47_1, L48_1)
                      L43_1 = L44_1
                      if L43_1 ~= nil then
                        L44_1 = string
                        L44_1 = L44_1.sub
                        L45_1 = L41_1
                        L46_1 = L42_1 + 1
                        L47_1 = L43_1 - 1
                        L44_1 = L44_1(L45_1, L46_1, L47_1)
                        L45_1 = L35_1
                        L46_1 = crypto
                        L46_1 = L46_1.CRC32Buffer
                        L47_1 = -1
                        L48_1 = L44_1
                        L49_1 = 0
                        L50_1 = #L44_1
                        L46_1 = L46_1(L47_1, L48_1, L49_1, L50_1)
                        L35_1 = L45_1 .. L46_1
                        L45_1 = L35_1
                        L46_1 = ";"
                        L47_1 = string
                        L47_1 = L47_1.sub
                        L48_1 = L41_1
                        L49_1 = L43_1 + 1
                        L47_1 = L47_1(L48_1, L49_1)
                        L48_1 = ";"
                        L35_1 = L45_1 .. L46_1 .. L47_1 .. L48_1
                      end
                      L44_1 = table
                      L44_1 = L44_1.insert
                      L45_1 = L31_1
                      L46_1 = sigattr_tail
                      L46_1 = L46_1[L40_1]
                      L46_1 = L46_1.utf8p1
                      L44_1(L45_1, L46_1)
                      L44_1 = table
                      L44_1 = L44_1.insert
                      L45_1 = L31_1
                      L46_1 = sigattr_tail
                      L46_1 = L46_1[L40_1]
                      L46_1 = L46_1.utf8p2
                      L44_1(L45_1, L46_1)
                    end
                    L30_1.file_list = L31_1
                    L36_1 = bm
                    L36_1 = L36_1.get_process_relationships
                    L36_1, L37_1 = L36_1()
                    L38_1 = ipairs
                    L39_1 = L36_1
                    L38_1, L39_1, L40_1 = L38_1(L39_1)
                    for L41_1, L42_1 in L38_1, L39_1, L40_1 do
                      L43_1 = L42_1.image_path
                      if L43_1 ~= nil then
                        L43_1 = bm
                        L43_1 = L43_1.add_related_process
                        L44_1 = L42_1.ppid
                        L43_1(L44_1)
                      end
                    end
                    L38_1 = ipairs
                    L39_1 = L37_1
                    L38_1, L39_1, L40_1 = L38_1(L39_1)
                    for L41_1, L42_1 in L38_1, L39_1, L40_1 do
                      L43_1 = L42_1.image_path
                      if L43_1 ~= nil then
                        L43_1 = bm
                        L43_1 = L43_1.add_related_process
                        L44_1 = L42_1.ppid
                        L43_1(L44_1)
                        L43_1 = TrackPidAndTechniqueBM
                        L44_1 = L42_1.ppid
                        L45_1 = "T1485"
                        L46_1 = "susp_ransomware_childproc_type2"
                        L43_1(L44_1, L45_1, L46_1)
                      end
                    end
                    L38_1 = bm
                    L38_1 = L38_1.add_related_string
                    L39_1 = "ransom_files_main"
                    L40_1 = L35_1
                    L41_1 = bm
                    L41_1 = L41_1.RelatedStringBMReport
                    L38_1(L39_1, L40_1, L41_1)
                    L38_1 = safeJsonSerialize
                    L39_1 = L30_1
                    L38_1 = L38_1(L39_1)
                    L39_1 = bm
                    L39_1 = L39_1.add_related_string
                    L40_1 = "genb_ransom_meta"
                    L41_1 = L38_1
                    L42_1 = bm
                    L42_1 = L42_1.RelatedStringBMReport
                    L39_1(L40_1, L41_1, L42_1)
                    L39_1 = bm
                    L39_1 = L39_1.trigger_sig
                    L40_1 = "GenericRansomware:Type2"
                    L41_1 = L38_1
                    L39_1(L40_1, L41_1)
                    L39_1 = bm
                    L39_1 = L39_1.trigger_sig_delayed
                    L40_1 = "DelayedRansom:Type2"
                    L41_1 = L38_1
                    L42_1 = 10000
                    L39_1(L40_1, L41_1, L42_1)
                    L39_1 = sms_untrusted_process
                    L39_1()
                    L39_1 = bm
                    L39_1 = L39_1.add_action
                    L40_1 = "SmsAsyncScanEvent"
                    L41_1 = 100
                    L39_1(L40_1, L41_1)
                    L39_1 = TrackPidAndTechniqueBM
                    L40_1 = L33_1
                    L41_1 = "T1486"
                    L42_1 = "susp_ransomware_type2"
                    L39_1(L40_1, L41_1, L42_1)
                    L39_1 = reportTimingData
                    L39_1()
                    L39_1 = reportSessionInformationInclusive
                    L39_1()
                    L39_1 = pcall
                    L40_1 = reportBmInfo
                    L39_1, L40_1 = L39_1(L40_1)
                    if not L39_1 and L40_1 then
                      L41_1 = bm
                      L41_1 = L41_1.add_related_string
                      L42_1 = "bmInfoFailReason"
                      L43_1 = tostring
                      L44_1 = L40_1
                      L43_1 = L43_1(L44_1)
                      L44_1 = bm
                      L44_1 = L44_1.RelatedStringBMReport
                      L41_1(L42_1, L43_1, L44_1)
                    end
                    if L14_1 == false then
                      L41_1 = #L8_1
                      if 0 < L41_1 and L13_1 ~= nil and L13_1 ~= "" then
                        L41_1 = mp
                        L41_1 = L41_1.GetExtensionClass
                        L42_1 = L26_1
                        L41_1 = L41_1(L42_1)
                        L42_1 = isnull
                        L43_1 = L41_1
                        L42_1 = L42_1(L43_1)
                        if L42_1 then
                          L41_1 = 1000
                        end
                        L42_1 = nil
                        L43_1 = nil
                        L44_1 = MpCommon
                        L44_1 = L44_1.GetBehavioralNetworkBlocksSettings
                        if L44_1 then
                          L44_1 = pcall
                          L45_1 = MpCommon
                          L45_1 = L45_1.GetBehavioralNetworkBlocksSettings
                          L46_1 = MpCommon
                          L46_1 = L46_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
                          L44_1, L45_1 = L44_1(L45_1, L46_1)
                          L43_1 = L45_1
                          L42_1 = L44_1
                        end
                        if not L42_1 or L43_1 == nil then
                          L44_1 = {}
                          L45_1 = MpCommon
                          L45_1 = L45_1.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                          L44_1.State = L45_1
                          L44_1.MaxTimeout = 0
                          L44_1.Exclusions = ""
                          L44_1.AggressiveLevel = 0
                          L43_1 = L44_1
                        end
                        L44_1 = {}
                        L44_1.Extension = L26_1
                        L44_1.ExtensionClass = L41_1
                        L44_1.imagePath = L32_1
                        L44_1.commandLine = L34_1
                        L44_1.ppID = L33_1
                        L44_1.UserName = L11_1
                        L44_1.Domain = L12_1
                        L44_1.file_list = L8_1
                        L44_1.Type = "Type2"
                        L44_1.RemoteEncConfig = L43_1
                        L7_1 = L44_1
                        L44_1 = safeJsonSerialize
                        L45_1 = L7_1
                        L44_1 = L44_1(L45_1)
                        L45_1 = bm
                        L45_1 = L45_1.add_related_string
                        L46_1 = "RemoteClientData"
                        L47_1 = L44_1
                        L48_1 = bm
                        L48_1 = L48_1.RelatedStringBMReport
                        L45_1(L46_1, L47_1, L48_1)
                        L45_1 = bm
                        L45_1 = L45_1.trigger_sig
                        L46_1 = "RemoteGenericRansomware:Type2"
                        L47_1 = L44_1
                        L45_1(L46_1, L47_1)
                        L45_1 = pcall
                        L46_1 = updateSystemDNSServers
                        L45_1, L46_1 = L45_1(L46_1)
                        if not L45_1 then
                          L47_1 = bm
                          L47_1 = L47_1.add_related_string
                          L48_1 = "updateSystemDNSServers_fail"
                          L49_1 = L46_1
                          L50_1 = bm
                          L50_1 = L50_1.RelatedStringBMReport
                          L47_1(L48_1, L49_1, L50_1)
                        end
                        L47_1 = pcall
                        L48_1 = updateDomainInfo
                        L47_1, L48_1, L49_1, L50_1 = L47_1(L48_1)
                        if L47_1 then
                          L51_1 = GetRollingQueueKeyValue
                          L52_1 = "domainInfo"
                          L53_1 = L13_1
                          L51_1 = L51_1(L52_1, L53_1)
                          L7_1.ipTypeFlags = L51_1
                        else
                          L51_1 = bm
                          L51_1 = L51_1.add_related_string
                          L52_1 = "updateDomainInfo_fail"
                          L53_1 = L48_1
                          L54_1 = bm
                          L54_1 = L54_1.RelatedStringBMReport
                          L51_1(L52_1, L53_1, L54_1)
                        end
                        L51_1 = SafeGetUrlReputation
                        L52_1 = {}
                        L53_1 = L13_1
                        L52_1[1] = L53_1
                        L53_1 = {}
                        L53_1.SIG_CONTEXT = "BM"
                        L53_1.CONTEXT_SOURCE = "GenRansom3"
                        L53_1.TAG = "NOLOOKUP"
                        L54_1 = safeJsonSerialize
                        L55_1 = L7_1
                        L54_1 = L54_1(L55_1)
                        L53_1.data = L54_1
                        L54_1 = false
                        L55_1 = 3000
                        L56_1 = false
                        L51_1 = L51_1(L52_1, L53_1, L54_1, L55_1, L56_1)
                        if L51_1 then
                          L52_1 = L51_1.error
                          if L52_1 == 3 then
                            L7_1.CRReportError = "Failed the first attempt"
                            L52_1 = SafeGetUrlReputation
                            L53_1 = {}
                            L54_1 = L13_1
                            L53_1[1] = L54_1
                            L54_1 = {}
                            L54_1.SIG_CONTEXT = "BM"
                            L54_1.CONTEXT_SOURCE = "GenRansom3"
                            L54_1.TAG = "NOLOOKUP"
                            L55_1 = safeJsonSerialize
                            L56_1 = L7_1
                            L55_1 = L55_1(L56_1)
                            L54_1.data = L55_1
                            L55_1 = false
                            L56_1 = 3000
                            L57_1 = false
                            L52_1 = L52_1(L53_1, L54_1, L55_1, L56_1, L57_1)
                            L51_1 = L52_1
                          end
                        end
                        L52_1 = L51_1.urls
                        L52_1 = L52_1[L13_1]
                        if L52_1 then
                          L52_1 = L51_1.urls
                          L52_1 = L52_1[L13_1]
                          L52_1 = L52_1.determination
                          if L52_1 ~= 2 then
                            L52_1 = L51_1.urls
                            L52_1 = L52_1[L13_1]
                            L52_1 = L52_1.determination
                            if L52_1 ~= 1 then
                              goto lbl_794
                            end
                          end
                          L52_1 = L51_1.urls
                          L52_1 = L52_1[L13_1]
                          L52_1 = L52_1.confidence
                          if L52_1 then
                            L52_1 = L51_1.urls
                            L52_1 = L52_1[L13_1]
                            L52_1 = L52_1.confidence
                            if 50 <= L52_1 then
                              L52_1 = L51_1.urls
                              L52_1 = L52_1[L13_1]
                              L52_1 = L52_1.context
                              L52_1 = L52_1.Source
                              if L52_1 == "GenRansom" then
                                L52_1 = L51_1.urls
                                L52_1 = L52_1[L13_1]
                                L52_1 = L52_1.confidence
                                L7_1.confidence = L52_1
                                L52_1 = L51_1.urls
                                L52_1 = L52_1[L13_1]
                                L52_1 = L52_1.context
                                L52_1 = L52_1.Family
                                L7_1.family = L52_1
                                L52_1 = L51_1.urls
                                L52_1 = L52_1[L13_1]
                                L52_1 = L52_1.determination
                                L7_1.determination = L52_1
                                L52_1 = {}
                                L53_1 = L51_1.urls
                                L53_1 = L53_1[L13_1]
                                L53_1 = L53_1.context
                                L53_1 = L53_1.action
                                L52_1.action = L53_1
                                L53_1 = L51_1.urls
                                L53_1 = L53_1[L13_1]
                                L53_1 = L53_1.context
                                L53_1 = L53_1.action_parameter
                                L52_1.parameter = L53_1
                                L53_1 = L51_1.urls
                                L53_1 = L53_1[L13_1]
                                L53_1 = L53_1.context
                                L53_1 = L53_1.action_ttl
                                L52_1.ttl = L53_1
                                L7_1.action = L52_1
                                L53_1 = L51_1.urls
                                L53_1 = L53_1[L13_1]
                                L53_1 = L53_1.context
                                L7_1.context = L53_1
                                L7_1.ip = L13_1
                                L7_1.unscrubbed_username = L9_1
                                L7_1.unscrubbed_domain = L10_1
                                L53_1 = bm
                                L53_1 = L53_1.trigger_sig
                                L54_1 = "RemoteGenericRansomware:Malware"
                                L55_1 = safeJsonSerialize
                                L56_1 = L7_1
                                L55_1, L56_1, L57_1 = L55_1(L56_1)
                                L53_1(L54_1, L55_1, L56_1, L57_1)
                              end
                            end
                          end
                        end
                      end
                    end
                    ::lbl_794::
                    L41_1 = bm
                    L41_1 = L41_1.add_related_string
                    L42_1 = "sigcount_type2"
                    L43_1 = L2_1
                    L44_1 = bm
                    L44_1 = L44_1.RelatedStringBMReport
                    L41_1(L42_1, L43_1, L44_1)
                    L41_1 = mp
                    L41_1 = L41_1.INFECTED
                    return L41_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_804::
end
L16_1 = mp
L16_1 = L16_1.CLEAN
return L16_1
