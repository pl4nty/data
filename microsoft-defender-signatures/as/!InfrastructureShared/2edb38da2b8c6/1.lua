-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2edb38da2b8c6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = (bm.get_sig_count)()
local l_0_3 = 0
for l_0_7 = 1, l_0_0 do
  if (sigattr_tail[l_0_7]).attribute == 16385 then
    local l_0_8 = ((sigattr_tail[l_0_7]).utf8p1):lower()
    local l_0_9 = (mp.crc32)(0, l_0_8, 1, #l_0_8)
    if l_0_1[l_0_9] == nil then
      l_0_3 = l_0_3 + 1
    end
    l_0_1[l_0_9] = l_0_7
  end
end
if l_0_3 < 3 then
  return mp.CLEAN
end
local l_0_10 = {}
local l_0_11 = {}
local l_0_12 = {}
local l_0_13 = {}
local l_0_14 = {}
local l_0_15 = {}
local l_0_16, l_0_17, l_0_18, l_0_19 = nil, nil, nil, nil
local l_0_20 = ""
local l_0_21 = false
local l_0_22 = false
for l_0_26 = 1, l_0_0 do
  if (sigattr_tail[l_0_26]).attribute == 16386 then
    local l_0_27 = ((sigattr_tail[l_0_26]).utf8p2):lower()
    local l_0_28 = ((sigattr_tail[l_0_26]).utf8p1):lower()
    local l_0_29 = (mp.crc32)(0, l_0_27, 1, #l_0_27)
    local l_0_30 = (mp.crc32)(0, l_0_28, 1, #l_0_28)
    if (l_0_1[l_0_30] ~= nil or l_0_1[l_0_29] ~= nil) and l_0_12[l_0_29] == nil then
      local l_0_31 = l_0_27:match("%.[^%.]+$")
      if l_0_31 ~= nil and (mp.bitand)((mp.GetExtensionClass)(l_0_31), 3) ~= 0 and #l_0_27 < #l_0_28 and l_0_28:find(l_0_27, 1, true) == 1 and l_0_28:byte(#l_0_27 + 1) ~= 58 then
        l_0_12[l_0_29] = 1
        local l_0_32 = l_0_28:match("%.[^%.]+$")
        if (mp.GetExtensionClass)(l_0_32) ~= 4 or isKnownRansomExtension(l_0_32) then
          if l_0_1[l_0_30] ~= nil then
            l_0_13[l_0_26] = l_0_1[l_0_30]
          else
            if l_0_1[l_0_29] ~= nil then
              l_0_13[l_0_26] = l_0_1[l_0_29]
            end
          end
          local l_0_33 = (string.sub)(l_0_28, #l_0_27 + 1)
          if l_0_10[l_0_33] ~= nil then
            (table.insert)(l_0_10[l_0_33], l_0_26)
          else
            local l_0_34 = {}
            -- DECOMPILER ERROR at PC166: No list found for R28 , SetList fails

          end
          do
            -- DECOMPILER ERROR at PC168: Overwrote pending register: R29 in 'AssignReg'

            local l_0_35 = l_0_33:match("%.[^%.]+$", 1, true)
            if l_0_35 ~= nil then
              if l_0_11[l_0_35] ~= nil then
                (table.insert)(l_0_11[l_0_35], l_0_26)
              else
                local l_0_36 = {}
                -- DECOMPILER ERROR at PC186: No list found for R29 , SetList fails

              end
              do
                do
                  if #l_0_11[l_0_35] >= 3 then
                    local l_0_37 = 0
                    -- DECOMPILER ERROR at PC193: Overwrote pending register: R30 in 'AssignReg'

                    for l_0_41,l_0_42 in l_0_26(l_0_10) do
                      if #l_0_10[l_0_41] == 1 then
                        l_0_37 = l_0_37 + 1
                      end
                    end
                    if l_0_37 >= 3 then
                      l_0_10 = l_0_11
                      l_0_33 = l_0_35
                      l_0_22 = true
                    end
                  end
                  if #l_0_10[l_0_33] >= 3 then
                    local l_0_43 = false
                    local l_0_44 = {}
                    l_0_44.count = 0
                    for l_0_48,l_0_49 in pairs(l_0_10[l_0_33]) do
                      local l_0_50 = (sysio.GetFileSize)((sigattr_tail[l_0_49]).utf8p1)
                      local l_0_51 = (sysio.ReadFile)((sigattr_tail[l_0_49]).utf8p1, 0, 4)
                      if l_0_51 ~= nil and l_0_44[l_0_51] == nil then
                        l_0_44[l_0_51] = 1
                        l_0_44.count = l_0_44.count + 1
                      end
                      if l_0_13[l_0_49] ~= nil and l_0_21 == false then
                        local l_0_52 = (sigattr_tail[l_0_13[l_0_49]]).utf8p2
                        if #l_0_52 > 136 then
                          local l_0_53 = (string.find)(l_0_52, "RemoteIp", 100, true)
                          if l_0_53 ~= nil and #l_0_52 - l_0_53 > 20 then
                            local l_0_54 = {}
                            for l_0_58,l_0_59 in (string.gmatch)(l_0_52, "(%w+):([^;]+)") do
                              l_0_54[l_0_58] = l_0_59
                            end
                            if l_0_54.UsrName ~= nil and l_0_54.Domain ~= nil and l_0_54.RemoteIp ~= nil then
                              l_0_16 = l_0_54.UsrName
                              l_0_17 = l_0_54.Domain
                              l_0_18 = scrubData(l_0_54.UsrName)
                              l_0_19 = scrubData(l_0_54.Domain)
                              local l_0_60 = (string.match)(l_0_54.RemoteIp, "(.*):(.*)")
                              local l_0_61 = "NA"
                              if l_0_51 ~= nil then
                                l_0_61 = (string.format)("0x%02X%02X%02X%02X", (string.byte)(l_0_51, 1, 4))
                              end
                              if l_0_60 ~= nil and (l_0_20 == "" or l_0_20 == l_0_60) then
                                local l_0_62 = table.insert
                                local l_0_63 = l_0_15
                                local l_0_64 = {}
                                l_0_64.path = (sigattr_tail[l_0_49]).utf8p1
                                l_0_64.magic = l_0_61
                                l_0_64.fileSize = l_0_50
                                l_0_62(l_0_63, l_0_64)
                                l_0_20 = l_0_60
                              else
                                do
                                  do
                                    l_0_21 = true
                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_STMT

                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    if l_0_44.count >= 3 then
                      l_0_43 = true
                    end
                    ;
                    (bm.add_related_string)("magic_mismatch", tostring(l_0_43), bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("ransom_extension", l_0_33, bm.RelatedStringBMReport)
                    local l_0_65 = {}
                    local l_0_66 = {}
                    local l_0_67 = (bm.get_imagepath)()
                    if isnull(l_0_67) then
                      l_0_67 = "NA"
                    else
                      l_0_67 = l_0_67:lower()
                    end
                    local l_0_68 = (bm.get_current_process_startup_info)()
                    local l_0_69 = ""
                    if l_0_68 ~= nil then
                      l_0_69 = l_0_68.command_line
                      l_0_68 = l_0_68.ppid
                    else
                      l_0_68 = -1
                    end
                    l_0_65.cur_image_path = l_0_67
                    l_0_65.proc_info = l_0_68
                    l_0_65.appended_ext = l_0_33
                    l_0_65.magic_mismatch = l_0_43
                    l_0_65.is_double_ext = l_0_22
                    l_0_65.sig_count = l_0_2
                    local l_0_70 = "FileChain_MainSet:"
                    for l_0_74,l_0_75 in pairs(l_0_10[l_0_33]) do
                      local l_0_76 = (sigattr_tail[l_0_75]).utf8p1
                      do
                        local l_0_77, l_0_78, l_0_79 = (string.find)(l_0_76, "\\[^\\]*$") or 0
                        -- DECOMPILER ERROR at PC409: Confused about usage of register: R43 in 'UnsetPending'

                        local l_0_80 = nil
                        do
                          if (string.find)(l_0_76, ".", l_0_77, true) ~= nil then
                            local l_0_81 = nil
                            l_0_70 = l_0_70 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_76, l_0_80 + 1, (string.find)(l_0_76, ".", l_0_77, true) - 1), 0, #(string.sub)(l_0_76, l_0_80 + 1, (string.find)(l_0_76, ".", l_0_77, true) - 1))
                            l_0_70 = l_0_70 .. ";" .. (string.sub)(l_0_76, l_0_81 + 1) .. ";"
                          end
                          l_0_76 = (sigattr_tail[l_0_75]).utf8p2
                          l_0_80 = (string.find)(l_0_76, "\\[^\\]*$") or 0
                          -- DECOMPILER ERROR at PC463: Confused about usage of register: R44 in 'UnsetPending'

                          do
                            do
                              if (string.find)(l_0_76, ".", l_0_80, true) ~= nil then
                                local l_0_82 = nil
                                l_0_70 = l_0_70 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_76, (l_0_80) + 1, (string.find)(l_0_76, ".", l_0_80, true) - 1), 0, #(string.sub)(l_0_76, (l_0_80) + 1, (string.find)(l_0_76, ".", l_0_80, true) - 1))
                                l_0_70 = l_0_70 .. ";" .. (string.sub)(l_0_76, l_0_82 + 1) .. ";"
                              end
                              ;
                              (table.insert)(l_0_66, (sigattr_tail[l_0_75]).utf8p1)
                              ;
                              (table.insert)(l_0_66, (sigattr_tail[l_0_75]).utf8p2)
                              -- DECOMPILER ERROR at PC497: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC497: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC497: LeaveBlock: unexpected jumping out DO_STMT

                            end
                          end
                        end
                      end
                    end
                    l_0_65.file_list = l_0_66
                    local l_0_83, l_0_84 = (bm.get_process_relationships)()
                    for l_0_88,l_0_89 in ipairs(l_0_83) do
                      if l_0_89.image_path ~= nil then
                        (bm.add_related_process)(l_0_89.ppid)
                      end
                    end
                    for l_0_93,l_0_94 in ipairs(l_0_84) do
                      if l_0_94.image_path ~= nil then
                        (bm.add_related_process)(l_0_94.ppid)
                        TrackPidAndTechniqueBM(l_0_94.ppid, "T1485", "susp_ransomware_childproc_type2")
                      end
                    end
                    ;
                    (bm.add_related_string)("ransom_files_main", l_0_70, bm.RelatedStringBMReport)
                    local l_0_95 = safeJsonSerialize(l_0_65)
                    ;
                    (bm.add_related_string)("genb_ransom_meta", l_0_95, bm.RelatedStringBMReport)
                    ;
                    (bm.trigger_sig)("GenericRansomware:Type2", l_0_95)
                    ;
                    (bm.trigger_sig_delayed)("DelayedRansom:Type2", l_0_95, 10000)
                    sms_untrusted_process()
                    ;
                    (bm.add_action)("SmsAsyncScanEvent", 100)
                    TrackPidAndTechniqueBM(l_0_68, "T1486", "susp_ransomware_type2")
                    reportTimingData()
                    reportSessionInformationInclusive()
                    local l_0_96, l_0_97 = pcall(reportBmInfo)
                    if not l_0_96 and l_0_97 then
                      (bm.add_related_string)("bmInfoFailReason", tostring(l_0_97), bm.RelatedStringBMReport)
                    end
                    if l_0_21 == false and #l_0_15 > 0 and l_0_20 ~= nil and l_0_20 ~= "" then
                      local l_0_98 = (mp.GetExtensionClass)(l_0_33)
                      if isnull(l_0_98) then
                        l_0_98 = 1000
                      end
                      local l_0_99, l_0_100 = nil, nil
                      if MpCommon.GetBehavioralNetworkBlocksSettings then
                        l_0_99 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
                      end
                      do
                        if not l_0_99 or l_0_100 == nil then
                          local l_0_101 = {}
                          l_0_101.State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                          l_0_101.MaxTimeout = 0
                          l_0_101.Exclusions = ""
                          l_0_101.AggressiveLevel = 0
                          -- DECOMPILER ERROR at PC637: Overwrote pending register: R44 in 'AssignReg'

                        end
                        local l_0_102 = {}
                        l_0_102.Extension = l_0_33
                        l_0_102.ExtensionClass = l_0_98
                        l_0_102.imagePath = l_0_67
                        l_0_102.commandLine = l_0_69
                        l_0_102.ppID = l_0_68
                        l_0_102.UserName = l_0_18
                        l_0_102.Domain = l_0_19
                        l_0_102.file_list = l_0_15
                        l_0_102.Type = "Type2"
                        l_0_102.RemoteEncConfig = l_0_100
                        l_0_14 = l_0_102
                        l_0_102 = safeJsonSerialize
                        l_0_102 = l_0_102(l_0_14)
                        local l_0_103 = "1bb146aa"
                        local l_0_104 = "app_ext_" .. l_0_33
                        local l_0_105 = (MpCommon.AtomicCounterValueExNamespaced)(l_0_104, l_0_103)
                        l_0_14.ACSource = 3
                        l_0_14.SignatureCountT2 = l_0_2
                        if l_0_105 ~= nil then
                          l_0_14.ACFilesEncryptCount = l_0_105.count
                          l_0_14.ACCreationTime = l_0_105.insert_time
                          l_0_14.ACExpirationTime = l_0_105.expire_time
                          l_0_14.ACRecentTime = l_0_105.update_time
                        else
                          l_0_14.ACFilesEncryptCount = -1
                        end
                        ;
                        (bm.add_related_string)("RemoteClientData", l_0_102, bm.RelatedStringBMReport)
                        ;
                        (bm.trigger_sig)("RemoteGenericRansomware:Type2", l_0_102)
                        local l_0_106, l_0_107 = pcall(updateSystemDNSServers)
                        if not l_0_106 then
                          (bm.add_related_string)("updateSystemDNSServers_fail", l_0_107, bm.RelatedStringBMReport)
                        end
                        local l_0_108, l_0_109, l_0_110, l_0_111 = pcall(updateDomainInfo)
                        if l_0_108 then
                          l_0_14.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_20)
                        else
                          ;
                          (bm.add_related_string)("updateDomainInfo_fail", l_0_109, bm.RelatedStringBMReport)
                        end
                        local l_0_112, l_0_113 = pcall(getBmInfo)
                        if l_0_112 and l_0_113 then
                          l_0_14.BmInfo = l_0_113
                        end
                        local l_0_114 = "GenRansomNote_enc"
                        local l_0_115 = (bm.get_current_process_startup_info)()
                        if l_0_115 ~= nil and l_0_115.ppid ~= nil then
                          local l_0_116 = tostring(l_0_115.ppid)
                          if l_0_20 and l_0_20 ~= "" then
                            l_0_116 = l_0_116 .. "|" .. l_0_20
                          end
                          local l_0_117 = GetRollingQueueKeyValues(l_0_114, l_0_116)
                          if l_0_117 ~= nil then
                            l_0_14.noteItems = l_0_117
                            l_0_14.typex_enc_transfer = "success"
                          else
                            l_0_14.typex_enc_transfer = "failure RQ nil"
                          end
                        else
                          do
                            l_0_14.typex_enc_transfer = "failure general"
                            local l_0_118 = "GenB_enc_ft"
                            local l_0_119 = 36000
                            local l_0_120 = 10
                            local l_0_121 = ""
                            l_0_121 = l_0_121 .. l_0_33
                            if l_0_20 and l_0_20 ~= "" then
                              l_0_121 = l_0_121 .. "|" .. l_0_20
                            else
                              l_0_121 = l_0_121 .. "|<IPError>"
                            end
                            local l_0_122 = GetRollingQueueKeyValues(l_0_118, l_0_121)
                            if l_0_122 == nil then
                              local l_0_123 = {}
                              l_0_123.FileCountAtDetection = l_0_14.ACFilesEncryptCount
                              l_0_123.TimeOfDetection = l_0_14.ACCreationTime
                              l_0_122 = l_0_123
                              l_0_123 = AppendToRollingQueue
                              l_0_123(l_0_118, l_0_121, safeJsonSerialize(l_0_122), l_0_119, l_0_120, 1)
                              l_0_14.genb_ft_meta = l_0_122
                              l_0_14.DetectionIteration = "1"
                            else
                              do
                                l_0_14.genb_ft_meta = l_0_122
                                l_0_14.DetectionIteration = "n"
                                local l_0_124 = SafeGetUrlReputation
                                local l_0_125 = {}
                                -- DECOMPILER ERROR at PC807: No list found for R65 , SetList fails

                                local l_0_126 = {}
                                l_0_126.SIG_CONTEXT = "BM"
                                l_0_126.CONTEXT_SOURCE = "GenRansom3"
                                l_0_126.TAG = "NOLOOKUP"
                                l_0_126.data = safeJsonSerialize(l_0_14)
                                l_0_124 = l_0_124(l_0_125, l_0_126, false, 3000, false)
                                if l_0_124 then
                                  l_0_125 = l_0_124.error
                                  if l_0_125 == 3 then
                                    l_0_14.CRReportError = "Failed the first attempt"
                                    l_0_125 = SafeGetUrlReputation
                                    local l_0_127 = {}
                                    l_0_127.SIG_CONTEXT = "BM"
                                    l_0_127.CONTEXT_SOURCE = "GenRansom3"
                                    l_0_127.TAG = "NOLOOKUP"
                                    l_0_127.data = safeJsonSerialize(l_0_14)
                                    l_0_125, l_0_126 = l_0_125(l_0_126, l_0_127, false, 3000, false), {l_0_20}
                                    l_0_124 = l_0_125
                                  end
                                end
                                do
                                  do
                                    do
                                      l_0_14.BmInfo = nil
                                      l_0_125 = l_0_124.urls
                                      l_0_125 = l_0_125[l_0_20]
                                      if l_0_125 then
                                        l_0_125 = l_0_124.urls
                                        l_0_125 = l_0_125[l_0_20]
                                        l_0_125 = l_0_125.confidence
                                        l_0_14.confidence = l_0_125
                                        l_0_125 = l_0_124.urls
                                        l_0_125 = l_0_125[l_0_20]
                                        l_0_125 = l_0_125.context
                                        l_0_125 = l_0_125.Family
                                        l_0_14.family = l_0_125
                                        l_0_125 = l_0_124.urls
                                        l_0_125 = l_0_125[l_0_20]
                                        l_0_125 = l_0_125.determination
                                        l_0_14.determination = l_0_125
                                        l_0_126 = l_0_124.urls
                                        l_0_126 = l_0_126[l_0_20]
                                        l_0_126 = l_0_126.context
                                        l_0_126 = l_0_126.action
                                        l_0_126 = l_0_124.urls
                                        l_0_126 = l_0_126[l_0_20]
                                        l_0_126 = l_0_126.context
                                        l_0_126 = l_0_126.action_parameter
                                        l_0_126 = l_0_124.urls
                                        l_0_126 = l_0_126[l_0_20]
                                        l_0_126 = l_0_126.context
                                        l_0_126 = l_0_126.action_ttl
                                        l_0_14.action, l_0_125 = l_0_125, {action = l_0_126, parameter = l_0_126, ttl = l_0_126}
                                        l_0_126 = l_0_124.urls
                                        l_0_126 = l_0_126[l_0_20]
                                        l_0_126 = l_0_126.context
                                        l_0_14.context = l_0_126
                                        l_0_14.ip = l_0_20
                                        l_0_14.unscrubbed_username = l_0_16
                                        l_0_14.unscrubbed_domain = l_0_17
                                        l_0_14.DelayedTriggerCount = 0
                                        l_0_126 = safeJsonSerialize
                                        l_0_126 = l_0_126(l_0_14)
                                        ;
                                        (bm.trigger_sig_delayed)("RemoteGenericRansomwareDelay:Type2", l_0_126, 570000)
                                        if (((l_0_124.urls)[l_0_20]).determination == 2 or ((l_0_124.urls)[l_0_20]).determination == 1) and ((l_0_124.urls)[l_0_20]).confidence and ((l_0_124.urls)[l_0_20]).confidence >= 50 and (((l_0_124.urls)[l_0_20]).context).Source == "GenRansom" then
                                          (bm.trigger_sig)("RemoteGenericRansomware:Malware", l_0_126)
                                        end
                                      end
                                      -- DECOMPILER ERROR at PC929: Overwrote pending register: R44 in 'AssignReg'

                                      ;
                                      (bm.add_related_string)("sigcount_type2", l_0_100, bm.RelatedStringBMReport)
                                      do return mp.INFECTED end
                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC936: LeaveBlock: unexpected jumping out IF_STMT

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
              end
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN

