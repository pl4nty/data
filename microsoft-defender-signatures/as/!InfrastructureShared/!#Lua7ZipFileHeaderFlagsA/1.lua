-- Threat: !InfrastructureShared
-- Name: !#Lua:7ZipFileHeaderFlags.A
-- Type: 12
-- Includes: LuaFuncHelper
-- MpAttributes: BM_7Z_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 192 or 1073741824 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_1, ".", 1, true) ~= nil then
  local l_0_2 = string.sub(l_0_1, -4)
  if l_0_2 == ".tmp" or l_0_2 == ".s3p" or l_0_2 == ".bl7" then
    return mp.CLEAN
  end
  local l_0_3 = string.sub(l_0_1, -5)
  if l_0_3 == ".temp" or l_0_3 == ".bj23" or l_0_3 == ".ospx" or l_0_3 == ".crpl" then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_1, ".zipenc") or StringEndsWith(l_0_1, ".content") or StringEndsWith(l_0_1, ".downloading") or StringEndsWith(l_0_1, ".partial") or StringEndsWith(l_0_1, ".scindex") or StringEndsWith(l_0_1, ".cryptsync") then
    return mp.CLEAN
  end
  if l_0_1 == "pesrs.7z" then
    return mp.CLEAN
  end
end
if StringEndsWith(l_0_1, ".7z") then
  local l_0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  if string.find(l_0_4, "\\fabamaq\\hyperion4\\", 1, true) ~= nil or string.find(l_0_4, "\\temp\\cnxt_wrapper", 1, true) ~= nil or string.find(l_0_4, "\\electronicdata\\convertedarchive", 1, true) ~= nil or string.find(l_0_4, "\\semler scientific, inc\\quantaflo application", 1, true) ~= nil or string.find(l_0_4, "\\martinengineering\\zawin", 1, true) ~= nil then
    return mp.CLEAN
  end
end
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_5 ~= nil then
  l_0_5 = string.lower(l_0_5)
  if l_0_5 == "dtxstudio.exe" or l_0_5 == "googledrivefs.exe" or l_0_5 == "sfsserver.exe" or l_0_5 == "winstocknew.workerservice.exe" or l_0_5 == "wcsdb5.exe" or l_0_5 == "adsrtoolservice.exe" or l_0_5 == "adaptivaclientservice.exe" then
    return mp.CLEAN
  end
end
local l_0_6 = mp.readu_u64(headerpage, 13)
local l_0_7 = mp.readu_u64(headerpage, 21)
if l_0_6 == nil or l_0_6 <= 0 then
  mp.set_mpattribute("Lua:7ZipHasInvalidNextHeaderOffset")
  return mp.CLEAN
end
if l_0_7 == nil or l_0_7 <= 0 then
  mp.set_mpattribute("Lua:7ZipHasInvalidNextHeaderSize")
  return mp.CLEAN
end
if 512 < l_0_7 then
  mp.set_mpattribute("Lua:7ZipNextHeaderSizeGT!0x200")
  return mp.CLEAN
end
l_0_6 = l_0_6 + 32
if l_0_0 < l_0_6 + l_0_7 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_8 = mp.readfile(l_0_6, l_0_7)
mp.readprotection(true)
local l_0_9 = string.byte(l_0_8, 1)
local l_0_10 = string.byte(l_0_8, 2)
local l_0_11 = false
if l_0_9 == 1 then
  mp.set_mpattribute("Lua:7ZipHasRawHeader")
  if l_0_10 == 4 then
    mp.set_mpattribute("Lua:7ZipHasMainStreamsInfo")
  end
elseif l_0_9 == 23 then
  mp.set_mpattribute("Lua:7ZipHasEncodedHeader")
  l_0_11 = true
end
local l_0_12 = string.find(l_0_8, "\000\a\v", 1, true)
if l_0_12 ~= nil and 0 < l_0_12 and l_0_7 > l_0_12 + 6 then
  local l_0_13 = l_0_12 + 3
  local l_0_14 = string.byte(l_0_8, l_0_13)
  mp.set_mpattribute(string.format("Lua:7ZipContainerForEncodedDataCount!%s", l_0_14))
  local l_0_15 = string.byte(l_0_8, l_0_13 + 1)
  if l_0_15 == 1 then
    mp.set_mpattribute("Lua:7ZipHasFolderInfoExternalFlag")
  elseif l_0_15 == 0 then
    local l_0_16 = string.byte(l_0_8, l_0_13 + 2)
    if l_0_16 ~= nil and 0 < l_0_16 then
      mp.set_mpattribute(string.format("Lua:7ZipNumOfCoders!%s", l_0_16))
      if 4 < l_0_16 then
        mp.set_mpattribute("Lua:7ZipNumberOfCodersGT!4")
      else
        local l_0_17 = l_0_13 + 3
        local l_0_18 = {
          ["\000"] = "COPY",
          ["\003"] = "DELTA",
          ["\004"] = "BCJ",
          ["\003\001\001"] = "LZMA",
          ["\003\003\001\003"] = "P7Z_BCJ",
          ["\003\003\001\027"] = "P7Z_BCJ2",
          ["\003\003\002\005"] = "BCJ_PPC",
          ["\003\003\003\001"] = "BCJ_IA64",
          ["\003\003\005\001"] = "BCJ_ARM",
          ["\003\003\a\001"] = "BCJ_ARMT",
          ["\003\003\b\005"] = "BCJ_SPARC",
          ["!"] = "LZMA2",
          ["\004\002\002"] = "BZIP2",
          ["\004\001\b"] = "DEFLATE",
          ["\004\001\t"] = "DEFLATE64",
          ["\004\247\017\001"] = "ZSTD",
          ["\004\247\017\002"] = "BROTLI",
          ["\004\247\017\004"] = "LZ4",
          ["\004\247\017\005"] = "LZS",
          ["\004\247\017\006"] = "LIZARD",
          ["\006\241\a\001"] = "AES",
          ["\003\004\001"] = "PPMD"
        }
        local l_0_19 = false
        for l_0_20 = 1, l_0_16 do
          if l_0_7 < l_0_17 then
            break
          end
          local l_0_21 = string.byte(l_0_8, l_0_17)
          if l_0_21 == nil or l_0_21 <= 0 then
            break
          end
          local l_0_22 = mp.bitand(l_0_21, 15)
          if mp.bitand(l_0_21, 16) == 16 then
            mp.set_mpattribute("Lua:7ZipCoderPropertyHasComplexCodec")
          end
          local l_0_23 = false
          if mp.bitand(l_0_21, 32) == 32 then
            mp.set_mpattribute(string.format("Lua:7ZipCoderPropertyCodec%s!HasAttributes", l_0_20))
            l_0_23 = true
          end
          l_0_17 = l_0_17 + 1
          if l_0_7 < l_0_17 + l_0_22 then
            break
          end
          local l_0_24 = string.sub(l_0_8, l_0_17, l_0_17 + l_0_22 - 1)
          local l_0_25 = l_0_18[l_0_24]
          if l_0_25 == nil then
            break
          end
          if l_0_25 == "AES" then
            l_0_19 = true
          end
          mp.set_mpattribute(string.format("Lua:7ZipHasCodec%s", l_0_25))
          mp.set_mpattribute(string.format("Lua:7ZipCoderPropertyCodec%s!%s", l_0_20, l_0_25))
          l_0_17 = l_0_17 + l_0_22
          if l_0_23 == true then
            local l_0_26 = string.byte(l_0_8, l_0_17)
            l_0_17 = l_0_17 + l_0_26 + 1
          end
        end
        if l_0_11 == true and l_0_19 == true then
          mp.set_mpattribute("Lua:7ZipHasEncryptedFilenames")
        end
      end
    end
  end
else
  mp.set_mpattribute("Lua:7ZipNoUnpackInfo")
end
return mp.CLEAN
