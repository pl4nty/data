-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#Lua7ZipFileHeaderFlagsA\0x000011ce_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 192 or l_0_0 > 1073741824 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if (string.find)(l_0_1, ".", 1, true) ~= nil then
  local l_0_2 = (string.sub)(l_0_1, -4)
  if l_0_2 == ".tmp" or l_0_2 == ".s3p" or l_0_2 == ".bl7" then
    return mp.CLEAN
  end
  local l_0_3 = (string.sub)(l_0_1, -5)
  if l_0_3 == ".temp" or l_0_3 == ".bj23" or l_0_3 == ".ospx" or l_0_3 == ".crpl" then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_1, ".zipenc") or StringEndsWith(l_0_1, ".content") or StringEndsWith(l_0_1, ".downloading") or StringEndsWith(l_0_1, ".partial") then
    return mp.CLEAN
  end
end
do
  do
    if StringEndsWith(l_0_1, ".7z") then
      local l_0_4 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
      if (string.find)(l_0_4, "\\fabamaq\\hyperion4\\", 1, true) ~= nil or (string.find)(l_0_4, "\\temp\\cnxt_wrapper", 1, true) ~= nil or (string.find)(l_0_4, "\\electronicdata\\convertedarchive", 1, true) ~= nil or (string.find)(l_0_4, "\\semler scientific, inc\\quantaflo application", 1, true) ~= nil or (string.find)(l_0_4, "\\martinengineering\\zawin", 1, true) ~= nil then
        return mp.CLEAN
      end
    end
    local l_0_5 = (mp.readu_u64)(headerpage, 13)
    local l_0_6 = (mp.readu_u64)(headerpage, 21)
    if l_0_5 == nil or l_0_5 <= 0 then
      (mp.set_mpattribute)("Lua:7ZipHasInvalidNextHeaderOffset")
      return mp.CLEAN
    end
    if l_0_6 == nil or l_0_6 <= 0 then
      (mp.set_mpattribute)("Lua:7ZipHasInvalidNextHeaderSize")
      return mp.CLEAN
    end
    if l_0_6 > 512 then
      (mp.set_mpattribute)("Lua:7ZipNextHeaderSizeGT!0x200")
      return mp.CLEAN
    end
    l_0_5 = l_0_5 + 32
    if l_0_0 < l_0_5 + l_0_6 then
      return mp.CLEAN
    end
    ;
    (mp.readprotection)(false)
    local l_0_7 = (mp.readfile)(l_0_5, l_0_6)
    ;
    (mp.readprotection)(true)
    local l_0_8 = (string.byte)(l_0_7, 1)
    local l_0_9 = (string.byte)(l_0_7, 2)
    local l_0_10 = false
    if l_0_8 == 1 then
      (mp.set_mpattribute)("Lua:7ZipHasRawHeader")
      if l_0_9 == 4 then
        (mp.set_mpattribute)("Lua:7ZipHasMainStreamsInfo")
      end
    else
      if l_0_8 == 23 then
        (mp.set_mpattribute)("Lua:7ZipHasEncodedHeader")
        l_0_10 = true
      end
    end
    local l_0_11 = (string.find)(l_0_7, "\000\a\v", 1, true)
    if l_0_11 ~= nil and l_0_11 > 0 and l_0_11 + 6 < l_0_6 then
      local l_0_12 = l_0_11 + 3
      local l_0_13 = (string.byte)(l_0_7, l_0_12)
      ;
      (mp.set_mpattribute)((string.format)("Lua:7ZipContainerForEncodedDataCount!%s", l_0_13))
      local l_0_14 = (string.byte)(l_0_7, l_0_12 + 1)
      if l_0_14 == 1 then
        (mp.set_mpattribute)("Lua:7ZipHasFolderInfoExternalFlag")
      else
        if l_0_14 == 0 then
          local l_0_15 = (string.byte)(l_0_7, l_0_12 + 2)
          if l_0_15 ~= nil and l_0_15 > 0 then
            (mp.set_mpattribute)((string.format)("Lua:7ZipNumOfCoders!%s", l_0_15))
            if l_0_15 > 4 then
              (mp.set_mpattribute)("Lua:7ZipNumberOfCodersGT!4")
            else
              local l_0_16 = l_0_12 + 3
              local l_0_17 = {}
              l_0_17["\000"] = "COPY"
              l_0_17["\003"] = "DELTA"
              l_0_17["\004"] = "BCJ"
              l_0_17["\003\001\001"] = "LZMA"
              l_0_17["\003\003\001\003"] = "P7Z_BCJ"
              l_0_17["\003\003\001\027"] = "P7Z_BCJ2"
              l_0_17["\003\003\002\005"] = "BCJ_PPC"
              l_0_17["\003\003\003\001"] = "BCJ_IA64"
              l_0_17["\003\003\005\001"] = "BCJ_ARM"
              l_0_17["\003\003\a\001"] = "BCJ_ARMT"
              l_0_17["\003\003\b\005"] = "BCJ_SPARC"
              l_0_17["!"] = "LZMA2"
              l_0_17["\004\002\002"] = "BZIP2"
              l_0_17["\004\001\b"] = "DEFLATE"
              l_0_17["\004\001\t"] = "DEFLATE64"
              l_0_17["\004\247\017\001"] = "ZSTD"
              l_0_17["\004\247\017\002"] = "BROTLI"
              l_0_17["\004\247\017\004"] = "LZ4"
              l_0_17["\004\247\017\005"] = "LZS"
              l_0_17["\004\247\017\006"] = "LIZARD"
              l_0_17["\006\241\a\001"] = "AES"
              l_0_17["\003\004\001"] = "PPMD"
              local l_0_18 = false
              for l_0_22 = 1, l_0_15 do
                if l_0_6 < l_0_16 then
                  break
                end
                local l_0_23 = (string.byte)(l_0_7, l_0_16)
                if l_0_23 ~= nil then
                  if l_0_23 <= 0 then
                    break
                  end
                  local l_0_24 = (mp.bitand)(l_0_23, 15)
                  if (mp.bitand)(l_0_23, 16) == 16 then
                    (mp.set_mpattribute)("Lua:7ZipCoderPropertyHasComplexCodec")
                  end
                  local l_0_25 = false
                  if (mp.bitand)(l_0_23, 32) == 32 then
                    (mp.set_mpattribute)((string.format)("Lua:7ZipCoderPropertyCodec%s!HasAttributes", l_0_22))
                    l_0_25 = true
                  end
                  l_0_16 = l_0_16 + 1
                end
                if l_0_6 < l_0_16 + l_0_24 then
                  break
                end
                local l_0_26 = (string.sub)(l_0_7, l_0_16, l_0_16 + l_0_24 - 1)
                local l_0_27 = l_0_17[l_0_26]
                if l_0_27 == nil then
                  break
                end
                if l_0_27 == "AES" then
                  l_0_18 = true
                end
                ;
                (mp.set_mpattribute)((string.format)("Lua:7ZipHasCodec%s", l_0_27))
                ;
                (mp.set_mpattribute)((string.format)("Lua:7ZipCoderPropertyCodec%s!%s", l_0_22, l_0_27))
                l_0_16 = l_0_16 + l_0_24
                if l_0_25 == true then
                  l_0_16 = l_0_16 + (string.byte)(l_0_7, l_0_16) + 1
                end
              end
              do
                do
                  if l_0_10 == true and l_0_18 == true then
                    (mp.set_mpattribute)("Lua:7ZipHasEncryptedFilenames")
                  end
                  ;
                  (mp.set_mpattribute)("Lua:7ZipNoUnpackInfo")
                  return mp.CLEAN
                end
              end
            end
          end
        end
      end
    end
  end
end

