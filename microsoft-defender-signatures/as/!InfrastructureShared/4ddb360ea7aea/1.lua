local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = 1
L3_1 = L0_1
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = sigattr_tail
  L6_1 = L6_1[L5_1]
  L6_1 = L6_1.attribute
  if L6_1 == 16385 then
    L6_1 = sigattr_tail
    L6_1 = L6_1[L5_1]
    L6_1 = L6_1.utf8p1
    L7_1 = L6_1
    L6_1 = L6_1.lower
    L6_1 = L6_1(L7_1)
    L7_1 = mp
    L7_1 = L7_1.crc32
    L8_1 = 0
    L9_1 = L6_1
    L10_1 = 1
    L11_1 = #L6_1
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    L1_1[L7_1] = 1
  end
end
L2_1 = {}
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_tail
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.attribute
  if L7_1 == 16389 then
    L7_1 = sigattr_tail
    L7_1 = L7_1[L6_1]
    L7_1 = L7_1.utf8p2
    if L7_1 == "ATTR_c09458eb" then
      L7_1 = sigattr_tail
      L7_1 = L7_1[L6_1]
      L7_1 = L7_1.utf8p1
      L8_1 = mp
      L8_1 = L8_1.crc32
      L9_1 = 0
      L10_1 = L7_1
      L11_1 = 1
      L12_1 = #L7_1
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      L2_1[L8_1] = L6_1
    end
  end
end
L3_1 = {}
L4_1 = {}
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.attribute
  if L9_1 == 16386 then
    L9_1 = sigattr_tail
    L9_1 = L9_1[L8_1]
    L9_1 = L9_1.utf8p2
    L10_1 = L9_1
    L9_1 = L9_1.lower
    L9_1 = L9_1(L10_1)
    L10_1 = sigattr_tail
    L10_1 = L10_1[L8_1]
    L10_1 = L10_1.utf8p1
    L11_1 = L10_1
    L10_1 = L10_1.lower
    L10_1 = L10_1(L11_1)
    L11_1 = mp
    L11_1 = L11_1.crc32
    L12_1 = 0
    L13_1 = L9_1
    L14_1 = 1
    L15_1 = #L9_1
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    L12_1 = mp
    L12_1 = L12_1.crc32
    L13_1 = 0
    L14_1 = L10_1
    L15_1 = 1
    L16_1 = #L10_1
    L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
    L13_1 = L1_1[L12_1]
    if L13_1 == nil then
      L13_1 = L1_1[L11_1]
      if L13_1 == nil then
        goto lbl_539
      end
    end
    L13_1 = L4_1[L11_1]
    if L13_1 == nil then
      L14_1 = L9_1
      L13_1 = L9_1.match
      L15_1 = "%.[^%.]+$"
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil then
        L14_1 = mp
        L14_1 = L14_1.bitand
        L15_1 = mp
        L15_1 = L15_1.GetExtensionClass
        L16_1 = L13_1
        L15_1 = L15_1(L16_1)
        L16_1 = 3
        L14_1 = L14_1(L15_1, L16_1)
        if L14_1 ~= 0 then
          L14_1 = #L9_1
          L15_1 = #L10_1
          if L14_1 < L15_1 then
            L15_1 = L10_1
            L14_1 = L10_1.find
            L16_1 = L9_1
            L17_1 = 1
            L18_1 = true
            L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
            if L14_1 == 1 then
              L15_1 = L10_1
              L14_1 = L10_1.byte
              L16_1 = #L9_1
              L16_1 = L16_1 + 1
              L14_1 = L14_1(L15_1, L16_1)
              if L14_1 ~= 58 then
                L4_1[L11_1] = 1
                L15_1 = L10_1
                L14_1 = L10_1.match
                L16_1 = "%.[^%.]+$"
                L14_1 = L14_1(L15_1, L16_1)
                L15_1 = mp
                L15_1 = L15_1.GetExtensionClass
                L16_1 = L14_1
                L15_1 = L15_1(L16_1)
                if L15_1 ~= 4 then
                  L15_1 = string
                  L15_1 = L15_1.sub
                  L16_1 = L10_1
                  L17_1 = #L9_1
                  L17_1 = L17_1 + 1
                  L15_1 = L15_1(L16_1, L17_1)
                  L16_1 = L3_1[L15_1]
                  if L16_1 ~= nil then
                    L16_1 = table
                    L16_1 = L16_1.insert
                    L17_1 = L3_1[L15_1]
                    L18_1 = L8_1
                    L16_1(L17_1, L18_1)
                    L16_1 = L3_1[L15_1]
                    L16_1 = #L16_1
                    if not (5 <= L16_1) then
                      goto lbl_539
                    end
                    L16_1 = {}
                    L16_1.count = 0
                    L17_1 = pairs
                    L18_1 = L3_1[L15_1]
                    L17_1, L18_1, L19_1 = L17_1(L18_1)
                    for L20_1, L21_1 in L17_1, L18_1, L19_1 do
                      L22_1 = sysio
                      L22_1 = L22_1.ReadFile
                      L23_1 = sigattr_tail
                      L23_1 = L23_1[L21_1]
                      L23_1 = L23_1.utf8p1
                      L24_1 = 0
                      L25_1 = 4
                      L22_1 = L22_1(L23_1, L24_1, L25_1)
                      if L22_1 ~= nil then
                        L23_1 = L16_1[L22_1]
                        if L23_1 == nil then
                          L16_1[L22_1] = 1
                          L23_1 = L16_1.count
                          L23_1 = L23_1 + 1
                          L16_1.count = L23_1
                        end
                      end
                    end
                    L17_1 = L16_1.count
                    if 4 < L17_1 then
                      L17_1 = bm
                      L17_1 = L17_1.add_related_string
                      L18_1 = "magic_mismatch"
                      L19_1 = "true"
                      L20_1 = bm
                      L20_1 = L20_1.RelatedStringBMReport
                      L17_1(L18_1, L19_1, L20_1)
                    else
                      L17_1 = bm
                      L17_1 = L17_1.add_related_string
                      L18_1 = "magic_mismatch"
                      L19_1 = "false"
                      L20_1 = bm
                      L20_1 = L20_1.RelatedStringBMReport
                      L17_1(L18_1, L19_1, L20_1)
                    end
                    L17_1 = bm
                    L17_1 = L17_1.add_related_string
                    L18_1 = "ransom_extension"
                    L19_1 = L15_1
                    L20_1 = bm
                    L20_1 = L20_1.RelatedStringBMReport
                    L17_1(L18_1, L19_1, L20_1)
                    L17_1 = bm
                    L17_1 = L17_1.get_current_process_startup_info
                    L17_1 = L17_1()
                    if L17_1 ~= nil then
                      L17_1 = L17_1.ppid
                    else
                      L17_1 = -1
                    end
                    L18_1 = "genb_ransom_meta_"
                    L19_1 = L17_1
                    L18_1 = L18_1 .. L19_1
                    L19_1 = "ChangeFile"
                    L20_1 = ""
                    L21_1 = 1800
                    L22_1 = 100
                    L23_1 = {}
                    L24_1 = "FileChain_MainSet:"
                    L25_1 = pairs
                    L26_1 = L3_1[L15_1]
                    L25_1, L26_1, L27_1 = L25_1(L26_1)
                    for L28_1, L29_1 in L25_1, L26_1, L27_1 do
                      L30_1 = sigattr_tail
                      L30_1 = L30_1[L29_1]
                      L30_1 = L30_1.utf8p1
                      L31_1 = string
                      L31_1 = L31_1.find
                      L32_1 = L30_1
                      L33_1 = "\\[^\\]*$"
                      L31_1 = L31_1(L32_1, L33_1)
                      if not L31_1 then
                        L31_1 = 0
                      end
                      L32_1 = string
                      L32_1 = L32_1.find
                      L33_1 = L30_1
                      L34_1 = "."
                      L35_1 = L31_1
                      L36_1 = true
                      L32_1 = L32_1(L33_1, L34_1, L35_1, L36_1)
                      if L32_1 ~= nil then
                        L33_1 = string
                        L33_1 = L33_1.sub
                        L34_1 = L30_1
                        L35_1 = L31_1 + 1
                        L36_1 = L32_1 - 1
                        L33_1 = L33_1(L34_1, L35_1, L36_1)
                        L34_1 = L24_1
                        L35_1 = crypto
                        L35_1 = L35_1.CRC32Buffer
                        L36_1 = -1
                        L37_1 = L33_1
                        L38_1 = 0
                        L39_1 = #L33_1
                        L35_1 = L35_1(L36_1, L37_1, L38_1, L39_1)
                        L24_1 = L34_1 .. L35_1
                        L34_1 = L24_1
                        L35_1 = ";"
                        L36_1 = string
                        L36_1 = L36_1.sub
                        L37_1 = L30_1
                        L38_1 = L32_1 + 1
                        L36_1 = L36_1(L37_1, L38_1)
                        L37_1 = ";"
                        L24_1 = L34_1 .. L35_1 .. L36_1 .. L37_1
                      end
                      L33_1 = sigattr_tail
                      L33_1 = L33_1[L29_1]
                      L30_1 = L33_1.utf8p2
                      L33_1 = string
                      L33_1 = L33_1.find
                      L34_1 = L30_1
                      L35_1 = "\\[^\\]*$"
                      L33_1 = L33_1(L34_1, L35_1)
                      L31_1 = L33_1 or L31_1
                      if not L33_1 then
                        L31_1 = 0
                      end
                      L33_1 = string
                      L33_1 = L33_1.find
                      L34_1 = L30_1
                      L35_1 = "."
                      L36_1 = L31_1
                      L37_1 = true
                      L33_1 = L33_1(L34_1, L35_1, L36_1, L37_1)
                      L32_1 = L33_1
                      if L32_1 ~= nil then
                        L33_1 = string
                        L33_1 = L33_1.sub
                        L34_1 = L30_1
                        L35_1 = L31_1 + 1
                        L36_1 = L32_1 - 1
                        L33_1 = L33_1(L34_1, L35_1, L36_1)
                        L34_1 = L24_1
                        L35_1 = crypto
                        L35_1 = L35_1.CRC32Buffer
                        L36_1 = -1
                        L37_1 = L33_1
                        L38_1 = 0
                        L39_1 = #L33_1
                        L35_1 = L35_1(L36_1, L37_1, L38_1, L39_1)
                        L24_1 = L34_1 .. L35_1
                        L34_1 = L24_1
                        L35_1 = ";"
                        L36_1 = string
                        L36_1 = L36_1.sub
                        L37_1 = L30_1
                        L38_1 = L32_1 + 1
                        L36_1 = L36_1(L37_1, L38_1)
                        L37_1 = ";"
                        L24_1 = L34_1 .. L35_1 .. L36_1 .. L37_1
                      end
                      L33_1 = L15_1
                      L34_1 = "|"
                      L20_1 = L33_1 .. L34_1
                      L33_1 = L20_1
                      L34_1 = sigattr_tail
                      L34_1 = L34_1[L29_1]
                      L34_1 = L34_1.utf8p1
                      L35_1 = "|"
                      L36_1 = sigattr_tail
                      L36_1 = L36_1[L29_1]
                      L36_1 = L36_1.utf8p2
                      L37_1 = "|"
                      L20_1 = L33_1 .. L34_1 .. L35_1 .. L36_1 .. L37_1
                      L33_1 = "Known"
                      L34_1 = mp
                      L34_1 = L34_1.crc32
                      L35_1 = 0
                      L36_1 = sigattr_tail
                      L36_1 = L36_1[L29_1]
                      L36_1 = L36_1.utf8p1
                      L37_1 = 1
                      L38_1 = sigattr_tail
                      L38_1 = L38_1[L29_1]
                      L38_1 = L38_1.utf8p1
                      L38_1 = #L38_1
                      L34_1 = L34_1(L35_1, L36_1, L37_1, L38_1)
                      L35_1 = mp
                      L35_1 = L35_1.crc32
                      L36_1 = 0
                      L37_1 = sigattr_tail
                      L37_1 = L37_1[L29_1]
                      L37_1 = L37_1.utf8p2
                      L38_1 = 1
                      L39_1 = sigattr_tail
                      L39_1 = L39_1[L29_1]
                      L39_1 = L39_1.utf8p2
                      L39_1 = #L39_1
                      L35_1 = L35_1(L36_1, L37_1, L38_1, L39_1)
                      L36_1 = L2_1[L34_1]
                      if L36_1 == nil then
                        L36_1 = L2_1[L35_1]
                        if L36_1 == nil then
                          goto lbl_363
                        end
                      end
                      L33_1 = "Unknown"
                      ::lbl_363::
                      L36_1 = L20_1
                      L37_1 = L33_1
                      L38_1 = "|"
                      L20_1 = L36_1 .. L37_1 .. L38_1
                      L36_1 = sysio
                      L36_1 = L36_1.GetFileSize
                      L37_1 = sigattr_tail
                      L37_1 = L37_1[L29_1]
                      L37_1 = L37_1.utf8p1
                      L36_1 = L36_1(L37_1)
                      L37_1 = L20_1
                      L38_1 = L36_1
                      L39_1 = "|"
                      L20_1 = L37_1 .. L38_1 .. L39_1
                      L37_1 = L36_1
                      L38_1 = ""
                      L39_1 = ""
                      if L36_1 ~= nil and 256 < L36_1 then
                        L36_1 = 256
                        L40_1 = sysio
                        L40_1 = L40_1.ReadFile
                        L41_1 = sigattr_tail
                        L41_1 = L41_1[L29_1]
                        L41_1 = L41_1.utf8p1
                        L42_1 = 0
                        L43_1 = L36_1
                        L40_1 = L40_1(L41_1, L42_1, L43_1)
                        if L40_1 ~= nil then
                          L41_1 = string
                          L41_1 = L41_1.format
                          L42_1 = "\\x%02X\\x%02X\\x%02X\\x%02X"
                          L43_1 = string
                          L43_1 = L43_1.byte
                          L44_1 = L40_1
                          L45_1 = 1
                          L46_1 = 4
                          L43_1, L44_1, L45_1, L46_1 = L43_1(L44_1, L45_1, L46_1)
                          L41_1 = L41_1(L42_1, L43_1, L44_1, L45_1, L46_1)
                          L38_1 = L41_1
                          L41_1 = crypto
                          L41_1 = L41_1.ComputeEntropy
                          L42_1 = L40_1
                          L41_1 = L41_1(L42_1)
                          L39_1 = L41_1
                          L41_1 = table
                          L41_1 = L41_1.insert
                          L42_1 = L23_1
                          L43_1 = {}
                          L43_1.File_Size = L37_1
                          L43_1.FileType = L33_1
                          L43_1.MagicByte = L38_1
                          L43_1.Entropy = L39_1
                          L41_1(L42_1, L43_1)
                        end
                      end
                      L40_1 = L20_1
                      L41_1 = L38_1
                      L42_1 = "|"
                      L43_1 = L39_1
                      L20_1 = L40_1 .. L41_1 .. L42_1 .. L43_1
                      L40_1 = AppendToRollingQueue
                      L41_1 = L18_1
                      L42_1 = L19_1
                      L43_1 = L20_1
                      L44_1 = L21_1
                      L45_1 = L22_1
                      L46_1 = 0
                      L40_1(L41_1, L42_1, L43_1, L44_1, L45_1, L46_1)
                    end
                    L25_1 = bm
                    L25_1 = L25_1.add_related_string
                    L26_1 = "ransom_encryptedData"
                    L27_1 = safeJsonSerialize
                    L28_1 = L23_1
                    L27_1 = L27_1(L28_1)
                    L28_1 = bm
                    L28_1 = L28_1.RelatedStringBMReport
                    L25_1(L26_1, L27_1, L28_1)
                    L25_1 = bm
                    L25_1 = L25_1.add_related_string
                    L26_1 = "ransom_encryptedDataRQ"
                    L27_1 = safeJsonSerialize
                    L28_1 = GetRollingQueue
                    L29_1 = L18_1
                    L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1 = L28_1(L29_1)
                    L27_1 = L27_1(L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1)
                    L28_1 = bm
                    L28_1 = L28_1.RelatedStringBMReport
                    L25_1(L26_1, L27_1, L28_1)
                    L25_1 = bm
                    L25_1 = L25_1.get_process_relationships
                    L25_1, L26_1 = L25_1()
                    L27_1 = ipairs
                    L28_1 = L25_1
                    L27_1, L28_1, L29_1 = L27_1(L28_1)
                    for L30_1, L31_1 in L27_1, L28_1, L29_1 do
                      L32_1 = L31_1.image_path
                      if L32_1 ~= nil then
                        L32_1 = bm
                        L32_1 = L32_1.add_related_process
                        L33_1 = L31_1.ppid
                        L32_1(L33_1)
                      end
                    end
                    L27_1 = ipairs
                    L28_1 = L26_1
                    L27_1, L28_1, L29_1 = L27_1(L28_1)
                    for L30_1, L31_1 in L27_1, L28_1, L29_1 do
                      L32_1 = L31_1.image_path
                      if L32_1 ~= nil then
                        L32_1 = bm
                        L32_1 = L32_1.add_related_process
                        L33_1 = L31_1.ppid
                        L32_1(L33_1)
                        L32_1 = TrackPidAndTechniqueBM
                        L33_1 = L31_1.ppid
                        L34_1 = "T1485"
                        L35_1 = "susp_ransomware_childproc_type2"
                        L32_1(L33_1, L34_1, L35_1)
                      end
                    end
                    L27_1 = bm
                    L27_1 = L27_1.add_related_string
                    L28_1 = "ransom_files_main"
                    L29_1 = L24_1
                    L30_1 = bm
                    L30_1 = L30_1.RelatedStringBMReport
                    L27_1(L28_1, L29_1, L30_1)
                    L27_1 = MpCommon
                    L27_1 = L27_1.RollingQueueCount
                    L28_1 = L18_1
                    L27_1 = L27_1(L28_1)
                    L28_1 = math_floor
                    L29_1 = L27_1 / 5
                    L28_1 = L28_1(L29_1)
                    if 5 < L27_1 then
                      L29_1 = bm
                      L29_1 = L29_1.trigger_sig
                      L30_1 = "GenericRansomware"
                      L31_1 = "Type2:Count_"
                      L32_1 = L28_1
                      L31_1 = L31_1 .. L32_1
                      L29_1(L30_1, L31_1)
                    end
                    L29_1 = sms_untrusted_process
                    L29_1()
                    L29_1 = bm
                    L29_1 = L29_1.add_action
                    L30_1 = "SmsAsyncScanEvent"
                    L31_1 = 100
                    L29_1(L30_1, L31_1)
                    L29_1 = TrackPidAndTechniqueBM
                    L30_1 = L17_1
                    L31_1 = "T1486"
                    L32_1 = "susp_ransomware_type2"
                    L29_1(L30_1, L31_1, L32_1)
                    if L28_1 < 5 then
                      L29_1 = mp
                      L29_1 = L29_1.CLEAN
                      return L29_1
                    end
                    L29_1 = reportTimingData
                    L29_1()
                    L29_1 = mp
                    L29_1 = L29_1.INFECTED
                    return L29_1
                  else
                    L16_1 = {}
                    L17_1 = L8_1
                    L16_1[1] = L17_1
                    L3_1[L15_1] = L16_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_539::
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
