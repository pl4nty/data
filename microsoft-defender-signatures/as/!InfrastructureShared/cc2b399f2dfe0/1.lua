local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = 5
L4_1 = 1
L5_1 = L0_1
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = sigattr_tail
  L8_1 = L8_1[L7_1]
  L8_1 = L8_1.utf8p2
  L9_1 = sigattr_tail
  L9_1 = L9_1[L7_1]
  L9_1 = L9_1.attribute
  if L9_1 == 16385 then
    L9_1 = sigattr_tail
    L9_1 = L9_1[L7_1]
    L9_1 = L9_1.utf8p1
    if L9_1 then
      L9_1 = sigattr_tail
      L9_1 = L9_1[L7_1]
      L9_1 = L9_1.utf8p1
      L10_1 = L9_1
      L9_1 = L9_1.byte
      L11_1 = 1
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 ~= 37 then
        L10_1 = L8_1
        L9_1 = L8_1.find
        L11_1 = "TotalSizeAppend:0"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 == nil then
          L9_1 = sigattr_tail
          L9_1 = L9_1[L7_1]
          L9_1 = L9_1.utf8p1
          L10_1 = L9_1
          L9_1 = L9_1.lower
          L9_1 = L9_1(L10_1)
          L11_1 = L9_1
          L10_1 = L9_1.match
          L12_1 = "[^\\]+$"
          L10_1 = L10_1(L11_1, L12_1)
          if L10_1 ~= nil then
            L12_1 = L10_1
            L11_1 = L10_1.match
            L13_1 = "%.[^%.]+$"
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 ~= nil then
              L12_1 = L2_1[L9_1]
              if L12_1 == nil then
                L2_1[L9_1] = L7_1
                L12_1 = {}
                L13_1 = string
                L13_1 = L13_1.gmatch
                L14_1 = L8_1
                L15_1 = "(%w+):(%w+)"
                L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
                for L16_1, L17_1 in L13_1, L14_1, L15_1 do
                  L12_1[L16_1] = L17_1
                end
                L13_1 = tonumber
                L14_1 = L12_1.NumWrites
                L13_1 = L13_1(L14_1)
                L14_1 = tonumber
                L15_1 = L12_1.TotalSizeWrite
                L14_1 = L14_1(L15_1)
                L15_1 = tonumber
                L16_1 = L12_1.TotalSizeAppend
                L15_1 = L15_1(L16_1)
                if L13_1 ~= nil and L14_1 ~= nil and L15_1 ~= nil and 0 < L13_1 and 0 < L14_1 and L14_1 > L15_1 and 5 < L15_1 and L15_1 < 2000 then
                  L16_1 = L1_1[L15_1]
                  if L16_1 ~= nil then
                    L16_1 = table
                    L16_1 = L16_1.insert
                    L17_1 = L1_1[L15_1]
                    L18_1 = L7_1
                    L16_1(L17_1, L18_1)
                  else
                    L16_1 = {}
                    L17_1 = L7_1
                    L16_1[1] = L17_1
                    L1_1[L15_1] = L16_1
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
L4_1 = ""
L5_1 = false
L6_1 = {}
L7_1 = {}
L8_1 = ""
L9_1 = ""
L10_1 = ""
L11_1 = ""
L12_1 = 0
L13_1 = 0
L14_1 = pairs
L15_1 = L1_1
L14_1, L15_1, L16_1 = L14_1(L15_1)
for L17_1, L18_1 in L14_1, L15_1, L16_1 do
  L19_1 = #L18_1
  if L3_1 <= L19_1 then
    L20_1 = {}
    L21_1 = {}
    L22_1 = 1
    L23_1 = L19_1
    L24_1 = 1
    for L25_1 = L22_1, L23_1, L24_1 do
      L26_1 = L1_1[L17_1]
      L26_1 = L26_1[L25_1]
      L27_1 = sigattr_tail
      L27_1 = L27_1[L26_1]
      L27_1 = L27_1.utf8p2
      L28_1 = {}
      L29_1 = {}
      L30_1 = string
      L30_1 = L30_1.gmatch
      L31_1 = L27_1
      L32_1 = "(%w+):(%w+)"
      L30_1, L31_1, L32_1 = L30_1(L31_1, L32_1)
      for L33_1, L34_1 in L30_1, L31_1, L32_1 do
        L28_1[L33_1] = L34_1
      end
      L30_1 = math_floor
      L31_1 = tonumber
      L32_1 = L28_1.TotalSizeWrite
      L31_1 = L31_1(L32_1)
      L32_1 = tonumber
      L33_1 = L28_1.TotalSizeAppend
      L32_1 = L32_1(L33_1)
      L31_1 = L31_1 - L32_1
      L32_1 = tonumber
      L33_1 = L28_1.NumWrites
      L32_1 = L32_1(L33_1)
      L31_1 = L31_1 / L32_1
      L30_1 = L30_1(L31_1)
      L29_1.block_size = L30_1
      L30_1 = sigattr_tail
      L30_1 = L30_1[L26_1]
      L30_1 = L30_1.utf8p1
      L29_1.path = L30_1
      L30_1 = 1
      L31_1 = L0_1
      L32_1 = 1
      for L33_1 = L30_1, L31_1, L32_1 do
        L34_1 = sigattr_tail
        L34_1 = L34_1[L33_1]
        L34_1 = L34_1.attribute
        if L34_1 == 16386 then
          L34_1 = sigattr_tail
          L34_1 = L34_1[L33_1]
          L34_1 = L34_1.utf8p1
          L35_1 = L34_1
          L34_1 = L34_1.byte
          L36_1 = 1
          L34_1 = L34_1(L35_1, L36_1)
          if L34_1 ~= 37 then
            L34_1 = sigattr_tail
            L34_1 = L34_1[L33_1]
            L34_1 = L34_1.utf8p2
            L35_1 = sigattr_tail
            L35_1 = L35_1[L26_1]
            L35_1 = L35_1.utf8p1
            if L34_1 == L35_1 then
              L34_1 = sigattr_tail
              L34_1 = L34_1[L33_1]
              L34_1 = L34_1.utf8p1
              L29_1.renamed_path = L34_1
              L34_1 = sigattr_tail
              L34_1 = L34_1[L33_1]
              L34_1 = L34_1.utf8p1
              L35_1 = L34_1
              L34_1 = L34_1.lower
              L34_1 = L34_1(L35_1)
              L35_1 = sigattr_tail
              L35_1 = L35_1[L33_1]
              L35_1 = L35_1.utf8p2
              L36_1 = L35_1
              L35_1 = L35_1.lower
              L35_1 = L35_1(L36_1)
              L37_1 = L34_1
              L36_1 = L34_1.match
              L38_1 = "(.*[/\\])"
              L36_1 = L36_1(L37_1, L38_1)
              L37_1 = L36_1
              L36_1 = L36_1.lower
              L36_1 = L36_1(L37_1)
              L38_1 = L35_1
              L37_1 = L35_1.match
              L39_1 = "(.*[/\\])"
              L37_1 = L37_1(L38_1, L39_1)
              L38_1 = L37_1
              L37_1 = L37_1.lower
              L37_1 = L37_1(L38_1)
              if L36_1 == L37_1 then
                L39_1 = L34_1
                L38_1 = L34_1.find
                L40_1 = L35_1
                L41_1 = 1
                L42_1 = true
                L38_1 = L38_1(L39_1, L40_1, L41_1, L42_1)
                if L38_1 == 1 then
                  L39_1 = L34_1
                  L38_1 = L34_1.byte
                  L40_1 = #L35_1
                  L40_1 = L40_1 + 1
                  L38_1 = L38_1(L39_1, L40_1)
                  if L38_1 ~= 58 then
                    L39_1 = L34_1
                    L38_1 = L34_1.match
                    L40_1 = "%.[^%.]+$"
                    L38_1 = L38_1(L39_1, L40_1)
                    if L38_1 then
                      L39_1 = mp
                      L39_1 = L39_1.GetExtensionClass
                      L40_1 = L38_1
                      L39_1 = L39_1(L40_1)
                      if L39_1 ~= 4 then
                        L39_1 = string
                        L39_1 = L39_1.sub
                        L40_1 = L34_1
                        L41_1 = #L35_1
                        L41_1 = L41_1 + 1
                        L39_1 = L39_1(L40_1, L41_1)
                        L40_1 = L6_1[L39_1]
                        if L40_1 ~= nil then
                          L40_1 = table
                          L40_1 = L40_1.insert
                          L41_1 = L6_1[L39_1]
                          L42_1 = L33_1
                          L40_1(L41_1, L42_1)
                        else
                          L40_1 = {}
                          L41_1 = L33_1
                          L40_1[1] = L41_1
                          L6_1[L39_1] = L40_1
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
      if L12_1 < 5 then
        L30_1 = table
        L30_1 = L30_1.insert
        L31_1 = L20_1
        L32_1 = L29_1
        L30_1(L31_1, L32_1)
        L12_1 = L12_1 + 1
      end
      L30_1 = sigattr_tail
      L30_1 = L30_1[L26_1]
      L30_1 = L30_1.utf8p2
      L31_1 = #L30_1
      if 136 < L31_1 then
        L31_1 = string
        L31_1 = L31_1.find
        L32_1 = L30_1
        L33_1 = "RemoteIp"
        L34_1 = 100
        L35_1 = true
        L31_1 = L31_1(L32_1, L33_1, L34_1, L35_1)
        if L31_1 ~= nil then
          L32_1 = #L30_1
          L32_1 = L32_1 - L31_1
          if 20 < L32_1 then
            L32_1 = {}
            L33_1 = string
            L33_1 = L33_1.gmatch
            L34_1 = L30_1
            L35_1 = "(%w+):([^;]+)"
            L33_1, L34_1, L35_1 = L33_1(L34_1, L35_1)
            for L36_1, L37_1 in L33_1, L34_1, L35_1 do
              L32_1[L36_1] = L37_1
            end
            L33_1 = L32_1.UsrName
            if L33_1 ~= nil then
              L33_1 = L32_1.Domain
              if L33_1 ~= nil then
                L33_1 = L32_1.RemoteIp
                if L33_1 ~= nil then
                  L11_1 = L32_1.UsrName
                  L9_1 = L32_1.Domain
                  L33_1 = scrubData
                  L34_1 = L32_1.UsrName
                  L33_1 = L33_1(L34_1)
                  L8_1 = L33_1
                  L33_1 = scrubData
                  L34_1 = L32_1.Domain
                  L33_1 = L33_1(L34_1)
                  L10_1 = L33_1
                  L33_1 = string
                  L33_1 = L33_1.match
                  L34_1 = L32_1.RemoteIp
                  L35_1 = "(.*):(.*)"
                  L33_1 = L33_1(L34_1, L35_1)
                  L34_1 = L32_1.FSize
                  if L34_1 == nil then
                    L35_1 = sysio
                    L35_1 = L35_1.GetFileSize
                    L36_1 = sigattr_tail
                    L36_1 = L36_1[L26_1]
                    L36_1 = L36_1.utf8p1
                    L35_1 = L35_1(L36_1)
                    L34_1 = L35_1
                  end
                  L35_1 = "NA"
                  L36_1 = -1
                  if L34_1 ~= nil and 256 < L34_1 then
                    L37_1 = sysio
                    L37_1 = L37_1.ReadFile
                    L38_1 = sigattr_tail
                    L38_1 = L38_1[L26_1]
                    L38_1 = L38_1.utf8p1
                    L39_1 = 0
                    L40_1 = 256
                    L37_1 = L37_1(L38_1, L39_1, L40_1)
                    if L37_1 ~= nil then
                      L38_1 = string
                      L38_1 = L38_1.format
                      L39_1 = "0x%02X%02X%02X%02X"
                      L40_1 = string
                      L40_1 = L40_1.byte
                      L41_1 = L37_1
                      L42_1 = 1
                      L43_1 = 4
                      L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1 = L40_1(L41_1, L42_1, L43_1)
                      L38_1 = L38_1(L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1)
                      L35_1 = L38_1
                      L38_1 = crypto
                      L38_1 = L38_1.ComputeEntropy
                      L39_1 = L37_1
                      L38_1 = L38_1(L39_1)
                      L36_1 = L38_1
                    end
                  end
                  if L33_1 ~= nil and (L4_1 == "" or L4_1 == L33_1) then
                    if L13_1 < 5 then
                      L37_1 = table
                      L37_1 = L37_1.insert
                      L38_1 = L7_1
                      L39_1 = {}
                      L40_1 = sigattr_tail
                      L40_1 = L40_1[L26_1]
                      L40_1 = L40_1.utf8p1
                      L39_1.path = L40_1
                      L39_1.magic = L35_1
                      L39_1.fileSize = L34_1
                      L39_1.entropy = L36_1
                      L37_1(L38_1, L39_1)
                      L13_1 = L13_1 + 1
                    end
                    L4_1 = L33_1
                  else
                    L5_1 = true
                  end
                end
              end
            end
          end
        end
      end
    end
    L22_1 = ""
    L23_1 = pairs
    L24_1 = L6_1
    L23_1, L24_1, L25_1 = L23_1(L24_1)
    for L26_1, L27_1 in L23_1, L24_1, L25_1 do
      L28_1 = false
      L29_1 = {}
      L29_1.count = 0
      L30_1 = "FileChain_MainSet:"
      L22_1 = L26_1
      L31_1 = L6_1[L22_1]
      L31_1 = #L31_1
      if 4 < L31_1 then
        L31_1 = pairs
        L32_1 = L27_1
        L31_1, L32_1, L33_1 = L31_1(L32_1)
        for L34_1, L35_1 in L31_1, L32_1, L33_1 do
          L36_1 = sysio
          L36_1 = L36_1.ReadFile
          L37_1 = sigattr_tail
          L37_1 = L37_1[L35_1]
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
          L37_1 = sigattr_tail
          L37_1 = L37_1[L35_1]
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
            L41_1 = L30_1
            L42_1 = crypto
            L42_1 = L42_1.CRC32Buffer
            L43_1 = -1
            L44_1 = L40_1
            L45_1 = 0
            L46_1 = #L40_1
            L42_1 = L42_1(L43_1, L44_1, L45_1, L46_1)
            L30_1 = L41_1 .. L42_1
            L41_1 = L30_1
            L42_1 = ";"
            L43_1 = string
            L43_1 = L43_1.sub
            L44_1 = L37_1
            L45_1 = L39_1 + 1
            L43_1 = L43_1(L44_1, L45_1)
            L44_1 = ";"
            L30_1 = L41_1 .. L42_1 .. L43_1 .. L44_1
          end
          L40_1 = sigattr_tail
          L40_1 = L40_1[L35_1]
          L37_1 = L40_1.utf8p2
          L40_1 = string
          L40_1 = L40_1.find
          L41_1 = L37_1
          L42_1 = "\\[^\\]*$"
          L40_1 = L40_1(L41_1, L42_1)
          L38_1 = L40_1 or L38_1
          if not L40_1 then
            L38_1 = 0
          end
          L40_1 = string
          L40_1 = L40_1.find
          L41_1 = L37_1
          L42_1 = "."
          L43_1 = L38_1
          L44_1 = true
          L40_1 = L40_1(L41_1, L42_1, L43_1, L44_1)
          L39_1 = L40_1
          if L39_1 ~= nil then
            L40_1 = string
            L40_1 = L40_1.sub
            L41_1 = L37_1
            L42_1 = L38_1 + 1
            L43_1 = L39_1 - 1
            L40_1 = L40_1(L41_1, L42_1, L43_1)
            L41_1 = L30_1
            L42_1 = crypto
            L42_1 = L42_1.CRC32Buffer
            L43_1 = -1
            L44_1 = L40_1
            L45_1 = 0
            L46_1 = #L40_1
            L42_1 = L42_1(L43_1, L44_1, L45_1, L46_1)
            L30_1 = L41_1 .. L42_1
            L41_1 = L30_1
            L42_1 = ";"
            L43_1 = string
            L43_1 = L43_1.sub
            L44_1 = L37_1
            L45_1 = L39_1 + 1
            L43_1 = L43_1(L44_1, L45_1)
            L44_1 = ";"
            L30_1 = L41_1 .. L42_1 .. L43_1 .. L44_1
          end
        end
        L31_1 = L29_1.count
        if 4 < L31_1 then
          L28_1 = true
        end
        L31_1 = bm
        L31_1 = L31_1.add_related_string
        L32_1 = "magic_mismatch"
        L33_1 = tostring
        L34_1 = L28_1
        L33_1 = L33_1(L34_1)
        L34_1 = bm
        L34_1 = L34_1.RelatedStringBMReport
        L31_1(L32_1, L33_1, L34_1)
        L31_1 = bm
        L31_1 = L31_1.add_related_string
        L32_1 = "ransom_files_main"
        L33_1 = L30_1
        L34_1 = bm
        L34_1 = L34_1.RelatedStringBMReport
        L31_1(L32_1, L33_1, L34_1)
        L31_1 = bm
        L31_1 = L31_1.add_related_string
        L32_1 = "ransom_extension"
        L33_1 = L22_1
        L34_1 = bm
        L34_1 = L34_1.RelatedStringBMReport
        L31_1(L32_1, L33_1, L34_1)
        break
      end
    end
    L23_1 = string
    L23_1 = L23_1.lower
    L24_1 = MpCommon
    L24_1 = L24_1.PathToWin32Path
    L25_1 = bm
    L25_1 = L25_1.get_imagepath
    L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1 = L25_1()
    L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1 = L24_1(L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1)
    L23_1 = L23_1(L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1)
    L24_1 = false
    L25_1 = -1
    L26_1 = -1
    L27_1 = -1
    L28_1 = -1
    L29_1 = isnull
    L30_1 = L23_1
    L29_1 = L29_1(L30_1)
    if not L29_1 then
      L29_1 = MpCommon
      L29_1 = L29_1.QueryPersistContext
      L30_1 = L23_1
      L31_1 = "NewPECreatedNoCert"
      L29_1 = L29_1(L30_1, L31_1)
      L24_1 = L29_1
      L29_1 = MpCommon
      L29_1 = L29_1.GetPersistContext
      L30_1 = L23_1
      L29_1 = L29_1(L30_1)
      L28_1 = L29_1
      if L28_1 ~= nil then
        L29_1 = ipairs
        L30_1 = L28_1
        L29_1, L30_1, L31_1 = L29_1(L30_1)
        for L32_1, L33_1 in L29_1, L30_1, L31_1 do
          L34_1 = tonumber
          L35_1 = string
          L35_1 = L35_1.match
          L36_1 = L33_1
          L37_1 = "^Age:([0-9]+)$"
          L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1 = L35_1(L36_1, L37_1)
          L34_1 = L34_1(L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1)
          if L34_1 ~= nil and L25_1 < L34_1 then
            L25_1 = L34_1
          end
          L35_1 = tonumber
          L36_1 = string
          L36_1 = L36_1.match
          L37_1 = L33_1
          L38_1 = "^Prevalence:([0-9]+)$"
          L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1 = L36_1(L37_1, L38_1)
          L35_1 = L35_1(L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1)
          if L35_1 ~= nil and L27_1 < L35_1 then
            L27_1 = L35_1
          end
        end
      end
      L29_1 = sysio
      L29_1 = L29_1.GetFileLastWriteTime
      L30_1 = L23_1
      L29_1 = L29_1(L30_1)
      L26_1 = L29_1
      L29_1 = sysio
      L29_1 = L29_1.GetLastResult
      L29_1 = L29_1()
      L29_1 = L29_1.Success
      if L29_1 and L26_1 ~= 0 then
        L29_1 = MpCommon
        L29_1 = L29_1.GetCurrentTimeT
        L29_1 = L29_1()
        L30_1 = L26_1 / 10000000
        L30_1 = L30_1 - 11644473600
        L26_1 = L29_1 - L30_1
      else
        L26_1 = -1
      end
    else
      L23_1 = ""
    end
    L29_1 = ""
    L30_1 = ""
    L31_1 = bm
    L31_1 = L31_1.get_current_process_startup_info
    L31_1 = L31_1()
    if L31_1 ~= nil then
      L29_1 = L31_1.command_line
      L30_1 = L31_1.ppid
    else
      L31_1 = -1
    end
    L32_1 = {}
    L32_1.cur_image_path = L23_1
    L32_1.cmd_line = L29_1
    L32_1.newpe_nocert = L24_1
    L32_1.elapsed_time = L26_1
    L32_1.file_age = L25_1
    L32_1.file_prevlence = L27_1
    L21_1.appended_ext = L22_1
    L21_1.append_size = L17_1
    L21_1.file_paths = L20_1
    L21_1.proc_meta_info = L32_1
    L33_1 = safeJsonSerialize
    L34_1 = L21_1
    L33_1 = L33_1(L34_1)
    L34_1 = bm
    L34_1 = L34_1.add_related_string
    L35_1 = "genfa_ransom_meta"
    L36_1 = L33_1
    L37_1 = bm
    L37_1 = L37_1.RelatedStringBMReport
    L34_1(L35_1, L36_1, L37_1)
    L34_1 = bm
    L34_1 = L34_1.trigger_sig
    L35_1 = "GenericRansomware:FileAppend"
    L36_1 = L33_1
    L34_1(L35_1, L36_1)
    L34_1 = reportTimingData
    L34_1()
    L34_1 = sms_untrusted_process
    L34_1()
    if L5_1 == false then
      L34_1 = #L7_1
      if 0 < L34_1 and L4_1 ~= nil and L4_1 ~= "" then
        L34_1 = 1000
        L35_1 = isnull
        L36_1 = L22_1
        L35_1 = L35_1(L36_1)
        if not L35_1 then
          L35_1 = mp
          L35_1 = L35_1.GetExtensionClass
          L36_1 = L22_1
          L35_1 = L35_1(L36_1)
          L34_1 = L35_1
        end
        L35_1 = nil
        L36_1 = nil
        L37_1 = MpCommon
        L37_1 = L37_1.GetBehavioralNetworkBlocksSettings
        if L37_1 then
          L37_1 = pcall
          L38_1 = MpCommon
          L38_1 = L38_1.GetBehavioralNetworkBlocksSettings
          L39_1 = MpCommon
          L39_1 = L39_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
          L37_1, L38_1 = L37_1(L38_1, L39_1)
          L36_1 = L38_1
          L35_1 = L37_1
        end
        if not L35_1 or L36_1 == nil then
          L37_1 = {}
          L38_1 = MpCommon
          L38_1 = L38_1.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
          L37_1.State = L38_1
          L37_1.MaxTimeout = 0
          L37_1.Exclusions = ""
          L37_1.AggressiveLevel = 0
          L36_1 = L37_1
        end
        L37_1 = {}
        L37_1.AppendedSize = L17_1
        L37_1.Extension = L22_1
        L37_1.ExtensionClass = L34_1
        L37_1.imagePath = L23_1
        L37_1.commandLine = L29_1
        L37_1.ppID = L30_1
        L37_1.UserName = L8_1
        L37_1.Domain = L10_1
        L37_1.file_list = L7_1
        L37_1.Type = "Type1"
        L37_1.RemoteEncConfig = L36_1
        L38_1 = safeJsonSerialize
        L39_1 = L37_1
        L38_1 = L38_1(L39_1)
        L39_1 = bm
        L39_1 = L39_1.add_related_string
        L40_1 = "RemoteClientData"
        L41_1 = L38_1
        L42_1 = bm
        L42_1 = L42_1.RelatedStringBMReport
        L39_1(L40_1, L41_1, L42_1)
        L39_1 = pcall
        L40_1 = updateSystemDNSServers
        L39_1, L40_1 = L39_1(L40_1)
        if not L39_1 then
          L41_1 = bm
          L41_1 = L41_1.add_related_string
          L42_1 = "updateSystemDNSServers_fail"
          L43_1 = L40_1
          L44_1 = bm
          L44_1 = L44_1.RelatedStringBMReport
          L41_1(L42_1, L43_1, L44_1)
        end
        L41_1 = pcall
        L42_1 = updateDomainInfo
        L41_1, L42_1, L43_1, L44_1 = L41_1(L42_1)
        if L41_1 then
          L45_1 = GetRollingQueueKeyValue
          L46_1 = "domainInfo"
          L47_1 = L4_1
          L45_1 = L45_1(L46_1, L47_1)
          L37_1.ipTypeFlags = L45_1
        else
          L45_1 = bm
          L45_1 = L45_1.add_related_string
          L46_1 = "updateDomainInfo_fail"
          L47_1 = L42_1
          L48_1 = bm
          L48_1 = L48_1.RelatedStringBMReport
          L45_1(L46_1, L47_1, L48_1)
        end
        L45_1 = SafeGetUrlReputation
        L46_1 = {}
        L47_1 = L4_1
        L46_1[1] = L47_1
        L47_1 = {}
        L47_1.SIG_CONTEXT = "BM"
        L47_1.CONTEXT_SOURCE = "GenRansom3"
        L47_1.TAG = "NOLOOKUP"
        L48_1 = safeJsonSerialize
        L49_1 = L37_1
        L48_1 = L48_1(L49_1)
        L47_1.data = L48_1
        L48_1 = false
        L49_1 = 3000
        L50_1 = false
        L45_1 = L45_1(L46_1, L47_1, L48_1, L49_1, L50_1)
        if L45_1 then
          L46_1 = L45_1.error
          if L46_1 == 3 then
            L37_1.CRReportError = "Failed the first attempt"
            L46_1 = SafeGetUrlReputation
            L47_1 = {}
            L48_1 = L4_1
            L47_1[1] = L48_1
            L48_1 = {}
            L48_1.SIG_CONTEXT = "BM"
            L48_1.CONTEXT_SOURCE = "GenRansom3"
            L48_1.TAG = "NOLOOKUP"
            L49_1 = safeJsonSerialize
            L50_1 = L37_1
            L49_1 = L49_1(L50_1)
            L48_1.data = L49_1
            L49_1 = false
            L50_1 = 3000
            L51_1 = false
            L46_1 = L46_1(L47_1, L48_1, L49_1, L50_1, L51_1)
            L45_1 = L46_1
          end
        end
        L46_1 = L45_1.urls
        L46_1 = L46_1[L4_1]
        if L46_1 then
          L46_1 = L45_1.urls
          L46_1 = L46_1[L4_1]
          L46_1 = L46_1.determination
          if L46_1 ~= 2 then
            L46_1 = L45_1.urls
            L46_1 = L46_1[L4_1]
            L46_1 = L46_1.determination
            if L46_1 ~= 1 then
              goto lbl_878
            end
          end
          L46_1 = L45_1.urls
          L46_1 = L46_1[L4_1]
          L46_1 = L46_1.confidence
          if L46_1 then
            L46_1 = L45_1.urls
            L46_1 = L46_1[L4_1]
            L46_1 = L46_1.confidence
            if 50 <= L46_1 then
              L46_1 = L45_1.urls
              L46_1 = L46_1[L4_1]
              L46_1 = L46_1.context
              L46_1 = L46_1.Source
              if L46_1 == "GenRansom" then
                L46_1 = L45_1.urls
                L46_1 = L46_1[L4_1]
                L46_1 = L46_1.confidence
                L37_1.confidence = L46_1
                L46_1 = L45_1.urls
                L46_1 = L46_1[L4_1]
                L46_1 = L46_1.context
                L46_1 = L46_1.Family
                L37_1.family = L46_1
                L46_1 = L45_1.urls
                L46_1 = L46_1[L4_1]
                L46_1 = L46_1.determination
                L37_1.determination = L46_1
                L46_1 = {}
                L47_1 = L45_1.urls
                L47_1 = L47_1[L4_1]
                L47_1 = L47_1.context
                L47_1 = L47_1.action
                L46_1.action = L47_1
                L47_1 = L45_1.urls
                L47_1 = L47_1[L4_1]
                L47_1 = L47_1.context
                L47_1 = L47_1.action_parameter
                L46_1.parameter = L47_1
                L47_1 = L45_1.urls
                L47_1 = L47_1[L4_1]
                L47_1 = L47_1.context
                L47_1 = L47_1.action_ttl
                L46_1.ttl = L47_1
                L37_1.action = L46_1
                L37_1.ip = L4_1
                L47_1 = L45_1.urls
                L47_1 = L47_1[L4_1]
                L47_1 = L47_1.context
                L37_1.context = L47_1
                L37_1.unscrubbed_username = L11_1
                L37_1.unscrubbed_domain = L9_1
                L47_1 = bm
                L47_1 = L47_1.trigger_sig
                L48_1 = "RemoteGenericRansomware:Malware"
                L49_1 = safeJsonSerialize
                L50_1 = L37_1
                L49_1, L50_1, L51_1 = L49_1(L50_1)
                L47_1(L48_1, L49_1, L50_1, L51_1)
              end
            end
          end
        end
      end
    end
    ::lbl_878::
    L34_1 = mp
    L34_1 = L34_1.INFECTED
    return L34_1
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
