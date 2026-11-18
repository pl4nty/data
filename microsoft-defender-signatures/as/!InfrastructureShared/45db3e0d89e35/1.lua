-- Threat: !InfrastructureShared
-- Name: 45db3e0d89e35
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
if 60 < l_0_0 then
  local l_0_1 = {}
  local l_0_2 = ""
  local l_0_3 = ""
  local l_0_4 = 0
  for l_0_5 = 1, l_0_0 do
    if sigattr_tail[l_0_5].attribute == 16384 then
      l_0_2 = sigattr_tail[l_0_5].utf8p1
      l_0_3 = mp.crc32(0, l_0_2, 1, #l_0_2)
      l_0_1[l_0_3] = 1
      l_0_4 = l_0_4 + 1
    end
  end
  if 20 < l_0_4 then
    local l_0_6 = ""
    local l_0_7 = ""
    local l_0_8 = ""
    local l_0_9 = ""
    local l_0_10 = ""
    local l_0_11 = {}
    local l_0_12 = ""
    local l_0_13 = 0
    local l_0_14 = 0
    local l_0_15 = ""
    local l_0_16 = 0
    local l_0_17 = 0
    local l_0_18 = 0
    local l_0_19 = {}
    local l_0_20 = bm.get_current_process_startup_info()
    l_0_20 = l_0_20.ppid or -1
    local l_0_21 = "genc_ransom_meta_" .. l_0_20
    local l_0_22 = "CreateFile"
    local l_0_23 = ""
    local l_0_24 = 1800
    local l_0_25 = 100
    for l_0_26 = 1, l_0_0 do
      if sigattr_tail[l_0_26].attribute == 16389 and sigattr_tail[l_0_26].utf8p2 == "ATTR_c09458eb" and sigattr_tail[l_0_26].utf8p1 ~= nil then
        l_0_6 = sigattr_tail[l_0_26].utf8p1
        l_0_7 = mp.crc32(0, l_0_6, 1, #l_0_6)
        if l_0_1[l_0_7] == 1 then
          l_0_8 = string.match(l_0_6, "[^\\]+$")
          l_0_9 = string.match(l_0_6, "(.*[/\\])")
          _, l_0_13 = string.gsub(l_0_8, "%.", "")
          if 1 < l_0_13 then
            l_0_12 = string.match(l_0_8, "%.[^%.]+$")
            if mp.GetExtensionClass(l_0_12) ~= 4 and 4 < #l_0_12 then
              l_0_14 = sysio.GetFileSize(l_0_6)
              if l_0_14 ~= nil and 256 < l_0_14 then
                local l_0_27 = sysio.ReadFile(l_0_6, 0, 256)
                if l_0_27 ~= nil then
                  l_0_15 = string.format("\\x%02X\\x%02X\\x%02X\\x%02X", string.byte(l_0_27, 1, 4))
                  l_0_16 = crypto.ComputeEntropy(l_0_27)
                  if 7 <= l_0_16 then
                    l_0_10 = mp.crc32(0, l_0_9, 1, #l_0_9)
                    if l_0_11[l_0_10] ~= 1 then
                      l_0_18 = l_0_18 + 1
                      l_0_11[l_0_10] = 1
                    end
                    table.insert(l_0_19, {
                      FileName = l_0_8,
                      FolderPath = l_0_9,
                      FileSize = l_0_14,
                      Magic = l_0_15,
                      Entropy100 = l_0_16
                    })
                    l_0_17 = l_0_17 + 1
                    l_0_23 = l_0_6 .. "|" .. l_0_9 .. "|" .. l_0_8 .. "|" .. l_0_13 .. "|" .. l_0_12 .. "|" .. l_0_14 .. "|" .. l_0_15 .. "|" .. l_0_16 .. "|"
                    AppendToRollingQueue(l_0_21, l_0_22, l_0_23, l_0_24, l_0_25, 0)
                    if 20 < l_0_17 and 3 < l_0_18 then
                      bm.add_related_string("GenCRansom_encryptedData", safeJsonSerialize(l_0_19), bm.RelatedStringBMReport)
                      reportTimingData()
                      return mp.INFECTED
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
return mp.CLEAN
