-- Threat: !InfrastructureShared
-- Name: 25bb3ca9c4b5b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = bm.get_sig_count()
for l_0_3 = 1, l_0_0 do
  if sigattr_tail[l_0_3].attribute == 16385 then
    local l_0_4 = sigattr_tail[l_0_3].utf8p1:lower()
    l_0_1[mp.crc32(0, l_0_4, 1, #l_0_4)] = l_0_3
  end
end
local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = {}
local l_0_9 = {}
local l_0_10 = {}
local l_0_11, l_0_12, l_0_13, l_0_14
local l_0_15 = ""
local l_0_16 = false
local l_0_17 = false
for l_0_18 = 1, l_0_0 do
  if sigattr_tail[l_0_18].attribute == 16386 then
    local l_0_19 = sigattr_tail[l_0_18].utf8p2:lower()
    local l_0_20 = sigattr_tail[l_0_18].utf8p1:lower()
    local l_0_21 = mp.crc32(0, l_0_19, 1, #l_0_19)
    local l_0_22 = mp.crc32(0, l_0_20, 1, #l_0_20)
    if (l_0_1[l_0_22] ~= nil or l_0_1[l_0_21] ~= nil) and l_0_7[l_0_21] == nil then
      local l_0_23 = l_0_19:match("%.[^%.]+$")
      if l_0_23 ~= nil and mp.bitand(mp.GetExtensionClass(l_0_23), 3) ~= 0 and #l_0_19 < #l_0_20 and l_0_20:find(l_0_19, 1, true) == 1 and l_0_20:byte(#l_0_19 + 1) ~= 58 then
        l_0_7[l_0_21] = 1
        local l_0_24 = l_0_20:match("%.[^%.]+$")
        if mp.GetExtensionClass(l_0_24) ~= 4 then
          if l_0_1[l_0_22] ~= nil then
            l_0_8[l_0_18] = l_0_1[l_0_22]
          elseif l_0_1[l_0_21] ~= nil then
            l_0_8[l_0_18] = l_0_1[l_0_21]
          end
          local l_0_25 = string.sub(l_0_20, #l_0_19 + 1)
          if l_0_5[l_0_25] ~= nil then
            table.insert(l_0_5[l_0_25], l_0_18)
          else
            l_0_5[l_0_25] = {l_0_18}
          end
          local l_0_26 = l_0_25:match("%.[^%.]+$", 1, true)
          if l_0_26 ~= nil then
            if l_0_6[l_0_26] ~= nil then
              table.insert(l_0_6[l_0_26], l_0_18)
            else
              l_0_6[l_0_26] = {l_0_18}
            end
            if 5 <= #l_0_6[l_0_26] then
              local l_0_27 = 0
              for l_0_28, l_0_29 in pairs(l_0_5) do
                if #l_0_5[l_0_28] == 1 then
                  l_0_27 = l_0_27 + 1
                end
              end
              if 5 <= l_0_27 then
                l_0_5 = l_0_6
                l_0_25 = l_0_26
                l_0_17 = true
              end
            end
          end
          if 5 <= #l_0_5[l_0_25] then
            local l_0_30 = false
            local l_0_31 = {}
            l_0_31.count = 0
            for l_0_32, l_0_33 in pairs(l_0_5[l_0_25]) do
              local l_0_34 = sysio.GetFileSize(sigattr_tail[l_0_33].utf8p1)
              local l_0_35 = sysio.ReadFile(sigattr_tail[l_0_33].utf8p1, 0, 4)
              if l_0_35 ~= nil and l_0_31[l_0_35] == nil then
                l_0_31[l_0_35] = 1
                l_0_31.count = l_0_31.count + 1
              end
              if l_0_8[l_0_33] ~= nil and l_0_16 == false then
                local l_0_36 = sigattr_tail[l_0_8[l_0_33]].utf8p2
                if 136 < #l_0_36 then
                  local l_0_37 = string.find(l_0_36, "RemoteIp", 100, true)
                  if l_0_37 ~= nil and 20 < #l_0_36 - l_0_37 then
                    local l_0_38 = {}
                    for l_0_39, l_0_40 in string.gmatch(l_0_36, "(%w+):([^;]+)") do
                      l_0_38[l_0_39] = l_0_40
                    end
                    if l_0_38.UsrName ~= nil and l_0_38.Domain ~= nil and l_0_38.RemoteIp ~= nil then
                      l_0_11 = l_0_38.UsrName
                      l_0_12 = l_0_38.Domain
                      l_0_13 = scrubData(l_0_38.UsrName)
                      l_0_14 = scrubData(l_0_38.Domain)
                      local l_0_41 = string.match(l_0_38.RemoteIp, "(.*):(.*)")
                      local l_0_42 = "NA"
                      if l_0_35 ~= nil then
                        l_0_42 = string.format("0x%02X%02X%02X%02X", string.byte(l_0_35, 1, 4))
                      end
                      if l_0_41 ~= nil and (l_0_15 == "" or l_0_15 == l_0_41) then
                        table.insert(l_0_10, {
                          path = sigattr_tail[l_0_33].utf8p1,
                          magic = l_0_42,
                          fileSize = l_0_34
                        })
                        l_0_15 = l_0_41
                      else
                        l_0_16 = true
                      end
                    end
                  end
                end
              end
            end
            if 4 < l_0_31.count then
              l_0_30 = true
            end
            bm.add_related_string("magic_mismatch", tostring(l_0_30), bm.RelatedStringBMReport)
            bm.add_related_string("ransom_extension", l_0_25, bm.RelatedStringBMReport)
            local l_0_43 = {}
            local l_0_44 = {}
            local l_0_45 = bm.get_imagepath()
            if isnull(l_0_45) then
              l_0_45 = "NA"
            else
              l_0_45 = l_0_45:lower()
            end
            local l_0_46 = bm.get_current_process_startup_info()
            local l_0_47 = ""
            if l_0_46 ~= nil then
              l_0_47 = l_0_46.command_line
              l_0_46 = l_0_46.ppid
            else
              l_0_46 = -1
            end
            l_0_43.cur_image_path = l_0_45
            l_0_43.proc_info = l_0_46
            l_0_43.appended_ext = l_0_25
            l_0_43.magic_mismatch = l_0_30
            l_0_43.is_double_ext = l_0_17
            l_0_43.sig_count = l_0_2
            local l_0_48 = "FileChain_MainSet:"
            for l_0_49, l_0_50 in pairs(l_0_5[l_0_25]) do
              local l_0_51 = sigattr_tail[l_0_50].utf8p1
              local l_0_52 = string.find(l_0_51, "\\[^\\]*$") or 0
              local l_0_53 = string.find(l_0_51, ".", l_0_52, true)
              if l_0_53 ~= nil then
                local l_0_54 = string.sub(l_0_51, l_0_52 + 1, l_0_53 - 1)
                l_0_48 = l_0_48 .. crypto.CRC32Buffer(-1, l_0_54, 0, #l_0_54)
                l_0_48 = l_0_48 .. ";" .. string.sub(l_0_51, l_0_53 + 1) .. ";"
              end
              l_0_51 = sigattr_tail[l_0_50].utf8p2
              l_0_52 = string.find(l_0_51, "\\[^\\]*$") or 0
              l_0_53 = string.find(l_0_51, ".", l_0_52, true)
              if l_0_53 ~= nil then
                local l_0_55 = string.sub(l_0_51, l_0_52 + 1, l_0_53 - 1)
                l_0_48 = l_0_48 .. crypto.CRC32Buffer(-1, l_0_55, 0, #l_0_55)
                l_0_48 = l_0_48 .. ";" .. string.sub(l_0_51, l_0_53 + 1) .. ";"
              end
              table.insert(l_0_44, sigattr_tail[l_0_50].utf8p1)
              table.insert(l_0_44, sigattr_tail[l_0_50].utf8p2)
            end
            l_0_43.file_list = l_0_44
            local l_0_56, l_0_57 = bm.get_process_relationships()
            for l_0_58, l_0_59 in ipairs(l_0_56) do
              if l_0_59.image_path ~= nil then
                bm.add_related_process(l_0_59.ppid)
              end
            end
            for l_0_60, l_0_61 in ipairs(l_0_57) do
              if l_0_61.image_path ~= nil then
                bm.add_related_process(l_0_61.ppid)
                TrackPidAndTechniqueBM(l_0_61.ppid, "T1485", "susp_ransomware_childproc_type2")
              end
            end
            bm.add_related_string("ransom_files_main", l_0_48, bm.RelatedStringBMReport)
            local l_0_62 = safeJsonSerialize(l_0_43)
            bm.add_related_string("genb_ransom_meta", l_0_62, bm.RelatedStringBMReport)
            bm.trigger_sig("GenericRansomware:Type2", l_0_62)
            bm.trigger_sig_delayed("DelayedRansom:Type2", l_0_62, 10000)
            sms_untrusted_process()
            bm.add_action("SmsAsyncScanEvent", 100)
            TrackPidAndTechniqueBM(l_0_46, "T1486", "susp_ransomware_type2")
            reportTimingData()
            reportSessionInformationInclusive()
            local l_0_63, l_0_64 = pcall(reportBmInfo)
            if not l_0_63 and l_0_64 then
              bm.add_related_string("bmInfoFailReason", tostring(l_0_64), bm.RelatedStringBMReport)
            end
            if l_0_16 == false and 0 < #l_0_10 and l_0_15 ~= nil and l_0_15 ~= "" then
              local l_0_65 = mp.GetExtensionClass(l_0_25)
              if isnull(l_0_65) then
                l_0_65 = 1000
              end
              local l_0_66, l_0_67
              if MpCommon.GetBehavioralNetworkBlocksSettings then
                l_0_66, l_0_67 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
              end
              if not l_0_66 or l_0_67 == nil then
                l_0_67 = {
                  State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED,
                  MaxTimeout = 0,
                  Exclusions = "",
                  AggressiveLevel = 0
                }
              end
              l_0_9 = {
                Extension = l_0_25,
                ExtensionClass = l_0_65,
                imagePath = l_0_45,
                commandLine = l_0_47,
                ppID = l_0_46,
                UserName = l_0_13,
                Domain = l_0_14,
                file_list = l_0_10,
                Type = "Type2",
                RemoteEncConfig = l_0_67
              }
              local l_0_68 = safeJsonSerialize(l_0_9)
              bm.add_related_string("RemoteClientData", l_0_68, bm.RelatedStringBMReport)
              bm.trigger_sig("RemoteGenericRansomware:Type2", l_0_68)
              local l_0_69, l_0_70 = pcall(updateSystemDNSServers)
              if not l_0_69 then
                bm.add_related_string("updateSystemDNSServers_fail", l_0_70, bm.RelatedStringBMReport)
              end
              local l_0_71, l_0_72, l_0_73, l_0_74 = pcall(updateDomainInfo)
              if l_0_71 then
                l_0_9.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_15)
              else
                bm.add_related_string("updateDomainInfo_fail", l_0_72, bm.RelatedStringBMReport)
              end
              local l_0_75 = SafeGetUrlReputation({l_0_15}, {
                SIG_CONTEXT = "BM",
                CONTEXT_SOURCE = "GenRansom3",
                TAG = "NOLOOKUP",
                data = safeJsonSerialize(l_0_9)
              }, false, 3000, false)
              if l_0_75 and l_0_75.error == 3 then
                l_0_9.CRReportError = "Failed the first attempt"
                l_0_75 = SafeGetUrlReputation({l_0_15}, {
                  SIG_CONTEXT = "BM",
                  CONTEXT_SOURCE = "GenRansom3",
                  TAG = "NOLOOKUP",
                  data = safeJsonSerialize(l_0_9)
                }, false, 3000, false)
              end
              if l_0_75.urls[l_0_15] and (l_0_75.urls[l_0_15].determination == 2 or l_0_75.urls[l_0_15].determination == 1) and l_0_75.urls[l_0_15].confidence and l_0_75.urls[l_0_15].confidence >= 50 and l_0_75.urls[l_0_15].context.Source == "GenRansom" then
                l_0_9.confidence = l_0_75.urls[l_0_15].confidence
                l_0_9.family = l_0_75.urls[l_0_15].context.Family
                l_0_9.determination = l_0_75.urls[l_0_15].determination
                local l_0_76 = {
                  action = l_0_75.urls[l_0_15].context.action,
                  parameter = l_0_75.urls[l_0_15].context.action_parameter,
                  ttl = l_0_75.urls[l_0_15].context.action_ttl
                }
                l_0_9.action = l_0_76
                l_0_9.context = l_0_75.urls[l_0_15].context
                l_0_9.ip = l_0_15
                l_0_9.unscrubbed_username = l_0_11
                l_0_9.unscrubbed_domain = l_0_12
                bm.trigger_sig("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_9))
              end
            end
            bm.add_related_string("sigcount_type2", l_0_2, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
