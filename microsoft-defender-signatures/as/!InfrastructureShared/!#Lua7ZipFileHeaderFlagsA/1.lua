local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 192 or 1073741824 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "."
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L1_1
  L4_1 = -4
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == ".tmp" or L2_1 == ".s3p" or L2_1 == ".bl7" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L1_1
  L5_1 = -5
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == ".temp" or L3_1 == ".bj23" or L3_1 == ".ospx" or L3_1 == ".crpl" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = StringEndsWith
  L5_1 = L1_1
  L6_1 = ".zipenc"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = StringEndsWith
    L5_1 = L1_1
    L6_1 = ".content"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L4_1 = StringEndsWith
      L5_1 = L1_1
      L6_1 = ".downloading"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        L4_1 = StringEndsWith
        L5_1 = L1_1
        L6_1 = ".partial"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L4_1 = StringEndsWith
          L5_1 = L1_1
          L6_1 = ".scindex"
          L4_1 = L4_1(L5_1, L6_1)
          if not L4_1 then
            L4_1 = StringEndsWith
            L5_1 = L1_1
            L6_1 = ".cryptsync"
            L4_1 = L4_1(L5_1, L6_1)
            if not L4_1 then
              goto lbl_99
            end
          end
        end
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_99::
  if L1_1 == "pesrs.7z" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L2_1 = StringEndsWith
L3_1 = L1_1
L4_1 = ".7z"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.bitor
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_PATH
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "\\fabamaq\\hyperion4\\"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "\\temp\\cnxt_wrapper"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "\\electronicdata\\convertedarchive"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 == nil then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "\\semler scientific, inc\\quantaflo application"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 == nil then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L2_1
          L5_1 = "\\martinengineering\\zawin"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 == nil then
            goto lbl_168
          end
        end
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
::lbl_168::
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  if L2_1 == "dtxstudio.exe" or L2_1 == "googledrivefs.exe" or L2_1 == "sfsserver.exe" or L2_1 == "winstocknew.workerservice.exe" or L2_1 == "wcsdb5.exe" or L2_1 == "adsrtoolservice.exe" or L2_1 == "adaptivaclientservice.exe" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.readu_u64
L4_1 = headerpage
L5_1 = 13
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readu_u64
L5_1 = headerpage
L6_1 = 21
L4_1 = L4_1(L5_1, L6_1)
if L3_1 == nil or L3_1 <= 0 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:7ZipHasInvalidNextHeaderOffset"
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L4_1 == nil or L4_1 <= 0 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:7ZipHasInvalidNextHeaderSize"
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if 512 < L4_1 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:7ZipNextHeaderSizeGT!0x200"
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L3_1 = L3_1 + 32
L5_1 = L3_1 + L4_1
if L0_1 < L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = true
L6_1(L7_1)
L6_1 = string
L6_1 = L6_1.byte
L7_1 = L5_1
L8_1 = 1
L6_1 = L6_1(L7_1, L8_1)
L7_1 = string
L7_1 = L7_1.byte
L8_1 = L5_1
L9_1 = 2
L7_1 = L7_1(L8_1, L9_1)
L8_1 = false
if L6_1 == 1 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:7ZipHasRawHeader"
  L9_1(L10_1)
  if L7_1 == 4 then
    L9_1 = mp
    L9_1 = L9_1.set_mpattribute
    L10_1 = "Lua:7ZipHasMainStreamsInfo"
    L9_1(L10_1)
  end
elseif L6_1 == 23 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:7ZipHasEncodedHeader"
  L9_1(L10_1)
  L8_1 = true
end
L9_1 = string
L9_1 = L9_1.find
L10_1 = L5_1
L11_1 = "\000\a\v"
L12_1 = 1
L13_1 = true
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if L9_1 ~= nil and 0 < L9_1 then
  L10_1 = L9_1 + 6
  if L4_1 > L10_1 then
    L10_1 = L9_1 + 3
    L11_1 = string
    L11_1 = L11_1.byte
    L12_1 = L5_1
    L13_1 = L10_1
    L11_1 = L11_1(L12_1, L13_1)
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = string
    L13_1 = L13_1.format
    L14_1 = "Lua:7ZipContainerForEncodedDataCount!%s"
    L15_1 = L11_1
    L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L13_1(L14_1, L15_1)
    L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
    L12_1 = string
    L12_1 = L12_1.byte
    L13_1 = L5_1
    L14_1 = L10_1 + 1
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 == 1 then
      L13_1 = mp
      L13_1 = L13_1.set_mpattribute
      L14_1 = "Lua:7ZipHasFolderInfoExternalFlag"
      L13_1(L14_1)
    elseif L12_1 == 0 then
      L13_1 = string
      L13_1 = L13_1.byte
      L14_1 = L5_1
      L15_1 = L10_1 + 2
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 ~= nil and 0 < L13_1 then
        L14_1 = mp
        L14_1 = L14_1.set_mpattribute
        L15_1 = string
        L15_1 = L15_1.format
        L16_1 = "Lua:7ZipNumOfCoders!%s"
        L17_1 = L13_1
        L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L15_1(L16_1, L17_1)
        L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
        if 4 < L13_1 then
          L14_1 = mp
          L14_1 = L14_1.set_mpattribute
          L15_1 = "Lua:7ZipNumberOfCodersGT!4"
          L14_1(L15_1)
        else
          L14_1 = L10_1 + 3
          L15_1 = {}
          L15_1["\000"] = "COPY"
          L15_1["\003"] = "DELTA"
          L15_1["\004"] = "BCJ"
          L15_1["\003\001\001"] = "LZMA"
          L15_1["\003\003\001\003"] = "P7Z_BCJ"
          L15_1["\003\003\001\027"] = "P7Z_BCJ2"
          L15_1["\003\003\002\005"] = "BCJ_PPC"
          L15_1["\003\003\003\001"] = "BCJ_IA64"
          L15_1["\003\003\005\001"] = "BCJ_ARM"
          L15_1["\003\003\a\001"] = "BCJ_ARMT"
          L15_1["\003\003\b\005"] = "BCJ_SPARC"
          L15_1["!"] = "LZMA2"
          L15_1["\004\002\002"] = "BZIP2"
          L15_1["\004\001\b"] = "DEFLATE"
          L15_1["\004\001\t"] = "DEFLATE64"
          L15_1["\004\247\017\001"] = "ZSTD"
          L15_1["\004\247\017\002"] = "BROTLI"
          L15_1["\004\247\017\004"] = "LZ4"
          L15_1["\004\247\017\005"] = "LZS"
          L15_1["\004\247\017\006"] = "LIZARD"
          L15_1["\006\241\a\001"] = "AES"
          L15_1["\003\004\001"] = "PPMD"
          L16_1 = false
          L17_1 = 1
          L18_1 = L13_1
          L19_1 = 1
          for L20_1 = L17_1, L18_1, L19_1 do
            if L4_1 < L14_1 then
              break
            end
            L21_1 = string
            L21_1 = L21_1.byte
            L22_1 = L5_1
            L23_1 = L14_1
            L21_1 = L21_1(L22_1, L23_1)
            if L21_1 == nil or L21_1 <= 0 then
              break
            end
            L22_1 = mp
            L22_1 = L22_1.bitand
            L23_1 = L21_1
            L24_1 = 15
            L22_1 = L22_1(L23_1, L24_1)
            L23_1 = mp
            L23_1 = L23_1.bitand
            L24_1 = L21_1
            L25_1 = 16
            L23_1 = L23_1(L24_1, L25_1)
            if L23_1 == 16 then
              L23_1 = mp
              L23_1 = L23_1.set_mpattribute
              L24_1 = "Lua:7ZipCoderPropertyHasComplexCodec"
              L23_1(L24_1)
            end
            L23_1 = false
            L24_1 = mp
            L24_1 = L24_1.bitand
            L25_1 = L21_1
            L26_1 = 32
            L24_1 = L24_1(L25_1, L26_1)
            if L24_1 == 32 then
              L24_1 = mp
              L24_1 = L24_1.set_mpattribute
              L25_1 = string
              L25_1 = L25_1.format
              L26_1 = "Lua:7ZipCoderPropertyCodec%s!HasAttributes"
              L27_1 = L20_1
              L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L25_1(L26_1, L27_1)
              L24_1(L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
              L23_1 = true
            end
            L14_1 = L14_1 + 1
            L24_1 = L14_1 + L22_1
            if L4_1 < L24_1 then
              break
            end
            L24_1 = string
            L24_1 = L24_1.sub
            L25_1 = L5_1
            L26_1 = L14_1
            L27_1 = L14_1 + L22_1
            L27_1 = L27_1 - 1
            L24_1 = L24_1(L25_1, L26_1, L27_1)
            L25_1 = L15_1[L24_1]
            if L25_1 == nil then
              break
            end
            if L25_1 == "AES" then
              L16_1 = true
            end
            L26_1 = mp
            L26_1 = L26_1.set_mpattribute
            L27_1 = string
            L27_1 = L27_1.format
            L28_1 = "Lua:7ZipHasCodec%s"
            L29_1 = L25_1
            L27_1, L28_1, L29_1, L30_1 = L27_1(L28_1, L29_1)
            L26_1(L27_1, L28_1, L29_1, L30_1)
            L26_1 = mp
            L26_1 = L26_1.set_mpattribute
            L27_1 = string
            L27_1 = L27_1.format
            L28_1 = "Lua:7ZipCoderPropertyCodec%s!%s"
            L29_1 = L20_1
            L30_1 = L25_1
            L27_1, L28_1, L29_1, L30_1 = L27_1(L28_1, L29_1, L30_1)
            L26_1(L27_1, L28_1, L29_1, L30_1)
            L14_1 = L14_1 + L22_1
            if L23_1 == true then
              L26_1 = string
              L26_1 = L26_1.byte
              L27_1 = L5_1
              L28_1 = L14_1
              L26_1 = L26_1(L27_1, L28_1)
              L27_1 = L14_1 + L26_1
              L14_1 = L27_1 + 1
            end
          end
          if L8_1 == true and L16_1 == true then
            L17_1 = mp
            L17_1 = L17_1.set_mpattribute
            L18_1 = "Lua:7ZipHasEncryptedFilenames"
            L17_1(L18_1)
          end
        end
      end
    end
end
else
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = "Lua:7ZipNoUnpackInfo"
  L10_1(L11_1)
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
