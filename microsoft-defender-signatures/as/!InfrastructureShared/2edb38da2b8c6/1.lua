-- Threat: !InfrastructureShared
-- Name: 2edb38da2b8c6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = bm.get_sig_count()
local l_0_3 = 0
for l_0_4 = 1, l_0_0 do
  if sigattr_tail[l_0_4].attribute == 16385 then
    local l_0_5 = sigattr_tail[l_0_4].utf8p1:lower()
    local l_0_6 = mp.crc32(0, l_0_5, 1, #l_0_5)
    if l_0_1[l_0_6] == nil then
      l_0_3 = l_0_3 + 1
    end
    l_0_1[l_0_6] = l_0_4
  end
end
if l_0_3 < 3 then
  return mp.CLEAN
end
local l_0_7 = {}
local l_0_8 = {}
local l_0_9 = {}
local l_0_10 = {}
local l_0_11 = {}
local l_0_12 = {}
local l_0_13, l_0_14, l_0_15, l_0_16
local l_0_17 = ""
local l_0_18 = false
local l_0_19 = false
for l_0_20 = 1, l_0_0 do
  if sigattr_tail[l_0_20].attribute == 16386 then
    local l_0_21 = sigattr_tail[l_0_20].utf8p2:lower()
    local l_0_22 = sigattr_tail[l_0_20].utf8p1:lower()
    local l_0_23 = mp.crc32(0, l_0_21, 1, #l_0_21)
    local l_0_24 = mp.crc32(0, l_0_22, 1, #l_0_22)
    if (l_0_1[l_0_24] ~= nil or l_0_1[l_0_23] ~= nil) and l_0_9[l_0_23] == nil then
      local l_0_25 = l_0_21:match("%.[^%.]+$")
      if l_0_25 ~= nil and mp.bitand(mp.GetExtensionClass(l_0_25), 3) ~= 0 and #l_0_21 < #l_0_22 and l_0_22:find(l_0_21, 1, true) == 1 and l_0_22:byte(#l_0_21 + 1) ~= 58 then
        l_0_9[l_0_23] = 1
        local l_0_26 = l_0_22:match("%.[^%.]+$")
        if mp.GetExtensionClass(l_0_26) ~= 4 or isKnownRansomExtension(l_0_26) then
          if l_0_1[l_0_24] ~= nil then
            l_0_10[l_0_20] = l_0_1[l_0_24]
          elseif l_0_1[l_0_23] ~= nil then
            l_0_10[l_0_20] = l_0_1[l_0_23]
          end
          local l_0_27 = string.sub(l_0_22, #l_0_21 + 1)
          if l_0_7[l_0_27] ~= nil then
            table.insert(l_0_7[l_0_27], l_0_20)
          else
            l_0_7[l_0_27] = {l_0_20}
          end
          local l_0_28 = l_0_27:match("%.[^%.]+$", 1, true)
          if l_0_28 ~= nil then
            if l_0_8[l_0_28] ~= nil then
              table.insert(l_0_8[l_0_28], l_0_20)
            else
              l_0_8[l_0_28] = {l_0_20}
            end
            if 3 <= #l_0_8[l_0_28] then
              local l_0_29 = 0
              for l_0_30, l_0_31 in pairs(l_0_7) do
                if #l_0_7[l_0_30] == 1 then
                  l_0_29 = l_0_29 + 1
                end
              end
              if 3 <= l_0_29 then
                l_0_7 = l_0_8
                l_0_27 = l_0_28
                l_0_19 = true
              end
            end
          end
          if 3 <= #l_0_7[l_0_27] then
            local l_0_32 = false
            local l_0_33 = {}
            l_0_33.count = 0
            for l_0_34, l_0_35 in pairs(l_0_7[l_0_27]) do
              local l_0_36 = sysio.GetFileSize(sigattr_tail[l_0_35].utf8p1)
              local l_0_37 = sysio.ReadFile(sigattr_tail[l_0_35].utf8p1, 0, 4)
              if l_0_37 ~= nil and l_0_33[l_0_37] == nil then
                l_0_33[l_0_37] = 1
                l_0_33.count = l_0_33.count + 1
              end
              if l_0_10[l_0_35] ~= nil and l_0_18 == false then
                local l_0_38 = sigattr_tail[l_0_10[l_0_35]].utf8p2
                if 136 < #l_0_38 then
                  local l_0_39 = string.find(l_0_38, "RemoteIp", 100, true)
                  if l_0_39 ~= nil and 20 < #l_0_38 - l_0_39 then
                    local l_0_40 = {}
                    for l_0_41, l_0_42 in string.gmatch(l_0_38, "(%w+):([^;]+)") do
                      l_0_40[l_0_41] = l_0_42
                    end
                    if l_0_40.UsrName ~= nil and l_0_40.Domain ~= nil and l_0_40.RemoteIp ~= nil then
                      l_0_13 = l_0_40.UsrName
                      l_0_14 = l_0_40.Domain
                      l_0_15 = scrubData(l_0_40.UsrName)
                      l_0_16 = scrubData(l_0_40.Domain)
                      local l_0_43 = string.match(l_0_40.RemoteIp, "(.*):(.*)")
                      local l_0_44 = "NA"
                      if l_0_37 ~= nil then
                        l_0_44 = string.format("0x%02X%02X%02X%02X", string.byte(l_0_37, 1, 4))
                      end
                      if l_0_43 ~= nil and (l_0_17 == "" or l_0_17 == l_0_43) then
                        table.insert(l_0_12, {
                          path = sigattr_tail[l_0_35].utf8p1,
                          magic = l_0_44,
                          fileSize = l_0_36
                        })
                        l_0_17 = l_0_43
                      else
                        l_0_18 = true
                      end
                    end
                  end
                end
              end
            end
            if 3 <= l_0_33.count then
              l_0_32 = true
            end
            bm.add_related_string("magic_mismatch", tostring(l_0_32), bm.RelatedStringBMReport)
            bm.add_related_string("ransom_extension", l_0_27, bm.RelatedStringBMReport)
            local l_0_45 = {}
            local l_0_46 = {}
            local l_0_47 = bm.get_imagepath()
            if isnull(l_0_47) then
              l_0_47 = "NA"
            else
              l_0_47 = l_0_47:lower()
            end
            local l_0_48 = bm.get_current_process_startup_info()
            local l_0_49 = ""
            if l_0_48 ~= nil then
              l_0_49 = l_0_48.command_line
              l_0_48 = l_0_48.ppid
            else
              l_0_48 = -1
            end
            l_0_45.cur_image_path = l_0_47
            l_0_45.proc_info = l_0_48
            l_0_45.appended_ext = l_0_27
            l_0_45.magic_mismatch = l_0_32
            l_0_45.is_double_ext = l_0_19
            l_0_45.sig_count = l_0_2
            local l_0_50 = "FileChain_MainSet:"
            for l_0_51, l_0_52 in pairs(l_0_7[l_0_27]) do
              local l_0_53 = sigattr_tail[l_0_52].utf8p1
              local l_0_54 = string.find(l_0_53, "\\[^\\]*$") or 0
              local l_0_55 = string.find(l_0_53, ".", l_0_54, true)
              if l_0_55 ~= nil then
                local l_0_56 = string.sub(l_0_53, l_0_54 + 1, l_0_55 - 1)
                l_0_50 = l_0_50 .. crypto.CRC32Buffer(-1, l_0_56, 0, #l_0_56)
                l_0_50 = l_0_50 .. ";" .. string.sub(l_0_53, l_0_55 + 1) .. ";"
              end
              l_0_53 = sigattr_tail[l_0_52].utf8p2
              l_0_54 = string.find(l_0_53, "\\[^\\]*$") or 0
              l_0_55 = string.find(l_0_53, ".", l_0_54, true)
              if l_0_55 ~= nil then
                local l_0_57 = string.sub(l_0_53, l_0_54 + 1, l_0_55 - 1)
                l_0_50 = l_0_50 .. crypto.CRC32Buffer(-1, l_0_57, 0, #l_0_57)
                l_0_50 = l_0_50 .. ";" .. string.sub(l_0_53, l_0_55 + 1) .. ";"
              end
              table.insert(l_0_46, sigattr_tail[l_0_52].utf8p1)
              table.insert(l_0_46, sigattr_tail[l_0_52].utf8p2)
            end
            l_0_45.file_list = l_0_46
            local l_0_58, l_0_59 = bm.get_process_relationships()
            for l_0_60, l_0_61 in ipairs(l_0_58) do
              if l_0_61.image_path ~= nil then
                bm.add_related_process(l_0_61.ppid)
              end
            end
            for l_0_62, l_0_63 in ipairs(l_0_59) do
              if l_0_63.image_path ~= nil then
                bm.add_related_process(l_0_63.ppid)
                TrackPidAndTechniqueBM(l_0_63.ppid, "T1485", "susp_ransomware_childproc_type2")
              end
            end
            bm.add_related_string("ransom_files_main", l_0_50, bm.RelatedStringBMReport)
            local l_0_64 = safeJsonSerialize(l_0_45)
            bm.add_related_string("genb_ransom_meta", l_0_64, bm.RelatedStringBMReport)
            bm.trigger_sig("GenericRansomware:Type2", l_0_64)
            bm.trigger_sig_delayed("DelayedRansom:Type2", l_0_64, 10000)
            sms_untrusted_process()
            bm.add_action("SmsAsyncScanEvent", 100)
            TrackPidAndTechniqueBM(l_0_48, "T1486", "susp_ransomware_type2")
            reportTimingData()
            reportSessionInformationInclusive()
            local l_0_65, l_0_66 = pcall(reportBmInfo)
            if not l_0_65 and l_0_66 then
              bm.add_related_string("bmInfoFailReason", tostring(l_0_66), bm.RelatedStringBMReport)
            end
            if l_0_18 == false and 0 < #l_0_12 and l_0_17 ~= nil and l_0_17 ~= "" then
              local l_0_67 = mp.GetExtensionClass(l_0_27)
              if isnull(l_0_67) then
                l_0_67 = 1000
              end
              local l_0_68, l_0_69
              if MpCommon.GetBehavioralNetworkBlocksSettings then
                l_0_68, l_0_69 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
              end
              if not l_0_68 or l_0_69 == nil then
                l_0_69 = {
                  State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED,
                  MaxTimeout = 0,
                  Exclusions = "",
                  AggressiveLevel = 0
                }
              end
              l_0_11 = {
                Extension = l_0_27,
                ExtensionClass = l_0_67,
                imagePath = l_0_47,
                commandLine = l_0_49,
                ppID = l_0_48,
                UserName = l_0_15,
                Domain = l_0_16,
                file_list = l_0_12,
                Type = "Type2",
                RemoteEncConfig = l_0_69
              }
              local l_0_70 = safeJsonSerialize(l_0_11)
              local l_0_71 = "1bb146aa"
              local l_0_72 = "app_ext_" .. l_0_27
              local l_0_73 = MpCommon.AtomicCounterValueExNamespaced(l_0_72, l_0_71)
              l_0_11.ACSource = 3
              l_0_11.SignatureCountT2 = l_0_2
              if l_0_73 ~= nil then
                l_0_11.ACFilesEncryptCount = l_0_73.count
                l_0_11.ACCreationTime = l_0_73.insert_time
                l_0_11.ACExpirationTime = l_0_73.expire_time
                l_0_11.ACRecentTime = l_0_73.update_time
              else
                l_0_11.ACFilesEncryptCount = -1
              end
              bm.add_related_string("RemoteClientData", l_0_70, bm.RelatedStringBMReport)
              bm.trigger_sig("RemoteGenericRansomware:Type2", l_0_70)
              local l_0_74, l_0_75 = pcall(updateSystemDNSServers)
              if not l_0_74 then
                bm.add_related_string("updateSystemDNSServers_fail", l_0_75, bm.RelatedStringBMReport)
              end
              local l_0_76, l_0_77, l_0_78, l_0_79 = pcall(updateDomainInfo)
              if l_0_76 then
                l_0_11.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_17)
              else
                bm.add_related_string("updateDomainInfo_fail", l_0_77, bm.RelatedStringBMReport)
              end
              local l_0_80, l_0_81 = pcall(getBmInfo)
              if l_0_80 and l_0_81 then
                l_0_11.BmInfo = l_0_81
              end
              local l_0_82 = "GenRansomNote_enc"
              local l_0_83 = bm.get_current_process_startup_info()
              if l_0_83 ~= nil and l_0_83.ppid ~= nil then
                local l_0_84 = tostring(l_0_83.ppid)
                if l_0_17 and l_0_17 ~= "" then
                  l_0_84 = l_0_84 .. "|" .. l_0_17
                end
                local l_0_85 = GetRollingQueueKeyValues(l_0_82, l_0_84)
                if l_0_85 ~= nil then
                  l_0_11.noteItems = l_0_85
                  l_0_11.typex_enc_transfer = "success"
                else
                  l_0_11.typex_enc_transfer = "failure RQ nil"
                end
              else
                l_0_11.typex_enc_transfer = "failure general"
              end
              local l_0_86 = "GenB_enc_ft"
              local l_0_87 = 36000
              local l_0_88 = 10
              local l_0_89 = ""
              l_0_89 = l_0_89 .. l_0_27
              if l_0_17 and l_0_17 ~= "" then
                l_0_89 = l_0_89 .. "|" .. l_0_17
              else
                l_0_89 = l_0_89 .. "|<IPError>"
              end
              local l_0_90 = GetRollingQueueKeyValues(l_0_86, l_0_89)
              if l_0_90 == nil then
                l_0_90 = {
                  FileCountAtDetection = l_0_11.ACFilesEncryptCount,
                  TimeOfDetection = l_0_11.ACCreationTime
                }
                AppendToRollingQueue(l_0_86, l_0_89, safeJsonSerialize(l_0_90), l_0_87, l_0_88, 1)
                l_0_11.genb_ft_meta = l_0_90
                l_0_11.DetectionIteration = "1"
              else
                l_0_11.genb_ft_meta = l_0_90
                l_0_11.DetectionIteration = "n"
              end
              local l_0_91 = SafeGetUrlReputation({l_0_17}, {
                SIG_CONTEXT = "BM",
                CONTEXT_SOURCE = "GenRansom3",
                TAG = "NOLOOKUP",
                data = safeJsonSerialize(l_0_11)
              }, false, 3000, false)
              if l_0_91 and l_0_91.error == 3 then
                l_0_11.CRReportError = "Failed the first attempt"
                l_0_91 = SafeGetUrlReputation({l_0_17}, {
                  SIG_CONTEXT = "BM",
                  CONTEXT_SOURCE = "GenRansom3",
                  TAG = "NOLOOKUP",
                  data = safeJsonSerialize(l_0_11)
                }, false, 3000, false)
              end
              l_0_11.BmInfo = nil
              if l_0_91.urls[l_0_17] then
                l_0_11.confidence = l_0_91.urls[l_0_17].confidence
                l_0_11.family = l_0_91.urls[l_0_17].context.Family
                l_0_11.determination = l_0_91.urls[l_0_17].determination
                local l_0_92 = {
                  action = l_0_91.urls[l_0_17].context.action,
                  parameter = l_0_91.urls[l_0_17].context.action_parameter,
                  ttl = l_0_91.urls[l_0_17].context.action_ttl
                }
                l_0_11.action = l_0_92
                l_0_11.context = l_0_91.urls[l_0_17].context
                l_0_11.ip = l_0_17
                l_0_11.unscrubbed_username = l_0_13
                l_0_11.unscrubbed_domain = l_0_14
                l_0_11.DelayedTriggerCount = 0
                local l_0_93 = safeJsonSerialize(l_0_11)
                bm.trigger_sig_delayed("RemoteGenericRansomwareDelay:Type2", l_0_93, 570000)
                if (l_0_91.urls[l_0_17].determination == 2 or l_0_91.urls[l_0_17].determination == 1) and l_0_91.urls[l_0_17].confidence and l_0_91.urls[l_0_17].confidence >= 50 and l_0_91.urls[l_0_17].context.Source == "GenRansom" then
                  bm.trigger_sig("RemoteGenericRansomware:Malware", l_0_93)
                end
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
