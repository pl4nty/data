local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1
L0_1 = 16385
L1_1 = 16386
L2_1 = mp
L2_1 = L2_1.SIGATTR_LOG_SZ
L3_1 = {}
L4_1 = bm
L4_1 = L4_1.get_sig_count
L4_1 = L4_1()
L5_1 = 1
L6_1 = L2_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.attribute
  if L9_1 == L0_1 then
    L9_1 = sigattr_tail
    L9_1 = L9_1[L8_1]
    L9_1 = L9_1.utf8p1
    L10_1 = L9_1
    L9_1 = L9_1.lower
    L9_1 = L9_1(L10_1)
    L10_1 = mp
    L10_1 = L10_1.crc32
    L11_1 = 0
    L12_1 = L9_1
    L13_1 = 1
    L14_1 = #L9_1
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    L3_1[L10_1] = L8_1
  end
end
L5_1 = {}
L6_1 = {}
L7_1 = {}
L8_1 = {}
L9_1 = {}
L10_1 = {}
L11_1 = nil
L12_1 = nil
L13_1 = nil
L14_1 = nil
L15_1 = ""
L16_1 = false
L17_1 = false
L18_1 = 1
L19_1 = L2_1
L20_1 = 1
for L21_1 = L18_1, L19_1, L20_1 do
  L22_1 = sigattr_tail
  L22_1 = L22_1[L21_1]
  L22_1 = L22_1.attribute
  if L22_1 == L1_1 then
    L22_1 = sigattr_tail
    L22_1 = L22_1[L21_1]
    L22_1 = L22_1.utf8p2
    L23_1 = L22_1
    L22_1 = L22_1.lower
    L22_1 = L22_1(L23_1)
    L23_1 = sigattr_tail
    L23_1 = L23_1[L21_1]
    L23_1 = L23_1.utf8p1
    L24_1 = L23_1
    L23_1 = L23_1.lower
    L23_1 = L23_1(L24_1)
    L24_1 = mp
    L24_1 = L24_1.crc32
    L25_1 = 0
    L26_1 = L22_1
    L27_1 = 1
    L28_1 = #L22_1
    L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1)
    L25_1 = mp
    L25_1 = L25_1.crc32
    L26_1 = 0
    L27_1 = L23_1
    L28_1 = 1
    L29_1 = #L23_1
    L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
    L26_1 = L3_1[L25_1]
    if L26_1 == nil then
      L26_1 = L3_1[L24_1]
      if L26_1 == nil then
        goto lbl_758
      end
    end
    L26_1 = L6_1[L24_1]
    if L26_1 == nil then
      L27_1 = L22_1
      L26_1 = L22_1.match
      L28_1 = "%.[^%.]+$"
      L26_1 = L26_1(L27_1, L28_1)
      if L26_1 ~= nil then
        L27_1 = mp
        L27_1 = L27_1.bitand
        L28_1 = mp
        L28_1 = L28_1.GetExtensionClass
        L29_1 = L26_1
        L28_1 = L28_1(L29_1)
        L29_1 = 3
        L27_1 = L27_1(L28_1, L29_1)
        if L27_1 ~= 0 then
          L27_1 = string
          L27_1 = L27_1.match
          L28_1 = L22_1
          L29_1 = "(.-)([^\\]-([^\\%.]+))$"
          L27_1, L28_1, L29_1 = L27_1(L28_1, L29_1)
          L30_1 = "."
          L31_1 = L29_1
          L29_1 = L30_1 .. L31_1
          L30_1 = string
          L30_1 = L30_1.match
          L31_1 = L23_1
          L32_1 = "(.-)([^\\]-([^\\%.]+))$"
          L30_1, L31_1, L32_1 = L30_1(L31_1, L32_1)
          L33_1 = "."
          L34_1 = L32_1
          L32_1 = L33_1 .. L34_1
          L33_1 = 0
          if L27_1 == L30_1 then
            L35_1 = L28_1
            L34_1 = L28_1.find
            L36_1 = L31_1
            L37_1 = 1
            L38_1 = true
            L34_1 = L34_1(L35_1, L36_1, L37_1, L38_1)
            if L34_1 ~= 1 then
              L35_1 = L31_1
              L34_1 = L31_1.find
              L36_1 = L28_1
              L37_1 = 1
              L38_1 = true
              L34_1 = L34_1(L35_1, L36_1, L37_1, L38_1)
              if L34_1 ~= 1 then
                L6_1[L24_1] = 1
                L34_1 = mp
                L34_1 = L34_1.GetExtensionClass
                L35_1 = L32_1
                L34_1 = L34_1(L35_1)
                if L34_1 ~= 4 then
                  L34_1 = L3_1[L25_1]
                  if L34_1 ~= nil then
                    L34_1 = L3_1[L25_1]
                    L8_1[L21_1] = L34_1
                  else
                    L34_1 = L3_1[L24_1]
                    if L34_1 ~= nil then
                      L34_1 = L3_1[L24_1]
                      L8_1[L21_1] = L34_1
                    end
                  end
                  L34_1 = L5_1[L32_1]
                  if L34_1 ~= nil then
                    L34_1 = table
                    L34_1 = L34_1.insert
                    L35_1 = L5_1[L32_1]
                    L36_1 = L21_1
                    L34_1(L35_1, L36_1)
                  else
                    L34_1 = {}
                    L35_1 = L21_1
                    L34_1[1] = L35_1
                    L5_1[L32_1] = L34_1
                  end
                  L34_1 = L7_1[L30_1]
                  if L34_1 ~= nil then
                    L34_1 = table
                    L34_1 = L34_1.insert
                    L35_1 = L7_1[L30_1]
                    L36_1 = L21_1
                    L34_1(L35_1, L36_1)
                  else
                    L34_1 = {}
                    L35_1 = L21_1
                    L34_1[1] = L35_1
                    L7_1[L30_1] = L34_1
                    L33_1 = L33_1 + 1
                  end
                  L34_1 = L5_1[L32_1]
                  L34_1 = #L34_1
                  if 5 <= L34_1 or 20 <= L33_1 then
                    L34_1 = false
                    L35_1 = {}
                    L35_1.count = 0
                    L36_1 = pairs
                    L37_1 = L5_1[L32_1]
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
                        L43_1 = L35_1[L42_1]
                        if L43_1 == nil then
                          L35_1[L42_1] = 1
                          L43_1 = L35_1.count
                          L43_1 = L43_1 + 1
                          L35_1.count = L43_1
                        end
                      end
                      L43_1 = L8_1[L40_1]
                      if L43_1 ~= nil and L16_1 == false then
                        L43_1 = sigattr_tail
                        L44_1 = L8_1[L40_1]
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
                                    L11_1 = L45_1.UsrName
                                    L12_1 = L45_1.Domain
                                    L46_1 = scrubData
                                    L47_1 = L45_1.UsrName
                                    L46_1 = L46_1(L47_1)
                                    L13_1 = L46_1
                                    L46_1 = scrubData
                                    L47_1 = L45_1.Domain
                                    L46_1 = L46_1(L47_1)
                                    L14_1 = L46_1
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
                                      L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1 = L50_1(L51_1, L52_1, L53_1)
                                      L48_1 = L48_1(L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1)
                                      L47_1 = L48_1
                                    end
                                    if L46_1 ~= nil and (L15_1 == "" or L15_1 == L46_1) then
                                      L48_1 = table
                                      L48_1 = L48_1.insert
                                      L49_1 = L10_1
                                      L50_1 = {}
                                      L51_1 = sigattr_tail
                                      L51_1 = L51_1[L40_1]
                                      L51_1 = L51_1.utf8p1
                                      L50_1.path = L51_1
                                      L50_1.magic = L47_1
                                      L50_1.fileSize = L41_1
                                      L48_1(L49_1, L50_1)
                                      L15_1 = L46_1
                                    else
                                      L16_1 = true
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    L36_1 = L35_1.count
                    if 4 < L36_1 then
                      L34_1 = true
                    end
                    L36_1 = bm
                    L36_1 = L36_1.add_related_string
                    L37_1 = "magic_mismatch"
                    L38_1 = tostring
                    L39_1 = L34_1
                    L38_1 = L38_1(L39_1)
                    L39_1 = bm
                    L39_1 = L39_1.RelatedStringBMReport
                    L36_1(L37_1, L38_1, L39_1)
                    L36_1 = bm
                    L36_1 = L36_1.add_related_string
                    L37_1 = "ransom_extension"
                    L38_1 = L32_1
                    L39_1 = bm
                    L39_1 = L39_1.RelatedStringBMReport
                    L36_1(L37_1, L38_1, L39_1)
                    L36_1 = {}
                    L37_1 = {}
                    L38_1 = bm
                    L38_1 = L38_1.get_imagepath
                    L38_1 = L38_1()
                    L39_1 = L38_1
                    L38_1 = L38_1.lower
                    L38_1 = L38_1(L39_1)
                    L39_1 = bm
                    L39_1 = L39_1.get_current_process_startup_info
                    L39_1 = L39_1()
                    L40_1 = ""
                    if L39_1 ~= nil then
                      L40_1 = L39_1.command_line
                      L39_1 = L39_1.ppid
                    else
                      L39_1 = -1
                    end
                    L36_1.cur_image_path = L38_1
                    L36_1.proc_info = L39_1
                    L36_1.modd_ext = L32_1
                    L36_1.magic_mismatch = L34_1
                    L36_1.is_double_ext = L17_1
                    L36_1.dir_count = L33_1
                    L41_1 = "FileChain_MainSet:"
                    L42_1 = pairs
                    L43_1 = L5_1[L32_1]
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
                        L51_1 = L41_1
                        L52_1 = crypto
                        L52_1 = L52_1.CRC32Buffer
                        L53_1 = -1
                        L54_1 = L50_1
                        L55_1 = 0
                        L56_1 = #L50_1
                        L52_1 = L52_1(L53_1, L54_1, L55_1, L56_1)
                        L41_1 = L51_1 .. L52_1
                        L51_1 = L41_1
                        L52_1 = ";"
                        L53_1 = string
                        L53_1 = L53_1.sub
                        L54_1 = L47_1
                        L55_1 = L49_1 + 1
                        L53_1 = L53_1(L54_1, L55_1)
                        L54_1 = ";"
                        L41_1 = L51_1 .. L52_1 .. L53_1 .. L54_1
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
                        L51_1 = L41_1
                        L52_1 = crypto
                        L52_1 = L52_1.CRC32Buffer
                        L53_1 = -1
                        L54_1 = L50_1
                        L55_1 = 0
                        L56_1 = #L50_1
                        L52_1 = L52_1(L53_1, L54_1, L55_1, L56_1)
                        L41_1 = L51_1 .. L52_1
                        L51_1 = L41_1
                        L52_1 = ";"
                        L53_1 = string
                        L53_1 = L53_1.sub
                        L54_1 = L47_1
                        L55_1 = L49_1 + 1
                        L53_1 = L53_1(L54_1, L55_1)
                        L54_1 = ";"
                        L41_1 = L51_1 .. L52_1 .. L53_1 .. L54_1
                      end
                      L50_1 = table
                      L50_1 = L50_1.insert
                      L51_1 = L37_1
                      L52_1 = sigattr_tail
                      L52_1 = L52_1[L46_1]
                      L52_1 = L52_1.utf8p1
                      L50_1(L51_1, L52_1)
                      L50_1 = table
                      L50_1 = L50_1.insert
                      L51_1 = L37_1
                      L52_1 = sigattr_tail
                      L52_1 = L52_1[L46_1]
                      L52_1 = L52_1.utf8p2
                      L50_1(L51_1, L52_1)
                    end
                    L36_1.file_list = L37_1
                    L42_1 = bm
                    L42_1 = L42_1.get_process_relationships
                    L42_1, L43_1 = L42_1()
                    L44_1 = ipairs
                    L45_1 = L42_1
                    L44_1, L45_1, L46_1 = L44_1(L45_1)
                    for L47_1, L48_1 in L44_1, L45_1, L46_1 do
                      L49_1 = L48_1.image_path
                      if L49_1 ~= nil then
                        L49_1 = bm
                        L49_1 = L49_1.add_related_process
                        L50_1 = L48_1.ppid
                        L49_1(L50_1)
                      end
                    end
                    L44_1 = ipairs
                    L45_1 = L43_1
                    L44_1, L45_1, L46_1 = L44_1(L45_1)
                    for L47_1, L48_1 in L44_1, L45_1, L46_1 do
                      L49_1 = L48_1.image_path
                      if L49_1 ~= nil then
                        L49_1 = bm
                        L49_1 = L49_1.add_related_process
                        L50_1 = L48_1.ppid
                        L49_1(L50_1)
                        L49_1 = TrackPidAndTechniqueBM
                        L50_1 = L48_1.ppid
                        L51_1 = "T1485"
                        L52_1 = "susp_ransomware_childproc_type2"
                        L49_1(L50_1, L51_1, L52_1)
                      end
                    end
                    L44_1 = bm
                    L44_1 = L44_1.add_related_string
                    L45_1 = "ransom_files_main"
                    L46_1 = L41_1
                    L47_1 = bm
                    L47_1 = L47_1.RelatedStringBMReport
                    L44_1(L45_1, L46_1, L47_1)
                    L44_1 = safeJsonSerialize
                    L45_1 = L36_1
                    L44_1 = L44_1(L45_1)
                    L45_1 = bm
                    L45_1 = L45_1.add_related_string
                    L46_1 = "genb_ransom_meta"
                    L47_1 = L44_1
                    L48_1 = bm
                    L48_1 = L48_1.RelatedStringBMReport
                    L45_1(L46_1, L47_1, L48_1)
                    L45_1 = bm
                    L45_1 = L45_1.trigger_sig
                    L46_1 = "GenericRansomware:Type2.2"
                    L47_1 = L44_1
                    L45_1(L46_1, L47_1)
                    L45_1 = sms_untrusted_process
                    L45_1()
                    L45_1 = bm
                    L45_1 = L45_1.add_action
                    L46_1 = "SmsAsyncScanEvent"
                    L47_1 = 100
                    L45_1(L46_1, L47_1)
                    L45_1 = TrackPidAndTechniqueBM
                    L46_1 = L39_1
                    L47_1 = "T1486"
                    L48_1 = "susp_ransomware_type2"
                    L45_1(L46_1, L47_1, L48_1)
                    L45_1 = reportTimingData
                    L45_1()
                    L45_1 = reportSessionInformationInclusive
                    L45_1()
                    if L16_1 == false then
                      L45_1 = #L10_1
                      if 0 < L45_1 and L15_1 ~= nil and L15_1 ~= "" then
                        L45_1 = mp
                        L45_1 = L45_1.GetExtensionClass
                        L46_1 = L32_1
                        L45_1 = L45_1(L46_1)
                        L46_1 = isnull
                        L47_1 = L45_1
                        L46_1 = L46_1(L47_1)
                        if L46_1 then
                          L45_1 = 1000
                        end
                        L46_1 = nil
                        L47_1 = nil
                        L48_1 = MpCommon
                        L48_1 = L48_1.GetBehavioralNetworkBlocksSettings
                        if L48_1 then
                          L48_1 = pcall
                          L49_1 = MpCommon
                          L49_1 = L49_1.GetBehavioralNetworkBlocksSettings
                          L50_1 = MpCommon
                          L50_1 = L50_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
                          L48_1, L49_1 = L48_1(L49_1, L50_1)
                          L47_1 = L49_1
                          L46_1 = L48_1
                        end
                        if not L46_1 or L47_1 == nil then
                          L48_1 = {}
                          L49_1 = MpCommon
                          L49_1 = L49_1.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                          L48_1.State = L49_1
                          L48_1.MaxTimeout = 0
                          L48_1.Exclusions = ""
                          L48_1.AggressiveLevel = 0
                          L47_1 = L48_1
                        end
                        L48_1 = {}
                        L48_1.Extension = L32_1
                        L48_1.ExtensionClass = L45_1
                        L48_1.imagePath = L38_1
                        L48_1.commandLine = L40_1
                        L48_1.ppID = L39_1
                        L48_1.UserName = L13_1
                        L48_1.Domain = L14_1
                        L48_1.file_list = L10_1
                        L48_1.Type = "Type2.2"
                        L48_1.RemoteEncConfig = L47_1
                        L9_1 = L48_1
                        L48_1 = safeJsonSerialize
                        L49_1 = L9_1
                        L48_1 = L48_1(L49_1)
                        L49_1 = bm
                        L49_1 = L49_1.add_related_string
                        L50_1 = "RemoteClientData"
                        L51_1 = L48_1
                        L52_1 = bm
                        L52_1 = L52_1.RelatedStringBMReport
                        L49_1(L50_1, L51_1, L52_1)
                        L49_1 = bm
                        L49_1 = L49_1.trigger_sig
                        L50_1 = "RemoteGenericRansomware:Type2.2"
                        L51_1 = L48_1
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
                          L57_1 = L15_1
                          L55_1 = L55_1(L56_1, L57_1)
                          L9_1.ipTypeFlags = L55_1
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
                        L57_1 = L15_1
                        L56_1[1] = L57_1
                        L57_1 = {}
                        L57_1.SIG_CONTEXT = "BM"
                        L57_1.CONTEXT_SOURCE = "GenRansom3"
                        L57_1.TAG = "NOLOOKUP"
                        L58_1 = safeJsonSerialize
                        L59_1 = L9_1
                        L58_1 = L58_1(L59_1)
                        L57_1.data = L58_1
                        L58_1 = false
                        L59_1 = 3000
                        L60_1 = false
                        L55_1 = L55_1(L56_1, L57_1, L58_1, L59_1, L60_1)
                        if L55_1 then
                          L56_1 = L55_1.error
                          if L56_1 == 3 then
                            L9_1.CRReportError = "Failed the first attempt"
                            L56_1 = SafeGetUrlReputation
                            L57_1 = {}
                            L58_1 = L15_1
                            L57_1[1] = L58_1
                            L58_1 = {}
                            L58_1.SIG_CONTEXT = "BM"
                            L58_1.CONTEXT_SOURCE = "GenRansom3"
                            L58_1.TAG = "NOLOOKUP"
                            L59_1 = safeJsonSerialize
                            L60_1 = L9_1
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
                        L56_1 = L56_1[L15_1]
                        if L56_1 then
                          L56_1 = L55_1.urls
                          L56_1 = L56_1[L15_1]
                          L56_1 = L56_1.determination
                          if L56_1 ~= 2 then
                            L56_1 = L55_1.urls
                            L56_1 = L56_1[L15_1]
                            L56_1 = L56_1.determination
                            if L56_1 ~= 1 then
                              goto lbl_748
                            end
                          end
                          L56_1 = L55_1.urls
                          L56_1 = L56_1[L15_1]
                          L56_1 = L56_1.confidence
                          if L56_1 then
                            L56_1 = L55_1.urls
                            L56_1 = L56_1[L15_1]
                            L56_1 = L56_1.confidence
                            if 50 <= L56_1 then
                              L56_1 = L55_1.urls
                              L56_1 = L56_1[L15_1]
                              L56_1 = L56_1.context
                              L56_1 = L56_1.Source
                              if L56_1 == "GenRansom" then
                                L56_1 = L55_1.urls
                                L56_1 = L56_1[L15_1]
                                L56_1 = L56_1.confidence
                                L9_1.confidence = L56_1
                                L56_1 = L55_1.urls
                                L56_1 = L56_1[L15_1]
                                L56_1 = L56_1.context
                                L56_1 = L56_1.Family
                                L9_1.family = L56_1
                                L56_1 = L55_1.urls
                                L56_1 = L56_1[L15_1]
                                L56_1 = L56_1.determination
                                L9_1.determination = L56_1
                                L56_1 = {}
                                L57_1 = L55_1.urls
                                L57_1 = L57_1[L15_1]
                                L57_1 = L57_1.context
                                L57_1 = L57_1.action
                                L56_1.action = L57_1
                                L57_1 = L55_1.urls
                                L57_1 = L57_1[L15_1]
                                L57_1 = L57_1.context
                                L57_1 = L57_1.action_parameter
                                L56_1.parameter = L57_1
                                L57_1 = L55_1.urls
                                L57_1 = L57_1[L15_1]
                                L57_1 = L57_1.context
                                L57_1 = L57_1.action_ttl
                                L56_1.ttl = L57_1
                                L9_1.action = L56_1
                                L57_1 = L55_1.urls
                                L57_1 = L57_1[L15_1]
                                L57_1 = L57_1.context
                                L9_1.context = L57_1
                                L9_1.ip = L15_1
                                L9_1.unscrubbed_username = L11_1
                                L9_1.unscrubbed_domain = L12_1
                                L57_1 = bm
                                L57_1 = L57_1.trigger_sig
                                L58_1 = "RemoteGenericRansomware:Malware"
                                L59_1 = safeJsonSerialize
                                L60_1 = L9_1
                                L59_1, L60_1, L61_1 = L59_1(L60_1)
                                L57_1(L58_1, L59_1, L60_1, L61_1)
                              end
                            end
                          end
                        end
                      end
                    end
                    ::lbl_748::
                    L45_1 = bm
                    L45_1 = L45_1.add_related_string
                    L46_1 = "sigcount_type2"
                    L47_1 = L4_1
                    L48_1 = bm
                    L48_1 = L48_1.RelatedStringBMReport
                    L45_1(L46_1, L47_1, L48_1)
                    L45_1 = mp
                    L45_1 = L45_1.INFECTED
                    return L45_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_758::
end
L18_1 = mp
L18_1 = L18_1.CLEAN
return L18_1
