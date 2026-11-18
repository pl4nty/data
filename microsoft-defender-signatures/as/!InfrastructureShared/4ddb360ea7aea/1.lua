-- Threat: !InfrastructureShared
-- Name: 4ddb360ea7aea
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
for l_0_2 = 1, l_0_0 do
  if sigattr_tail[l_0_2].attribute == 16385 then
    local l_0_3 = sigattr_tail[l_0_2].utf8p1:lower()
    l_0_1[mp.crc32(0, l_0_3, 1, #l_0_3)] = 1
  end
end
local l_0_4 = {}
for l_0_5 = 1, l_0_0 do
  if sigattr_tail[l_0_5].attribute == 16389 and sigattr_tail[l_0_5].utf8p2 == "ATTR_c09458eb" then
    local l_0_6 = sigattr_tail[l_0_5].utf8p1
    l_0_4[mp.crc32(0, l_0_6, 1, #l_0_6)] = l_0_5
  end
end
local l_0_7 = {}
local l_0_8 = {}
for l_0_9 = 1, l_0_0 do
  if sigattr_tail[l_0_9].attribute == 16386 then
    local l_0_10 = sigattr_tail[l_0_9].utf8p2:lower()
    local l_0_11 = sigattr_tail[l_0_9].utf8p1:lower()
    local l_0_12 = mp.crc32(0, l_0_10, 1, #l_0_10)
    local l_0_13 = mp.crc32(0, l_0_11, 1, #l_0_11)
    if (l_0_1[l_0_13] ~= nil or l_0_1[l_0_12] ~= nil) and l_0_8[l_0_12] == nil then
      local l_0_14 = l_0_10:match("%.[^%.]+$")
      if l_0_14 ~= nil and mp.bitand(mp.GetExtensionClass(l_0_14), 3) ~= 0 and #l_0_10 < #l_0_11 and l_0_11:find(l_0_10, 1, true) == 1 and l_0_11:byte(#l_0_10 + 1) ~= 58 then
        l_0_8[l_0_12] = 1
        local l_0_15 = l_0_11:match("%.[^%.]+$")
        if mp.GetExtensionClass(l_0_15) ~= 4 then
          local l_0_16 = string.sub(l_0_11, #l_0_10 + 1)
          if l_0_7[l_0_16] ~= nil then
            table.insert(l_0_7[l_0_16], l_0_9)
            if 5 <= #l_0_7[l_0_16] then
              local l_0_17 = {}
              l_0_17.count = 0
              for l_0_18, l_0_19 in pairs(l_0_7[l_0_16]) do
                local l_0_20 = sysio.ReadFile(sigattr_tail[l_0_19].utf8p1, 0, 4)
                if l_0_20 ~= nil and l_0_17[l_0_20] == nil then
                  l_0_17[l_0_20] = 1
                  l_0_17.count = l_0_17.count + 1
                end
              end
              if 4 < l_0_17.count then
                bm.add_related_string("magic_mismatch", "true", bm.RelatedStringBMReport)
              else
                bm.add_related_string("magic_mismatch", "false", bm.RelatedStringBMReport)
              end
              bm.add_related_string("ransom_extension", l_0_16, bm.RelatedStringBMReport)
              local l_0_21 = bm.get_current_process_startup_info()
              if l_0_21 ~= nil then
                l_0_21 = l_0_21.ppid
              else
                l_0_21 = -1
              end
              local l_0_22 = "genb_ransom_meta_" .. l_0_21
              local l_0_23 = "ChangeFile"
              local l_0_24 = ""
              local l_0_25 = 1800
              local l_0_26 = 100
              local l_0_27 = {}
              local l_0_28 = "FileChain_MainSet:"
              for l_0_29, l_0_30 in pairs(l_0_7[l_0_16]) do
                local l_0_31 = sigattr_tail[l_0_30].utf8p1
                local l_0_32 = string.find(l_0_31, "\\[^\\]*$") or 0
                local l_0_33 = string.find(l_0_31, ".", l_0_32, true)
                if l_0_33 ~= nil then
                  local l_0_34 = string.sub(l_0_31, l_0_32 + 1, l_0_33 - 1)
                  l_0_28 = l_0_28 .. crypto.CRC32Buffer(-1, l_0_34, 0, #l_0_34)
                  l_0_28 = l_0_28 .. ";" .. string.sub(l_0_31, l_0_33 + 1) .. ";"
                end
                l_0_31 = sigattr_tail[l_0_30].utf8p2
                l_0_32 = string.find(l_0_31, "\\[^\\]*$") or 0
                l_0_33 = string.find(l_0_31, ".", l_0_32, true)
                if l_0_33 ~= nil then
                  local l_0_35 = string.sub(l_0_31, l_0_32 + 1, l_0_33 - 1)
                  l_0_28 = l_0_28 .. crypto.CRC32Buffer(-1, l_0_35, 0, #l_0_35)
                  l_0_28 = l_0_28 .. ";" .. string.sub(l_0_31, l_0_33 + 1) .. ";"
                end
                l_0_24 = l_0_16 .. "|"
                l_0_24 = l_0_24 .. sigattr_tail[l_0_30].utf8p1 .. "|" .. sigattr_tail[l_0_30].utf8p2 .. "|"
                local l_0_36 = "Known"
                local l_0_37 = mp.crc32(0, sigattr_tail[l_0_30].utf8p1, 1, #sigattr_tail[l_0_30].utf8p1)
                local l_0_38 = mp.crc32(0, sigattr_tail[l_0_30].utf8p2, 1, #sigattr_tail[l_0_30].utf8p2)
                if l_0_4[l_0_37] ~= nil or l_0_4[l_0_38] ~= nil then
                  l_0_36 = "Unknown"
                end
                l_0_24 = l_0_24 .. l_0_36 .. "|"
                local l_0_39 = sysio.GetFileSize(sigattr_tail[l_0_30].utf8p1)
                l_0_24 = l_0_24 .. l_0_39 .. "|"
                local l_0_40 = l_0_39
                local l_0_41 = ""
                local l_0_42 = ""
                if l_0_39 ~= nil and 256 < l_0_39 then
                  l_0_39 = 256
                  local l_0_43 = sysio.ReadFile(sigattr_tail[l_0_30].utf8p1, 0, l_0_39)
                  if l_0_43 ~= nil then
                    l_0_41 = string.format("\\x%02X\\x%02X\\x%02X\\x%02X", string.byte(l_0_43, 1, 4))
                    l_0_42 = crypto.ComputeEntropy(l_0_43)
                    table.insert(l_0_27, {
                      File_Size = l_0_40,
                      FileType = l_0_36,
                      MagicByte = l_0_41,
                      Entropy = l_0_42
                    })
                  end
                end
                l_0_24 = l_0_24 .. l_0_41 .. "|" .. l_0_42
                AppendToRollingQueue(l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, 0)
              end
              bm.add_related_string("ransom_encryptedData", safeJsonSerialize(l_0_27), bm.RelatedStringBMReport)
              bm.add_related_string("ransom_encryptedDataRQ", safeJsonSerialize(GetRollingQueue(l_0_22)), bm.RelatedStringBMReport)
              local l_0_44, l_0_45 = bm.get_process_relationships()
              for l_0_46, l_0_47 in ipairs(l_0_44) do
                if l_0_47.image_path ~= nil then
                  bm.add_related_process(l_0_47.ppid)
                end
              end
              for l_0_48, l_0_49 in ipairs(l_0_45) do
                if l_0_49.image_path ~= nil then
                  bm.add_related_process(l_0_49.ppid)
                  TrackPidAndTechniqueBM(l_0_49.ppid, "T1485", "susp_ransomware_childproc_type2")
                end
              end
              bm.add_related_string("ransom_files_main", l_0_28, bm.RelatedStringBMReport)
              local l_0_50 = MpCommon.RollingQueueCount(l_0_22)
              local l_0_51 = math_floor(l_0_50 / 5)
              if 5 < l_0_50 then
                bm.trigger_sig("GenericRansomware", "Type2:Count_" .. l_0_51)
              end
              sms_untrusted_process()
              bm.add_action("SmsAsyncScanEvent", 100)
              TrackPidAndTechniqueBM(l_0_21, "T1486", "susp_ransomware_type2")
              if l_0_51 < 5 then
                return mp.CLEAN
              end
              reportTimingData()
              return mp.INFECTED
            end
          else
            l_0_7[l_0_16] = {l_0_9}
          end
        end
      end
    end
  end
end
return mp.CLEAN
