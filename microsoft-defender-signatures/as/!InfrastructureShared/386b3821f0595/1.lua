local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1, L63_1, L64_1, L65_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = {}
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
L16_1 = 0
L17_1 = 0
L18_1 = {}
L19_1 = bm
L19_1 = L19_1.get_sig_count
L19_1 = L19_1()
L20_1 = 1
L21_1 = L0_1
L22_1 = 1
for L23_1 = L20_1, L21_1, L22_1 do
  L24_1 = sigattr_tail
  L24_1 = L24_1[L23_1]
  L24_1 = L24_1.attribute
  if L24_1 == 16384 then
    L25_1 = sigattr_tail
    L25_1 = L25_1[L23_1]
    L25_1 = L25_1.utf8p1
    L26_1 = L25_1
    L25_1 = L25_1.lower
    L25_1 = L25_1(L26_1)
    L26_1 = MpCommon
    L26_1 = L26_1.IsSampled
    L27_1 = 40000
    L28_1 = true
    L29_1 = true
    L30_1 = true
    L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
    if L26_1 == true then
      L26_1 = mp
      L26_1 = L26_1.crc32
      L27_1 = 0
      L28_1 = L25_1
      L29_1 = 1
      L30_1 = #L25_1
      L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
      L27_1 = L1_1[L26_1]
      if L27_1 ~= nil then
        L27_1 = table
        L27_1 = L27_1.insert
        L28_1 = L1_1[L26_1]
        L29_1 = L23_1
        L27_1(L28_1, L29_1)
      else
        L27_1 = {}
        L28_1 = L23_1
        L27_1[1] = L28_1
        L1_1[L26_1] = L27_1
        L17_1 = L17_1 + 1
      end
      L27_1 = bm
      L27_1 = L27_1.add_related_string
      L28_1 = "zygorinthal"
      L29_1 = "unchained"
      L30_1 = bm
      L30_1 = L30_1.RelatedStringBMReport
      L27_1(L28_1, L29_1, L30_1)
    else
      L27_1 = L25_1
      L26_1 = L25_1.match
      L28_1 = "%.[^%.]+$"
      L26_1 = L26_1(L27_1, L28_1)
      if L26_1 ~= nil then
        L27_1 = L26_1
        L28_1 = "\""
        L26_1 = L27_1 .. L28_1
        L27_1 = mp
        L27_1 = L27_1.GetExtensionClass
        L28_1 = L26_1
        L27_1 = L27_1(L28_1)
        if L27_1 == 4 then
          L27_1 = isKnownRansomExtension
          L28_1 = L26_1
          L27_1 = L27_1(L28_1)
          if not L27_1 then
            goto lbl_113
          end
        end
        L27_1 = mp
        L27_1 = L27_1.crc32
        L28_1 = 0
        L29_1 = L25_1
        L30_1 = 1
        L31_1 = #L25_1
        L27_1 = L27_1(L28_1, L29_1, L30_1, L31_1)
        L28_1 = L1_1[L27_1]
        if L28_1 ~= nil then
          L28_1 = table
          L28_1 = L28_1.insert
          L29_1 = L1_1[L27_1]
          L30_1 = L23_1
          L28_1(L29_1, L30_1)
        else
          L28_1 = {}
          L29_1 = L23_1
          L28_1[1] = L29_1
          L1_1[L27_1] = L28_1
          L17_1 = L17_1 + 1
        end
      end
    end
  end
  ::lbl_113::
end
if L17_1 < 5 then
  L20_1 = mp
  L20_1 = L20_1.CLEAN
  return L20_1
end
L20_1 = 1
L21_1 = L0_1
L22_1 = 1
for L23_1 = L20_1, L21_1, L22_1 do
  L24_1 = sigattr_tail
  L24_1 = L24_1[L23_1]
  L24_1 = L24_1.attribute
  if L24_1 == 16389 then
    L25_1 = sigattr_tail
    L25_1 = L25_1[L23_1]
    L25_1 = L25_1.utf8p2
    if L25_1 == "ATTR_c09458eb" then
      L25_1 = sigattr_tail
      L25_1 = L25_1[L23_1]
      L25_1 = L25_1.utf8p1
      L26_1 = L25_1
      L25_1 = L25_1.lower
      L25_1 = L25_1(L26_1)
      L26_1 = mp
      L26_1 = L26_1.crc32
      L27_1 = 0
      L28_1 = L25_1
      L29_1 = 1
      L30_1 = #L25_1
      L26_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
      L27_1 = L3_1[L26_1]
      if L27_1 ~= nil then
        L27_1 = table
        L27_1 = L27_1.insert
        L28_1 = L3_1[L26_1]
        L29_1 = L23_1
        L27_1(L28_1, L29_1)
      else
        L27_1 = {}
        L28_1 = L23_1
        L27_1[1] = L28_1
        L3_1[L26_1] = L27_1
      end
      L27_1 = L1_1[L26_1]
      if L27_1 ~= nil then
        L27_1 = string
        L27_1 = L27_1.find
        L28_1 = L25_1
        L29_1 = "\\[^\\]*$"
        L27_1 = L27_1(L28_1, L29_1)
        if not L27_1 then
          L27_1 = 0
        end
        L28_1 = string
        L28_1 = L28_1.find
        L29_1 = L25_1
        L30_1 = "."
        L31_1 = L27_1
        L32_1 = true
        L28_1 = L28_1(L29_1, L30_1, L31_1, L32_1)
        if L28_1 ~= nil then
          L29_1 = string
          L29_1 = L29_1.sub
          L30_1 = L25_1
          L31_1 = L27_1 + 1
          L32_1 = L28_1 - 1
          L29_1 = L29_1(L30_1, L31_1, L32_1)
          if L29_1 ~= nil then
            L30_1 = L4_1[L29_1]
            if L30_1 == nil then
              L30_1 = {}
              L31_1 = L26_1
              L32_1 = L23_1
              L30_1[1] = L31_1
              L30_1[2] = L32_1
              L4_1[L29_1] = L30_1
            else
              L30_1 = table
              L30_1 = L30_1.insert
              L31_1 = L4_1[L29_1]
              L32_1 = L23_1
              L30_1(L31_1, L32_1)
            end
          end
        end
      end
    end
  end
end
L17_1 = 0
L20_1 = {}
L21_1 = 1
L22_1 = L0_1
L23_1 = 1
for L24_1 = L21_1, L22_1, L23_1 do
  L25_1 = sigattr_tail
  L25_1 = L25_1[L24_1]
  L25_1 = L25_1.attribute
  if L25_1 == 16387 then
    L26_1 = sigattr_tail
    L26_1 = L26_1[L24_1]
    L26_1 = L26_1.utf8p1
    L27_1 = L26_1
    L26_1 = L26_1.lower
    L26_1 = L26_1(L27_1)
    L27_1 = mp
    L27_1 = L27_1.crc32
    L28_1 = 0
    L29_1 = L26_1
    L30_1 = 1
    L31_1 = #L26_1
    L27_1 = L27_1(L28_1, L29_1, L30_1, L31_1)
    L28_1 = L1_1[L27_1]
    if L28_1 == nil then
      L28_1 = table
      L28_1 = L28_1.insert
      L29_1 = L2_1
      L30_1 = L24_1
      L28_1(L29_1, L30_1)
    else
      L3_1[L27_1] = nil
    end
    L28_1 = L20_1[L27_1]
    if L28_1 == nil then
      L17_1 = L17_1 + 1
      L20_1[L27_1] = 1
    end
  end
end
if L17_1 < 5 then
  L21_1 = mp
  L21_1 = L21_1.CLEAN
  return L21_1
end
L21_1 = pairs
L22_1 = L2_1
L21_1, L22_1, L23_1 = L21_1(L22_1)
for L24_1, L25_1 in L21_1, L22_1, L23_1 do
  L26_1 = sigattr_tail
  L26_1 = L26_1[L25_1]
  L26_1 = L26_1.utf8p1
  L27_1 = L26_1
  L26_1 = L26_1.lower
  L26_1 = L26_1(L27_1)
  L27_1 = string
  L27_1 = L27_1.find
  L28_1 = L26_1
  L29_1 = "\\[^\\]*$"
  L27_1 = L27_1(L28_1, L29_1)
  if not L27_1 then
    L27_1 = 0
  end
  L28_1 = string
  L28_1 = L28_1.find
  L29_1 = L26_1
  L30_1 = "."
  L31_1 = L27_1
  L32_1 = true
  L28_1 = L28_1(L29_1, L30_1, L31_1, L32_1)
  if L28_1 ~= nil then
    L29_1 = string
    L29_1 = L29_1.sub
    L30_1 = L26_1
    L31_1 = L27_1 + 1
    L32_1 = -1
    L29_1 = L29_1(L30_1, L31_1, L32_1)
    L30_1 = string
    L30_1 = L30_1.sub
    L31_1 = L26_1
    L32_1 = L27_1 + 1
    L33_1 = L28_1 - 1
    L30_1 = L30_1(L31_1, L32_1, L33_1)
    L31_1 = nil
    if L29_1 ~= nil then
      L33_1 = L29_1
      L32_1 = L29_1.match
      L34_1 = "%.[^%.]+$"
      L32_1 = L32_1(L33_1, L34_1)
      L31_1 = L32_1
    end
    if L30_1 ~= nil and L31_1 ~= nil then
      L32_1 = mp
      L32_1 = L32_1.bitand
      L33_1 = mp
      L33_1 = L33_1.GetExtensionClass
      L34_1 = L31_1
      L33_1 = L33_1(L34_1)
      L34_1 = 3
      L32_1 = L32_1(L33_1, L34_1)
      if L32_1 ~= 0 then
        L32_1 = L4_1[L30_1]
        if L32_1 ~= nil then
          L32_1 = L4_1[L30_1]
          L32_1 = L32_1[1]
          L33_1 = L3_1[L32_1]
          if L33_1 ~= nil then
            L33_1 = sigattr_tail
            L34_1 = L3_1[L32_1]
            L34_1 = L34_1[1]
            L33_1 = L33_1[L34_1]
            L33_1 = L33_1.utf8p1
            L34_1 = L33_1
            L33_1 = L33_1.lower
            L33_1 = L33_1(L34_1)
            L34_1 = L1_1[L32_1]
            if L34_1 ~= nil then
              L34_1 = L1_1[L32_1]
              L34_1 = L34_1[1]
              if L34_1 then
                L34_1 = L1_1[L32_1]
                L34_1 = L34_1[1]
                L7_1[L25_1] = L34_1
              end
            end
            L34_1 = #L33_1
            L35_1 = #L26_1
            if L34_1 > L35_1 then
              L35_1 = L33_1
              L34_1 = L33_1.find
              L36_1 = L26_1
              L37_1 = 1
              L38_1 = true
              L34_1 = L34_1(L35_1, L36_1, L37_1, L38_1)
              if L34_1 == 1 then
                L35_1 = L33_1
                L34_1 = L33_1.byte
                L36_1 = #L26_1
                L36_1 = L36_1 + 1
                L34_1 = L34_1(L35_1, L36_1)
                if L34_1 ~= 58 then
                  L34_1 = string
                  L34_1 = L34_1.sub
                  L35_1 = L33_1
                  L36_1 = #L26_1
                  L36_1 = L36_1 + 1
                  L34_1 = L34_1(L35_1, L36_1)
                  L35_1 = L5_1[L34_1]
                  if L35_1 ~= nil then
                    L35_1 = L6_1[L32_1]
                    if L35_1 ~= nil then
                      goto lbl_1008
                    end
                    L6_1[L32_1] = 1
                    L35_1 = table
                    L35_1 = L35_1.insert
                    L36_1 = L5_1[L34_1]
                    L37_1 = L3_1[L32_1]
                    L37_1 = L37_1[1]
                    L35_1(L36_1, L37_1)
                    L35_1 = table
                    L35_1 = L35_1.insert
                    L36_1 = L5_1[L34_1]
                    L37_1 = L25_1
                    L35_1(L36_1, L37_1)
                    L35_1 = L5_1[L34_1]
                    L35_1 = #L35_1
                    if not (10 <= L35_1) then
                      goto lbl_1008
                    end
                    L35_1 = false
                    L36_1 = {}
                    L36_1.count = 0
                    L37_1 = pairs
                    L38_1 = L5_1[L34_1]
                    L37_1, L38_1, L39_1 = L37_1(L38_1)
                    for L40_1, L41_1 in L37_1, L38_1, L39_1 do
                      L42_1 = sysio
                      L42_1 = L42_1.ReadFile
                      L43_1 = sigattr_tail
                      L43_1 = L43_1[L41_1]
                      L43_1 = L43_1.utf8p1
                      L44_1 = 0
                      L45_1 = 4
                      L42_1 = L42_1(L43_1, L44_1, L45_1)
                      if L42_1 ~= nil then
                        L43_1 = L36_1[L42_1]
                        if L43_1 == nil then
                          L36_1[L42_1] = 1
                          L43_1 = L36_1.count
                          L43_1 = L43_1 + 1
                          L36_1.count = L43_1
                        end
                      end
                      L43_1 = L7_1[L41_1]
                      if L43_1 ~= nil and L15_1 == false then
                        L43_1 = sigattr_tail
                        L44_1 = L7_1[L41_1]
                        L43_1 = L43_1[L44_1]
                        L43_1 = L43_1.utf8p2
                        L45_1 = L43_1
                        L44_1 = L43_1.find
                        L46_1 = "RemoteIp:;"
                        L47_1 = 1
                        L48_1 = true
                        L44_1 = L44_1(L45_1, L46_1, L47_1, L48_1)
                        if not L44_1 then
                          L44_1 = string
                          L44_1 = L44_1.find
                          L45_1 = L43_1
                          L46_1 = "RemoteIp"
                          L47_1 = 17
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
                                    L10_1 = L45_1.UsrName
                                    L11_1 = L45_1.Domain
                                    L46_1 = scrubData
                                    L47_1 = L45_1.UsrName
                                    L46_1 = L46_1(L47_1)
                                    L12_1 = L46_1
                                    L46_1 = scrubData
                                    L47_1 = L45_1.Domain
                                    L46_1 = L46_1(L47_1)
                                    L13_1 = L46_1
                                    L16_1 = L45_1.FSize
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
                                      L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1, L63_1, L64_1, L65_1 = L50_1(L51_1, L52_1, L53_1)
                                      L48_1 = L48_1(L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1, L63_1, L64_1, L65_1)
                                      L47_1 = L48_1
                                    end
                                    if L46_1 ~= nil and (L14_1 == "" or L14_1 == L46_1) then
                                      L48_1 = table
                                      L48_1 = L48_1.insert
                                      L49_1 = L9_1
                                      L50_1 = {}
                                      L51_1 = sigattr_tail
                                      L51_1 = L51_1[L41_1]
                                      L51_1 = L51_1.utf8p1
                                      L50_1.path = L51_1
                                      L50_1.magic = L47_1
                                      L50_1.fileSize = L16_1
                                      L48_1(L49_1, L50_1)
                                      L14_1 = L46_1
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
                    L37_1 = L36_1.count
                    if 4 < L37_1 then
                      L35_1 = true
                    end
                    L37_1 = bm
                    L37_1 = L37_1.add_related_string
                    L38_1 = "magic_mismatch"
                    L39_1 = tostring
                    L40_1 = L35_1
                    L39_1 = L39_1(L40_1)
                    L40_1 = bm
                    L40_1 = L40_1.RelatedStringBMReport
                    L37_1(L38_1, L39_1, L40_1)
                    L37_1 = bm
                    L37_1 = L37_1.add_related_string
                    L38_1 = "ransom_extension"
                    L39_1 = L34_1
                    L40_1 = bm
                    L40_1 = L40_1.RelatedStringBMReport
                    L37_1(L38_1, L39_1, L40_1)
                    L37_1 = {}
                    L38_1 = {}
                    L39_1 = {}
                    L40_1 = bm
                    L40_1 = L40_1.get_imagepath
                    L40_1 = L40_1()
                    L41_1 = isnull
                    L42_1 = L40_1
                    L41_1 = L41_1(L42_1)
                    if L41_1 then
                      L40_1 = "NA"
                    else
                      L42_1 = L40_1
                      L41_1 = L40_1.lower
                      L41_1 = L41_1(L42_1)
                      L40_1 = L41_1
                    end
                    L41_1 = bm
                    L41_1 = L41_1.get_current_process_startup_info
                    L41_1 = L41_1()
                    L42_1 = ""
                    if L41_1 ~= nil then
                      L42_1 = L41_1.command_line
                      L41_1 = L41_1.ppid
                    else
                      L41_1 = -1
                    end
                    L37_1.cur_image_path = L40_1
                    L37_1.proc_info = L41_1
                    L37_1.appended_ext = L34_1
                    L37_1.magic_mismatch = L35_1
                    L37_1.sig_count = L19_1
                    L37_1.debug_data = L18_1
                    L43_1 = "FileChain_MainSet:"
                    L44_1 = pairs
                    L45_1 = L5_1[L34_1]
                    L44_1, L45_1, L46_1 = L44_1(L45_1)
                    for L47_1, L48_1 in L44_1, L45_1, L46_1 do
                      L49_1 = sigattr_tail
                      L49_1 = L49_1[L48_1]
                      L49_1 = L49_1.utf8p1
                      L50_1 = string
                      L50_1 = L50_1.find
                      L51_1 = L49_1
                      L52_1 = "\\[^\\]*$"
                      L50_1 = L50_1(L51_1, L52_1)
                      if not L50_1 then
                        L50_1 = 0
                      end
                      L51_1 = string
                      L51_1 = L51_1.find
                      L52_1 = L49_1
                      L53_1 = "."
                      L54_1 = L50_1
                      L55_1 = true
                      L51_1 = L51_1(L52_1, L53_1, L54_1, L55_1)
                      if L51_1 ~= nil then
                        L52_1 = string
                        L52_1 = L52_1.sub
                        L53_1 = L49_1
                        L54_1 = L50_1 + 1
                        L55_1 = L51_1 - 1
                        L52_1 = L52_1(L53_1, L54_1, L55_1)
                        L53_1 = L43_1
                        L54_1 = crypto
                        L54_1 = L54_1.CRC32Buffer
                        L55_1 = -1
                        L56_1 = L52_1
                        L57_1 = 0
                        L58_1 = #L52_1
                        L54_1 = L54_1(L55_1, L56_1, L57_1, L58_1)
                        L43_1 = L53_1 .. L54_1
                        L53_1 = L43_1
                        L54_1 = ";"
                        L55_1 = string
                        L55_1 = L55_1.sub
                        L56_1 = L49_1
                        L57_1 = L51_1 + 1
                        L55_1 = L55_1(L56_1, L57_1)
                        L56_1 = ";"
                        L43_1 = L53_1 .. L54_1 .. L55_1 .. L56_1
                      end
                      L52_1 = table
                      L52_1 = L52_1.insert
                      L53_1 = L38_1
                      L54_1 = sigattr_tail
                      L54_1 = L54_1[L48_1]
                      L54_1 = L54_1.utf8p1
                      L52_1(L53_1, L54_1)
                      L52_1 = nil
                      L53_1 = L7_1[L48_1]
                      if L53_1 ~= nil then
                        L53_1 = sigattr_tail
                        L54_1 = L7_1[L48_1]
                        L53_1 = L53_1[L54_1]
                        if L53_1 ~= nil then
                          L53_1 = sigattr_tail
                          L54_1 = L7_1[L48_1]
                          L53_1 = L53_1[L54_1]
                          L53_1 = L53_1.utf8p1
                          L54_1 = L53_1
                          L53_1 = L53_1.lower
                          L53_1 = L53_1(L54_1)
                          L54_1 = sigattr_tail
                          L55_1 = L7_1[L48_1]
                          L54_1 = L54_1[L55_1]
                          L54_1 = L54_1.utf8p2
                          L55_1 = L54_1
                          L54_1 = L54_1.lower
                          L54_1 = L54_1(L55_1)
                          L55_1 = string
                          L55_1 = L55_1.match
                          L56_1 = L54_1
                          L57_1 = "fsize:(%d+)"
                          L55_1 = L55_1(L56_1, L57_1)
                          L52_1 = L55_1
                          if L52_1 == nil then
                            L52_1 = -1
                          end
                          L55_1 = table
                          L55_1 = L55_1.insert
                          L56_1 = L39_1
                          L57_1 = L53_1
                          L55_1(L56_1, L57_1)
                          L55_1 = table
                          L55_1 = L55_1.insert
                          L56_1 = L39_1
                          L57_1 = L52_1
                          L55_1(L56_1, L57_1)
                        end
                        L53_1 = sigattr_tail
                        L53_1 = L53_1[L48_1]
                        if L53_1 ~= nil then
                          L53_1 = sigattr_tail
                          L53_1 = L53_1[L48_1]
                          L53_1 = L53_1.utf8p1
                          L54_1 = L53_1
                          L53_1 = L53_1.lower
                          L53_1 = L53_1(L54_1)
                          L54_1 = sigattr_tail
                          L54_1 = L54_1[L48_1]
                          L54_1 = L54_1.utf8p2
                          L55_1 = L54_1
                          L54_1 = L54_1.lower
                          L54_1 = L54_1(L55_1)
                          L55_1 = string
                          L55_1 = L55_1.match
                          L56_1 = L54_1
                          L57_1 = "fsize:(%d+)"
                          L55_1 = L55_1(L56_1, L57_1)
                          L52_1 = L55_1
                          if L52_1 == nil then
                            L52_1 = -1
                          end
                          L55_1 = table
                          L55_1 = L55_1.insert
                          L56_1 = L39_1
                          L57_1 = L53_1
                          L55_1(L56_1, L57_1)
                          L55_1 = table
                          L55_1 = L55_1.insert
                          L56_1 = L39_1
                          L57_1 = L52_1
                          L55_1(L56_1, L57_1)
                        end
                      end
                    end
                    L37_1.file_list = L38_1
                    L37_1.file_size = L39_1
                    L44_1 = bm
                    L44_1 = L44_1.get_process_relationships
                    L44_1, L45_1 = L44_1()
                    L46_1 = ipairs
                    L47_1 = L44_1
                    L46_1, L47_1, L48_1 = L46_1(L47_1)
                    for L49_1, L50_1 in L46_1, L47_1, L48_1 do
                      L51_1 = L50_1.image_path
                      if L51_1 ~= nil then
                        L51_1 = bm
                        L51_1 = L51_1.add_related_process
                        L52_1 = L50_1.ppid
                        L51_1(L52_1)
                      end
                    end
                    L46_1 = ipairs
                    L47_1 = L45_1
                    L46_1, L47_1, L48_1 = L46_1(L47_1)
                    for L49_1, L50_1 in L46_1, L47_1, L48_1 do
                      L51_1 = L50_1.image_path
                      if L51_1 ~= nil then
                        L51_1 = bm
                        L51_1 = L51_1.add_related_process
                        L52_1 = L50_1.ppid
                        L51_1(L52_1)
                        L51_1 = TrackPidAndTechniqueBM
                        L52_1 = L50_1.ppid
                        L53_1 = "T1485"
                        L54_1 = "susp_ransomware_childproc_type4"
                        L51_1(L52_1, L53_1, L54_1)
                      end
                    end
                    L46_1 = bm
                    L46_1 = L46_1.add_related_string
                    L47_1 = "ransom_files_main"
                    L48_1 = L43_1
                    L49_1 = bm
                    L49_1 = L49_1.RelatedStringBMReport
                    L46_1(L47_1, L48_1, L49_1)
                    L46_1 = safeJsonSerialize
                    L47_1 = L37_1
                    L46_1 = L46_1(L47_1)
                    L47_1 = bm
                    L47_1 = L47_1.add_related_string
                    L48_1 = "gend_ransom_meta"
                    L49_1 = L46_1
                    L50_1 = bm
                    L50_1 = L50_1.RelatedStringBMReport
                    L47_1(L48_1, L49_1, L50_1)
                    L47_1 = bm
                    L47_1 = L47_1.trigger_sig
                    L48_1 = "GenericRansomware:Type4"
                    L49_1 = L46_1
                    L47_1(L48_1, L49_1)
                    L47_1 = bm
                    L47_1 = L47_1.trigger_sig_delayed
                    L48_1 = "DelayedRansom:Type4"
                    L49_1 = L46_1
                    L50_1 = 10000
                    L47_1(L48_1, L49_1, L50_1)
                    L47_1 = sms_untrusted_process
                    L47_1()
                    L47_1 = bm
                    L47_1 = L47_1.add_action
                    L48_1 = "SmsAsyncScanEvent"
                    L49_1 = 100
                    L47_1(L48_1, L49_1)
                    L47_1 = TrackPidAndTechniqueBM
                    L48_1 = L41_1
                    L49_1 = "T1486"
                    L50_1 = "susp_ransomware_type4"
                    L47_1(L48_1, L49_1, L50_1)
                    L47_1 = reportTimingData
                    L47_1()
                    L47_1 = bm
                    L47_1 = L47_1.add_related_string
                    L48_1 = "sigcount_type4"
                    L49_1 = L19_1
                    L50_1 = bm
                    L50_1 = L50_1.RelatedStringBMReport
                    L47_1(L48_1, L49_1, L50_1)
                    L47_1 = reportSessionInformationInclusive
                    L47_1()
                    L47_1 = pcall
                    L48_1 = reportBmInfo
                    L47_1, L48_1 = L47_1(L48_1)
                    if not L47_1 and L48_1 then
                      L49_1 = bm
                      L49_1 = L49_1.add_related_string
                      L50_1 = "bmInfoFailReason"
                      L51_1 = tostring
                      L52_1 = L48_1
                      L51_1 = L51_1(L52_1)
                      L52_1 = bm
                      L52_1 = L52_1.RelatedStringBMReport
                      L49_1(L50_1, L51_1, L52_1)
                    end
                    if L15_1 == false then
                      L49_1 = #L9_1
                      if 0 < L49_1 and L14_1 ~= nil and L14_1 ~= "" then
                        L49_1 = mp
                        L49_1 = L49_1.GetExtensionClass
                        L50_1 = L34_1
                        L49_1 = L49_1(L50_1)
                        L50_1 = isnull
                        L51_1 = L49_1
                        L50_1 = L50_1(L51_1)
                        if L50_1 then
                          L49_1 = 1000
                        end
                        L50_1 = nil
                        L51_1 = nil
                        L52_1 = MpCommon
                        L52_1 = L52_1.GetBehavioralNetworkBlocksSettings
                        if L52_1 then
                          L52_1 = pcall
                          L53_1 = MpCommon
                          L53_1 = L53_1.GetBehavioralNetworkBlocksSettings
                          L54_1 = MpCommon
                          L54_1 = L54_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
                          L52_1, L53_1 = L52_1(L53_1, L54_1)
                          L51_1 = L53_1
                          L50_1 = L52_1
                        end
                        if not L50_1 or L51_1 == nil then
                          L52_1 = {}
                          L52_1.State = 0
                          L52_1.MaxTimeout = 0
                          L52_1.Exclusions = ""
                          L52_1.AggressiveLevel = 0
                          L52_1.Plugins = 0
                          L51_1 = L52_1
                        end
                        L52_1 = {}
                        L52_1.Extension = L34_1
                        L52_1.ExtensionClass = L49_1
                        L52_1.imagePath = L40_1
                        L52_1.commandLine = L42_1
                        L52_1.ppID = L41_1
                        L52_1.UserName = L12_1
                        L52_1.Domain = L13_1
                        L52_1.file_list = L9_1
                        L52_1.Type = "Type4"
                        L52_1.RemoteEncConfig = L51_1
                        L8_1 = L52_1
                        L52_1 = safeJsonSerialize
                        L53_1 = L8_1
                        L52_1 = L52_1(L53_1)
                        L53_1 = bm
                        L53_1 = L53_1.add_related_string
                        L54_1 = "RemoteClientData"
                        L55_1 = L52_1
                        L56_1 = bm
                        L56_1 = L56_1.RelatedStringBMReport
                        L53_1(L54_1, L55_1, L56_1)
                        L53_1 = bm
                        L53_1 = L53_1.trigger_sig
                        L54_1 = "RemoteGenericRansomware:Type4"
                        L55_1 = L52_1
                        L53_1(L54_1, L55_1)
                        L53_1 = pcall
                        L54_1 = updateSystemDNSServers
                        L53_1, L54_1 = L53_1(L54_1)
                        if not L53_1 then
                          L55_1 = bm
                          L55_1 = L55_1.add_related_string
                          L56_1 = "updateSystemDNSServers_fail"
                          L57_1 = L54_1
                          L58_1 = bm
                          L58_1 = L58_1.RelatedStringBMReport
                          L55_1(L56_1, L57_1, L58_1)
                        end
                        L55_1 = pcall
                        L56_1 = updateDomainInfo
                        L55_1, L56_1, L57_1, L58_1 = L55_1(L56_1)
                        if L55_1 then
                          L59_1 = GetRollingQueueKeyValue
                          L60_1 = "domainInfo"
                          L61_1 = L14_1
                          L59_1 = L59_1(L60_1, L61_1)
                          L8_1.ipTypeFlags = L59_1
                        else
                          L59_1 = bm
                          L59_1 = L59_1.add_related_string
                          L60_1 = "updateDomainInfo_fail"
                          L61_1 = L56_1
                          L62_1 = bm
                          L62_1 = L62_1.RelatedStringBMReport
                          L59_1(L60_1, L61_1, L62_1)
                        end
                        L59_1 = SafeGetUrlReputation
                        L60_1 = {}
                        L61_1 = L14_1
                        L60_1[1] = L61_1
                        L61_1 = {}
                        L61_1.SIG_CONTEXT = "BM"
                        L61_1.CONTEXT_SOURCE = "GenRansom3"
                        L61_1.TAG = "NOLOOKUP"
                        L62_1 = safeJsonSerialize
                        L63_1 = L8_1
                        L62_1 = L62_1(L63_1)
                        L61_1.data = L62_1
                        L62_1 = false
                        L63_1 = 3000
                        L64_1 = false
                        L59_1 = L59_1(L60_1, L61_1, L62_1, L63_1, L64_1)
                        if L59_1 then
                          L60_1 = L59_1.error
                          if L60_1 == 3 then
                            L8_1.CRReportError = "Failed the first attempt"
                            L60_1 = SafeGetUrlReputation
                            L61_1 = {}
                            L62_1 = L14_1
                            L61_1[1] = L62_1
                            L62_1 = {}
                            L62_1.SIG_CONTEXT = "BM"
                            L62_1.CONTEXT_SOURCE = "GenRansom3"
                            L62_1.TAG = "NOLOOKUP"
                            L63_1 = safeJsonSerialize
                            L64_1 = L8_1
                            L63_1 = L63_1(L64_1)
                            L62_1.data = L63_1
                            L63_1 = false
                            L64_1 = 3000
                            L65_1 = false
                            L60_1 = L60_1(L61_1, L62_1, L63_1, L64_1, L65_1)
                            L59_1 = L60_1
                          end
                        end
                        L60_1 = L59_1.urls
                        L60_1 = L60_1[L14_1]
                        if L60_1 then
                          L60_1 = L59_1.urls
                          L60_1 = L60_1[L14_1]
                          L60_1 = L60_1.determination
                          if L60_1 ~= 2 then
                            L60_1 = L59_1.urls
                            L60_1 = L60_1[L14_1]
                            L60_1 = L60_1.determination
                            if L60_1 ~= 1 then
                              goto lbl_997
                            end
                          end
                          L60_1 = L59_1.urls
                          L60_1 = L60_1[L14_1]
                          L60_1 = L60_1.confidence
                          if L60_1 then
                            L60_1 = L59_1.urls
                            L60_1 = L60_1[L14_1]
                            L60_1 = L60_1.confidence
                            if 50 <= L60_1 then
                              L60_1 = L59_1.urls
                              L60_1 = L60_1[L14_1]
                              L60_1 = L60_1.context
                              L60_1 = L60_1.Source
                              if L60_1 == "GenRansom" then
                                L60_1 = L59_1.urls
                                L60_1 = L60_1[L14_1]
                                L60_1 = L60_1.confidence
                                L8_1.confidence = L60_1
                                L60_1 = L59_1.urls
                                L60_1 = L60_1[L14_1]
                                L60_1 = L60_1.context
                                L60_1 = L60_1.Family
                                L8_1.family = L60_1
                                L60_1 = L59_1.urls
                                L60_1 = L60_1[L14_1]
                                L60_1 = L60_1.determination
                                L8_1.determination = L60_1
                                L60_1 = {}
                                L61_1 = L59_1.urls
                                L61_1 = L61_1[L14_1]
                                L61_1 = L61_1.context
                                L61_1 = L61_1.action
                                L60_1.action = L61_1
                                L61_1 = L59_1.urls
                                L61_1 = L61_1[L14_1]
                                L61_1 = L61_1.context
                                L61_1 = L61_1.action_parameter
                                L60_1.parameter = L61_1
                                L61_1 = L59_1.urls
                                L61_1 = L61_1[L14_1]
                                L61_1 = L61_1.context
                                L61_1 = L61_1.action_ttl
                                L60_1.ttl = L61_1
                                L8_1.action = L60_1
                                L8_1.ip = L14_1
                                L61_1 = L59_1.urls
                                L61_1 = L61_1[L14_1]
                                L61_1 = L61_1.context
                                L8_1.context = L61_1
                                L8_1.unscrubbed_username = L10_1
                                L8_1.unscrubbed_domain = L11_1
                                L61_1 = bm
                                L61_1 = L61_1.trigger_sig
                                L62_1 = "RemoteGenericRansomware:Malware"
                                L63_1 = safeJsonSerialize
                                L64_1 = L8_1
                                L63_1, L64_1, L65_1 = L63_1(L64_1)
                                L61_1(L62_1, L63_1, L64_1, L65_1)
                              end
                            end
                          end
                        end
                      end
                    end
                    ::lbl_997::
                    L49_1 = mp
                    L49_1 = L49_1.INFECTED
                    return L49_1
                  else
                    L35_1 = {}
                    L36_1 = L3_1[L32_1]
                    L36_1 = L36_1[1]
                    L37_1 = L25_1
                    L35_1[1] = L36_1
                    L35_1[2] = L37_1
                    L5_1[L34_1] = L35_1
                    L6_1[L32_1] = 1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_1008::
end
L21_1 = mp
L21_1 = L21_1.CLEAN
return L21_1
