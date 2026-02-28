local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1
L0_1 = {}
L0_1[".zzz"] = true
L0_1[".couch"] = true
L0_1[".___"] = true
L0_1[".amq"] = true
L0_1[".aaaa"] = true
L0_1[".importing"] = true
L0_1[".yyy"] = true
L0_1[".____"] = true
L0_1[".xxxx"] = true
L0_1[".nuspec"] = true
L0_1[".status"] = true
L0_1[".wfcont"] = true
L0_1[".dbf_xc2"] = true
L0_1[".bundle"] = true
L0_1[".zzzz"] = true
L1_1 = mp
L1_1 = L1_1.SIGATTR_LOG_SZ
L2_1 = {}
L3_1 = bm
L3_1 = L3_1.get_sig_count
L3_1 = L3_1()
L4_1 = 1
L5_1 = L1_1
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
    L2_1[L8_1] = L7_1
  end
end
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
L15_1 = 1
L16_1 = L1_1
L17_1 = 1
for L18_1 = L15_1, L16_1, L17_1 do
  L19_1 = sigattr_tail
  L19_1 = L19_1[L18_1]
  L19_1 = L19_1.attribute
  if L19_1 == 16386 then
    L19_1 = sigattr_tail
    L19_1 = L19_1[L18_1]
    L19_1 = L19_1.utf8p2
    L20_1 = L19_1
    L19_1 = L19_1.lower
    L19_1 = L19_1(L20_1)
    L20_1 = sigattr_tail
    L20_1 = L20_1[L18_1]
    L20_1 = L20_1.utf8p1
    L21_1 = L20_1
    L20_1 = L20_1.lower
    L20_1 = L20_1(L21_1)
    L21_1 = L2_1[L20_1]
    if L21_1 == nil then
      L21_1 = L2_1[L19_1]
      if L21_1 == nil then
        goto lbl_768
      end
    end
    L21_1 = L5_1[L19_1]
    if L21_1 == nil then
      L22_1 = L20_1
      L21_1 = L20_1.match
      L23_1 = "%.[^%.]+$"
      L21_1 = L21_1(L22_1, L23_1)
      if L21_1 then
        L22_1 = L0_1[L21_1]
        if L22_1 == nil then
          L22_1 = mp
          L22_1 = L22_1.GetExtensionClass
          L23_1 = L21_1
          L22_1 = L22_1(L23_1)
          if L22_1 == 0 then
            L23_1 = L19_1
            L22_1 = L19_1.match
            L24_1 = "%.[^%.]+$"
            L22_1 = L22_1(L23_1, L24_1)
            if L22_1 ~= nil then
              L23_1 = mp
              L23_1 = L23_1.bitand
              L24_1 = mp
              L24_1 = L24_1.GetExtensionClass
              L25_1 = L22_1
              L24_1 = L24_1(L25_1)
              L25_1 = 3
              L23_1 = L23_1(L24_1, L25_1)
              if L23_1 ~= 0 then
                L24_1 = L19_1
                L23_1 = L19_1.match
                L25_1 = "^(.+)\\"
                L23_1 = L23_1(L24_1, L25_1)
                L25_1 = L20_1
                L24_1 = L20_1.match
                L26_1 = "^(.+)\\"
                L24_1 = L24_1(L25_1, L26_1)
                L26_1 = L19_1
                L25_1 = L19_1.match
                L27_1 = "[^\\]+$"
                L25_1 = L25_1(L26_1, L27_1)
                L27_1 = L20_1
                L26_1 = L20_1.match
                L28_1 = "[^\\]+$"
                L26_1 = L26_1(L27_1, L28_1)
                L28_1 = L26_1
                L27_1 = L26_1.match
                L29_1 = "(.+)%..+"
                L27_1 = L27_1(L28_1, L29_1)
                L28_1 = L27_1
                L27_1 = L27_1.lower
                L27_1 = L27_1(L28_1)
                L29_1 = L25_1
                L28_1 = L25_1.match
                L30_1 = "(.+)%..+"
                L28_1 = L28_1(L29_1, L30_1)
                L29_1 = L28_1
                L28_1 = L28_1.lower
                L28_1 = L28_1(L29_1)
                if L23_1 == L24_1 then
                  L30_1 = L20_1
                  L29_1 = L20_1.byte
                  L31_1 = #L20_1
                  L31_1 = L31_1 + 1
                  L29_1 = L29_1(L30_1, L31_1)
                  if L29_1 ~= 58 then
                    L30_1 = L27_1
                    L29_1 = L27_1.find
                    L31_1 = L28_1
                    L32_1 = 1
                    L33_1 = true
                    L29_1 = L29_1(L30_1, L31_1, L32_1, L33_1)
                    if L29_1 == nil then
                      L5_1[L19_1] = 1
                      L29_1 = L2_1[L20_1]
                      if L29_1 ~= nil then
                        L29_1 = L2_1[L20_1]
                        L6_1[L18_1] = L29_1
                      else
                        L29_1 = L2_1[L19_1]
                        if L29_1 ~= nil then
                          L29_1 = L2_1[L19_1]
                          L6_1[L18_1] = L29_1
                        end
                      end
                      L29_1 = L4_1[L21_1]
                      if L29_1 ~= nil then
                        L29_1 = table
                        L29_1 = L29_1.insert
                        L30_1 = L4_1[L21_1]
                        L31_1 = L18_1
                        L29_1(L30_1, L31_1)
                      else
                        L29_1 = {}
                        L30_1 = L18_1
                        L29_1[1] = L30_1
                        L4_1[L21_1] = L29_1
                      end
                      L29_1 = L4_1[L21_1]
                      L29_1 = #L29_1
                      if 5 <= L29_1 then
                        L29_1 = false
                        L30_1 = {}
                        L30_1.count = 0
                        L31_1 = pairs
                        L32_1 = L4_1[L21_1]
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
                          L38_1 = L6_1[L35_1]
                          if L38_1 ~= nil and L14_1 == false then
                            L38_1 = sigattr_tail
                            L39_1 = L6_1[L35_1]
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
                                        L9_1 = L40_1.UsrName
                                        L10_1 = L40_1.Domain
                                        L41_1 = scrubData
                                        L42_1 = L40_1.UsrName
                                        L41_1 = L41_1(L42_1)
                                        L11_1 = L41_1
                                        L41_1 = scrubData
                                        L42_1 = L40_1.Domain
                                        L41_1 = L41_1(L42_1)
                                        L12_1 = L41_1
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
                                          L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1 = L45_1(L46_1, L47_1, L48_1)
                                          L43_1 = L43_1(L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1)
                                          L42_1 = L43_1
                                        end
                                        if L41_1 ~= nil and (L13_1 == "" or L13_1 == L41_1) then
                                          L43_1 = table
                                          L43_1 = L43_1.insert
                                          L44_1 = L8_1
                                          L45_1 = {}
                                          L46_1 = sigattr_tail
                                          L46_1 = L46_1[L35_1]
                                          L46_1 = L46_1.utf8p1
                                          L45_1.path = L46_1
                                          L45_1.magic = L42_1
                                          L45_1.fileSize = L36_1
                                          L43_1(L44_1, L45_1)
                                          L13_1 = L41_1
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
                        L33_1 = L21_1
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
                        L31_1.appended_ext = L21_1
                        L31_1.magic_mismatch = L29_1
                        L31_1.sig_count = L3_1
                        L36_1 = "FileChain_MainSet:"
                        L37_1 = pairs
                        L38_1 = L4_1[L21_1]
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
                        L41_1 = "genf_ransom_meta"
                        L42_1 = L39_1
                        L43_1 = bm
                        L43_1 = L43_1.RelatedStringBMReport
                        L40_1(L41_1, L42_1, L43_1)
                        L40_1 = bm
                        L40_1 = L40_1.trigger_sig
                        L41_1 = "GenericRansomware:Type6"
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
                        L43_1 = "susp_ransomware_type6"
                        L40_1(L41_1, L42_1, L43_1)
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
                        if L14_1 == false then
                          L42_1 = #L8_1
                          if 0 < L42_1 and L13_1 ~= nil and L13_1 ~= "" then
                            L42_1 = mp
                            L42_1 = L42_1.GetExtensionClass
                            L43_1 = L21_1
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
                            L45_1.Extension = L21_1
                            L45_1.ExtensionClass = L42_1
                            L45_1.imagePath = L33_1
                            L45_1.commandLine = L35_1
                            L45_1.ppID = L34_1
                            L45_1.UserName = L11_1
                            L45_1.Domain = L12_1
                            L45_1.file_list = L8_1
                            L45_1.Type = "Type6"
                            L45_1.RemoteEncConfig = L44_1
                            L7_1 = L45_1
                            L45_1 = safeJsonSerialize
                            L46_1 = L7_1
                            L45_1 = L45_1(L46_1)
                            L46_1 = bm
                            L46_1 = L46_1.add_related_string
                            L47_1 = "RemoteClientData"
                            L48_1 = L45_1
                            L49_1 = bm
                            L49_1 = L49_1.RelatedStringBMReport
                            L46_1(L47_1, L48_1, L49_1)
                            L46_1 = bm
                            L46_1 = L46_1.trigger_sig
                            L47_1 = "RemoteGenericRansomware:Type6"
                            L48_1 = L45_1
                            L46_1(L47_1, L48_1)
                            L46_1 = pcall
                            L47_1 = updateSystemDNSServers
                            L46_1, L47_1 = L46_1(L47_1)
                            if not L46_1 then
                              L48_1 = bm
                              L48_1 = L48_1.add_related_string
                              L49_1 = "updateSystemDNSServers_fail"
                              L50_1 = L47_1
                              L51_1 = bm
                              L51_1 = L51_1.RelatedStringBMReport
                              L48_1(L49_1, L50_1, L51_1)
                            end
                            L48_1 = pcall
                            L49_1 = updateDomainInfo
                            L48_1, L49_1, L50_1, L51_1 = L48_1(L49_1)
                            if L48_1 then
                              L52_1 = GetRollingQueueKeyValue
                              L53_1 = "domainInfo"
                              L54_1 = L13_1
                              L52_1 = L52_1(L53_1, L54_1)
                              L7_1.ipTypeFlags = L52_1
                            else
                              L52_1 = bm
                              L52_1 = L52_1.add_related_string
                              L53_1 = "updateDomainInfo_fail"
                              L54_1 = L49_1
                              L55_1 = bm
                              L55_1 = L55_1.RelatedStringBMReport
                              L52_1(L53_1, L54_1, L55_1)
                            end
                            L52_1 = SafeGetUrlReputation
                            L53_1 = {}
                            L54_1 = L13_1
                            L53_1[1] = L54_1
                            L54_1 = {}
                            L54_1.SIG_CONTEXT = "BM"
                            L54_1.CONTEXT_SOURCE = "GenRansom"
                            L54_1.TAG = "NOLOOKUP"
                            L55_1 = safeJsonSerialize
                            L56_1 = L7_1
                            L55_1 = L55_1(L56_1)
                            L54_1.data = L55_1
                            L55_1 = false
                            L56_1 = 3000
                            L57_1 = false
                            L52_1 = L52_1(L53_1, L54_1, L55_1, L56_1, L57_1)
                            if L52_1 then
                              L53_1 = L52_1.error
                              if L53_1 == 3 then
                                L7_1.CRReportError = "Failed the first attempt"
                                L53_1 = SafeGetUrlReputation
                                L54_1 = {}
                                L55_1 = L13_1
                                L54_1[1] = L55_1
                                L55_1 = {}
                                L55_1.SIG_CONTEXT = "BM"
                                L55_1.CONTEXT_SOURCE = "GenRansom3"
                                L55_1.TAG = "NOLOOKUP"
                                L56_1 = safeJsonSerialize
                                L57_1 = L7_1
                                L56_1 = L56_1(L57_1)
                                L55_1.data = L56_1
                                L56_1 = false
                                L57_1 = 3000
                                L58_1 = false
                                L53_1 = L53_1(L54_1, L55_1, L56_1, L57_1, L58_1)
                                L52_1 = L53_1
                              end
                            end
                            L53_1 = L52_1.urls
                            L53_1 = L53_1[L13_1]
                            if L53_1 then
                              L53_1 = L52_1.urls
                              L53_1 = L53_1[L13_1]
                              L53_1 = L53_1.determination
                              if L53_1 ~= 2 then
                                L53_1 = L52_1.urls
                                L53_1 = L53_1[L13_1]
                                L53_1 = L53_1.determination
                                if L53_1 ~= 1 then
                                  goto lbl_758
                                end
                              end
                              L53_1 = L52_1.urls
                              L53_1 = L53_1[L13_1]
                              L53_1 = L53_1.confidence
                              if L53_1 then
                                L53_1 = L52_1.urls
                                L53_1 = L53_1[L13_1]
                                L53_1 = L53_1.confidence
                                if 50 <= L53_1 then
                                  L53_1 = L52_1.urls
                                  L53_1 = L53_1[L13_1]
                                  L53_1 = L53_1.context
                                  L53_1 = L53_1.Source
                                  if L53_1 == "GenRansom" then
                                    L53_1 = L52_1.urls
                                    L53_1 = L53_1[L13_1]
                                    L53_1 = L53_1.confidence
                                    L7_1.confidence = L53_1
                                    L53_1 = L52_1.urls
                                    L53_1 = L53_1[L13_1]
                                    L53_1 = L53_1.context
                                    L53_1 = L53_1.Family
                                    L7_1.family = L53_1
                                    L53_1 = L52_1.urls
                                    L53_1 = L53_1[L13_1]
                                    L53_1 = L53_1.determination
                                    L7_1.determination = L53_1
                                    L53_1 = {}
                                    L54_1 = L52_1.urls
                                    L54_1 = L54_1[L13_1]
                                    L54_1 = L54_1.context
                                    L54_1 = L54_1.action
                                    L53_1.action = L54_1
                                    L54_1 = L52_1.urls
                                    L54_1 = L54_1[L13_1]
                                    L54_1 = L54_1.context
                                    L54_1 = L54_1.action_parameter
                                    L53_1.parameter = L54_1
                                    L54_1 = L52_1.urls
                                    L54_1 = L54_1[L13_1]
                                    L54_1 = L54_1.context
                                    L54_1 = L54_1.action_ttl
                                    L53_1.ttl = L54_1
                                    L54_1 = L52_1.urls
                                    L54_1 = L54_1[L13_1]
                                    L54_1 = L54_1.context
                                    L7_1.context = L54_1
                                    L7_1.action = L53_1
                                    L7_1.ip = L13_1
                                    L7_1.unscrubbed_username = L9_1
                                    L7_1.unscrubbed_domain = L10_1
                                    L54_1 = bm
                                    L54_1 = L54_1.trigger_sig
                                    L55_1 = "RemoteGenericRansomware:Malware"
                                    L56_1 = safeJsonSerialize
                                    L57_1 = L7_1
                                    L56_1, L57_1, L58_1 = L56_1(L57_1)
                                    L54_1(L55_1, L56_1, L57_1, L58_1)
                                  end
                                end
                              end
                            end
                          end
                        end
                        ::lbl_758::
                        L42_1 = bm
                        L42_1 = L42_1.add_related_string
                        L43_1 = "sigcount_type6"
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
      end
    end
  end
  ::lbl_768::
end
L15_1 = mp
L15_1 = L15_1.CLEAN
return L15_1
