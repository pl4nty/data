local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1
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
        goto lbl_798
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
                  L28_1 = {}
                  L29_1 = pairs
                  L30_1 = L3_1
                  L29_1, L30_1, L31_1 = L29_1(L30_1)
                  for L32_1, L33_1 in L29_1, L30_1, L31_1 do
                    L34_1 = table
                    L34_1 = L34_1.insert
                    L35_1 = L28_1
                    L36_1 = L32_1
                    L34_1(L35_1, L36_1)
                  end
                  L29_1 = #L28_1
                  if 5 <= L29_1 then
                    L29_1 = false
                    L30_1 = {}
                    L30_1.count = 0
                    L31_1 = ipairs
                    L32_1 = L28_1
                    L31_1, L32_1, L33_1 = L31_1(L32_1)
                    for L34_1, L35_1 in L31_1, L32_1, L33_1 do
                      L36_1 = pairs
                      L37_1 = L3_1[L35_1]
                      L36_1, L37_1, L38_1 = L36_1(L37_1)
                      for L39_1, L40_1 in L36_1, L37_1, L38_1 do
                        L41_1 = sysio
                        L41_1 = L41_1.GetFileSize
                        L42_1 = sigattr_tail
                        L42_1 = L42_1[L40_1]
                        L42_1 = L42_1.utf8p1
                        L41_1 = L41_1(L42_1)
                        L42_1 = sysio
                        L42_1 = L42_1.ReadFile
                        L43_1 = sigattr_tail
                        L43_1 = L43_1[L40_1]
                        L43_1 = L43_1.utf8p1
                        L44_1 = 0
                        L45_1 = 4
                        L42_1 = L42_1(L43_1, L44_1, L45_1)
                        if L42_1 ~= nil then
                          L43_1 = L30_1[L42_1]
                          if L43_1 == nil then
                            L30_1[L42_1] = 1
                            L43_1 = L30_1.count
                            L43_1 = L43_1 + 1
                            L30_1.count = L43_1
                          end
                        end
                        L43_1 = L6_1[L40_1]
                        if L43_1 ~= nil and L14_1 == false then
                          L43_1 = sigattr_tail
                          L44_1 = L6_1[L40_1]
                          L43_1 = L43_1[L44_1]
                          L43_1 = L43_1.utf8p2
                          L44_1 = #L43_1
                          if 136 < L44_1 then
                            L44_1 = string
                            L44_1 = L44_1.find
                            L45_1 = L43_1
                            L46_1 = "RemoteIp"
                            L47_1 = 100
                            L48_1 = true
                            L44_1 = L44_1(L45_1, L46_1, L47_1, L48_1)
                            if L44_1 ~= nil then
                              L45_1 = #L43_1
                              L45_1 = L45_1 - L44_1
                              if 20 < L45_1 then
                                L45_1 = {}
                                L46_1 = string
                                L46_1 = L46_1.gmatch
                                L47_1 = L43_1
                                L48_1 = "(%w+):([^;]+)"
                                L46_1, L47_1, L48_1 = L46_1(L47_1, L48_1)
                                for L49_1, L50_1 in L46_1, L47_1, L48_1 do
                                  L45_1[L49_1] = L50_1
                                end
                                L46_1 = L45_1.UsrName
                                if L46_1 ~= nil then
                                  L46_1 = L45_1.Domain
                                  if L46_1 ~= nil then
                                    L46_1 = L45_1.RemoteIp
                                    if L46_1 ~= nil then
                                      L9_1 = L45_1.UsrName
                                      L10_1 = L45_1.Domain
                                      L46_1 = scrubData
                                      L47_1 = L45_1.UsrName
                                      L46_1 = L46_1(L47_1)
                                      L11_1 = L46_1
                                      L46_1 = scrubData
                                      L47_1 = L45_1.Domain
                                      L46_1 = L46_1(L47_1)
                                      L12_1 = L46_1
                                      L46_1 = string
                                      L46_1 = L46_1.match
                                      L47_1 = L45_1.RemoteIp
                                      L48_1 = "(.*):(.*)"
                                      L46_1 = L46_1(L47_1, L48_1)
                                      L47_1 = "NA"
                                      if L42_1 ~= nil then
                                        L48_1 = string
                                        L48_1 = L48_1.format
                                        L49_1 = "0x%02X%02X%02X%02X"
                                        L50_1 = string
                                        L50_1 = L50_1.byte
                                        L51_1 = L42_1
                                        L52_1 = 1
                                        L53_1 = 4
                                        L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1 = L50_1(L51_1, L52_1, L53_1)
                                        L48_1 = L48_1(L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1)
                                        L47_1 = L48_1
                                      end
                                      if L46_1 ~= nil and (L13_1 == "" or L13_1 == L46_1) then
                                        L48_1 = table
                                        L48_1 = L48_1.insert
                                        L49_1 = L8_1
                                        L50_1 = {}
                                        L51_1 = sigattr_tail
                                        L51_1 = L51_1[L40_1]
                                        L51_1 = L51_1.utf8p1
                                        L50_1.path = L51_1
                                        L50_1.magic = L47_1
                                        L50_1.fileSize = L41_1
                                        L48_1(L49_1, L50_1)
                                        L13_1 = L46_1
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
                    L33_1 = safeJsonSerialize
                    L34_1 = L28_1
                    L33_1 = L33_1(L34_1)
                    L34_1 = bm
                    L34_1 = L34_1.RelatedStringBMReport
                    L31_1(L32_1, L33_1, L34_1)
                    L31_1 = {}
                    L32_1 = {}
                    L33_1 = bm
                    L33_1 = L33_1.get_imagepath
                    L33_1 = L33_1()
                    L34_1 = L33_1
                    L33_1 = L33_1.lower
                    L33_1 = L33_1(L34_1)
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
                    L31_1.appended_ext = L28_1
                    L31_1.magic_mismatch = L29_1
                    L31_1.is_double_ext = L15_1
                    L36_1 = "FileChain_MainSet:"
                    L37_1 = ipairs
                    L38_1 = L28_1
                    L37_1, L38_1, L39_1 = L37_1(L38_1)
                    for L40_1, L41_1 in L37_1, L38_1, L39_1 do
                      L42_1 = pairs
                      L43_1 = L3_1[L41_1]
                      L42_1, L43_1, L44_1 = L42_1(L43_1)
                      for L45_1, L46_1 in L42_1, L43_1, L44_1 do
                        L47_1 = sigattr_tail
                        L47_1 = L47_1[L46_1]
                        L47_1 = L47_1.utf8p1
                        L48_1 = string
                        L48_1 = L48_1.find
                        L49_1 = L47_1
                        L50_1 = "\\[^\\]*$"
                        L48_1 = L48_1(L49_1, L50_1)
                        if not L48_1 then
                          L48_1 = 0
                        end
                        L49_1 = string
                        L49_1 = L49_1.find
                        L50_1 = L47_1
                        L51_1 = "."
                        L52_1 = L48_1
                        L53_1 = true
                        L49_1 = L49_1(L50_1, L51_1, L52_1, L53_1)
                        if L49_1 ~= nil then
                          L50_1 = string
                          L50_1 = L50_1.sub
                          L51_1 = L47_1
                          L52_1 = L48_1 + 1
                          L53_1 = L49_1 - 1
                          L50_1 = L50_1(L51_1, L52_1, L53_1)
                          L51_1 = L36_1
                          L52_1 = crypto
                          L52_1 = L52_1.CRC32Buffer
                          L53_1 = -1
                          L54_1 = L50_1
                          L55_1 = 0
                          L56_1 = #L50_1
                          L52_1 = L52_1(L53_1, L54_1, L55_1, L56_1)
                          L36_1 = L51_1 .. L52_1
                          L51_1 = L36_1
                          L52_1 = ";"
                          L53_1 = string
                          L53_1 = L53_1.sub
                          L54_1 = L47_1
                          L55_1 = L49_1 + 1
                          L53_1 = L53_1(L54_1, L55_1)
                          L54_1 = ";"
                          L36_1 = L51_1 .. L52_1 .. L53_1 .. L54_1
                        end
                        L50_1 = sigattr_tail
                        L50_1 = L50_1[L46_1]
                        L47_1 = L50_1.utf8p2
                        L50_1 = string
                        L50_1 = L50_1.find
                        L51_1 = L47_1
                        L52_1 = "\\[^\\]*$"
                        L50_1 = L50_1(L51_1, L52_1)
                        L48_1 = L50_1 or L48_1
                        if not L50_1 then
                          L48_1 = 0
                        end
                        L50_1 = string
                        L50_1 = L50_1.find
                        L51_1 = L47_1
                        L52_1 = "."
                        L53_1 = L48_1
                        L54_1 = true
                        L50_1 = L50_1(L51_1, L52_1, L53_1, L54_1)
                        L49_1 = L50_1
                        if L49_1 ~= nil then
                          L50_1 = string
                          L50_1 = L50_1.sub
                          L51_1 = L47_1
                          L52_1 = L48_1 + 1
                          L53_1 = L49_1 - 1
                          L50_1 = L50_1(L51_1, L52_1, L53_1)
                          L51_1 = L36_1
                          L52_1 = crypto
                          L52_1 = L52_1.CRC32Buffer
                          L53_1 = -1
                          L54_1 = L50_1
                          L55_1 = 0
                          L56_1 = #L50_1
                          L52_1 = L52_1(L53_1, L54_1, L55_1, L56_1)
                          L36_1 = L51_1 .. L52_1
                          L51_1 = L36_1
                          L52_1 = ";"
                          L53_1 = string
                          L53_1 = L53_1.sub
                          L54_1 = L47_1
                          L55_1 = L49_1 + 1
                          L53_1 = L53_1(L54_1, L55_1)
                          L54_1 = ";"
                          L36_1 = L51_1 .. L52_1 .. L53_1 .. L54_1
                        end
                        L50_1 = table
                        L50_1 = L50_1.insert
                        L51_1 = L32_1
                        L52_1 = sigattr_tail
                        L52_1 = L52_1[L46_1]
                        L52_1 = L52_1.utf8p1
                        L50_1(L51_1, L52_1)
                        L50_1 = table
                        L50_1 = L50_1.insert
                        L51_1 = L32_1
                        L52_1 = sigattr_tail
                        L52_1 = L52_1[L46_1]
                        L52_1 = L52_1.utf8p2
                        L50_1(L51_1, L52_1)
                      end
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
                        L44_1 = TrackPidAndTechniqueBM
                        L45_1 = L43_1.ppid
                        L46_1 = "T1485"
                        L47_1 = "susp_ransomware_childproc_type2"
                        L44_1(L45_1, L46_1, L47_1)
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
                    L40_1 = bm
                    L40_1 = L40_1.trigger_sig
                    L41_1 = "GenericRansomware:Type2_multi_ext"
                    L42_1 = L39_1
                    L40_1(L41_1, L42_1)
                    L40_1 = sms_untrusted_process
                    L40_1()
                    L40_1 = bm
                    L40_1 = L40_1.add_action
                    L41_1 = "SmsAsyncScanEvent"
                    L42_1 = 100
                    L40_1(L41_1, L42_1)
                    L40_1 = TrackPidAndTechniqueBM
                    L41_1 = L34_1
                    L42_1 = "T1486"
                    L43_1 = "susp_ransomware_type2"
                    L40_1(L41_1, L42_1, L43_1)
                    L40_1 = reportTimingData
                    L40_1()
                    L40_1 = reportSessionInformationInclusive
                    L40_1()
                    if L14_1 == false then
                      L40_1 = #L8_1
                      if 0 < L40_1 and L13_1 ~= nil and L13_1 ~= "" then
                        L40_1 = mp
                        L40_1 = L40_1.GetExtensionClass
                        L41_1 = L26_1
                        L40_1 = L40_1(L41_1)
                        L41_1 = isnull
                        L42_1 = L40_1
                        L41_1 = L41_1(L42_1)
                        if L41_1 then
                          L40_1 = 1000
                        end
                        L41_1 = nil
                        L42_1 = nil
                        L43_1 = MpCommon
                        L43_1 = L43_1.GetBehavioralNetworkBlocksSettings
                        if L43_1 then
                          L43_1 = pcall
                          L44_1 = MpCommon
                          L44_1 = L44_1.GetBehavioralNetworkBlocksSettings
                          L45_1 = MpCommon
                          L45_1 = L45_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
                          L43_1, L44_1 = L43_1(L44_1, L45_1)
                          L42_1 = L44_1
                          L41_1 = L43_1
                        end
                        if not L41_1 or L42_1 == nil then
                          L43_1 = {}
                          L44_1 = MpCommon
                          L44_1 = L44_1.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                          L43_1.State = L44_1
                          L43_1.MaxTimeout = 0
                          L43_1.Exclusions = ""
                          L43_1.AggressiveLevel = 0
                          L42_1 = L43_1
                        end
                        L43_1 = {}
                        L43_1.Extension = L26_1
                        L43_1.ExtensionClass = L40_1
                        L43_1.imagePath = L33_1
                        L43_1.commandLine = L35_1
                        L43_1.ppID = L34_1
                        L43_1.UserName = L11_1
                        L43_1.Domain = L12_1
                        L43_1.file_list = L8_1
                        L43_1.Type = "Type2.1"
                        L43_1.RemoteEncConfig = L42_1
                        L7_1 = L43_1
                        L43_1 = safeJsonSerialize
                        L44_1 = L7_1
                        L43_1 = L43_1(L44_1)
                        L44_1 = bm
                        L44_1 = L44_1.add_related_string
                        L45_1 = "RemoteClientData"
                        L46_1 = L43_1
                        L47_1 = bm
                        L47_1 = L47_1.RelatedStringBMReport
                        L44_1(L45_1, L46_1, L47_1)
                        L44_1 = bm
                        L44_1 = L44_1.trigger_sig
                        L45_1 = "RemoteGenericRansomware:Type2_multi_ext"
                        L46_1 = L43_1
                        L44_1(L45_1, L46_1)
                        L44_1 = pcall
                        L45_1 = updateSystemDNSServers
                        L44_1, L45_1 = L44_1(L45_1)
                        if not L44_1 then
                          L46_1 = bm
                          L46_1 = L46_1.add_related_string
                          L47_1 = "updateSystemDNSServers_fail"
                          L48_1 = L45_1
                          L49_1 = bm
                          L49_1 = L49_1.RelatedStringBMReport
                          L46_1(L47_1, L48_1, L49_1)
                        end
                        L46_1 = pcall
                        L47_1 = updateDomainInfo
                        L46_1, L47_1, L48_1, L49_1 = L46_1(L47_1)
                        if L46_1 then
                          L50_1 = GetRollingQueueKeyValue
                          L51_1 = "domainInfo"
                          L52_1 = L13_1
                          L50_1 = L50_1(L51_1, L52_1)
                          L7_1.ipTypeFlags = L50_1
                        else
                          L50_1 = bm
                          L50_1 = L50_1.add_related_string
                          L51_1 = "updateDomainInfo_fail"
                          L52_1 = L47_1
                          L53_1 = bm
                          L53_1 = L53_1.RelatedStringBMReport
                          L50_1(L51_1, L52_1, L53_1)
                        end
                        L50_1 = SafeGetUrlReputation
                        L51_1 = {}
                        L52_1 = L13_1
                        L51_1[1] = L52_1
                        L52_1 = {}
                        L52_1.SIG_CONTEXT = "BM"
                        L52_1.CONTEXT_SOURCE = "GenRansom3"
                        L52_1.TAG = "NOLOOKUP"
                        L53_1 = safeJsonSerialize
                        L54_1 = L7_1
                        L53_1 = L53_1(L54_1)
                        L52_1.data = L53_1
                        L53_1 = false
                        L54_1 = 3000
                        L55_1 = false
                        L50_1 = L50_1(L51_1, L52_1, L53_1, L54_1, L55_1)
                        if L50_1 then
                          L51_1 = L50_1.error
                          if L51_1 == 3 then
                            L7_1.CRReportError = "Failed the first attempt"
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
                            L50_1 = L51_1
                          end
                        end
                        L51_1 = L50_1.urls
                        L51_1 = L51_1[L13_1]
                        if L51_1 then
                          L51_1 = L50_1.urls
                          L51_1 = L51_1[L13_1]
                          L51_1 = L51_1.determination
                          if L51_1 ~= 2 then
                            L51_1 = L50_1.urls
                            L51_1 = L51_1[L13_1]
                            L51_1 = L51_1.determination
                            if L51_1 ~= 1 then
                              goto lbl_788
                            end
                          end
                          L51_1 = L50_1.urls
                          L51_1 = L51_1[L13_1]
                          L51_1 = L51_1.confidence
                          if L51_1 then
                            L51_1 = L50_1.urls
                            L51_1 = L51_1[L13_1]
                            L51_1 = L51_1.confidence
                            if 50 <= L51_1 then
                              L51_1 = L50_1.urls
                              L51_1 = L51_1[L13_1]
                              L51_1 = L51_1.context
                              L51_1 = L51_1.Source
                              if L51_1 == "GenRansom" then
                                L51_1 = L50_1.urls
                                L51_1 = L51_1[L13_1]
                                L51_1 = L51_1.confidence
                                L7_1.confidence = L51_1
                                L51_1 = L50_1.urls
                                L51_1 = L51_1[L13_1]
                                L51_1 = L51_1.context
                                L51_1 = L51_1.Family
                                L7_1.family = L51_1
                                L51_1 = L50_1.urls
                                L51_1 = L51_1[L13_1]
                                L51_1 = L51_1.determination
                                L7_1.determination = L51_1
                                L51_1 = {}
                                L52_1 = L50_1.urls
                                L52_1 = L52_1[L13_1]
                                L52_1 = L52_1.context
                                L52_1 = L52_1.action
                                L51_1.action = L52_1
                                L52_1 = L50_1.urls
                                L52_1 = L52_1[L13_1]
                                L52_1 = L52_1.context
                                L52_1 = L52_1.action_parameter
                                L51_1.parameter = L52_1
                                L52_1 = L50_1.urls
                                L52_1 = L52_1[L13_1]
                                L52_1 = L52_1.context
                                L52_1 = L52_1.action_ttl
                                L51_1.ttl = L52_1
                                L7_1.action = L51_1
                                L7_1.ip = L13_1
                                L52_1 = L50_1.urls
                                L52_1 = L52_1[L13_1]
                                L52_1 = L52_1.context
                                L7_1.context = L52_1
                                L7_1.unscrubbed_username = L9_1
                                L7_1.unscrubbed_domain = L10_1
                                L52_1 = bm
                                L52_1 = L52_1.trigger_sig
                                L53_1 = "RemoteGenericRansomware:Malware"
                                L54_1 = safeJsonSerialize
                                L55_1 = L7_1
                                L54_1, L55_1, L56_1 = L54_1(L55_1)
                                L52_1(L53_1, L54_1, L55_1, L56_1)
                              end
                            end
                          end
                        end
                      end
                    end
                    ::lbl_788::
                    L40_1 = bm
                    L40_1 = L40_1.add_related_string
                    L41_1 = "sigcount_type2_multi_ext"
                    L42_1 = L2_1
                    L43_1 = bm
                    L43_1 = L43_1.RelatedStringBMReport
                    L40_1(L41_1, L42_1, L43_1)
                    L40_1 = mp
                    L40_1 = L40_1.INFECTED
                    return L40_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_798::
end
L16_1 = mp
L16_1 = L16_1.CLEAN
return L16_1
