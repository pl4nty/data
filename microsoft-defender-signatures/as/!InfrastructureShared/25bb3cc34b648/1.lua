-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25bb3cc34b648\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = (bm.get_sig_count)()
for l_0_6 = 1, l_0_0 do
  if (sigattr_tail[l_0_6]).attribute == 16385 then
    local l_0_7 = ((sigattr_tail[l_0_6]).utf8p1):lower()
    l_0_1[(mp.crc32)(0, l_0_7, 1, #l_0_7)] = l_0_6
  end
end
local l_0_8 = {}
local l_0_9 = {}
local l_0_10 = {}
local l_0_11 = {}
local l_0_12 = {}
local l_0_13 = {}
local l_0_14, l_0_15, l_0_16, l_0_17 = nil, nil, nil, nil
local l_0_18 = ""
local l_0_19 = false
local l_0_20 = false
for l_0_24 = 1, l_0_0 do
  if (sigattr_tail[l_0_24]).attribute == 16386 then
    local l_0_25 = ((sigattr_tail[l_0_24]).utf8p2):lower()
    local l_0_26 = ((sigattr_tail[l_0_24]).utf8p1):lower()
    local l_0_27 = (mp.crc32)(0, l_0_25, 1, #l_0_25)
    local l_0_28 = (mp.crc32)(0, l_0_26, 1, #l_0_26)
    if (l_0_1[l_0_28] ~= nil or l_0_1[l_0_27] ~= nil) and l_0_10[l_0_27] == nil then
      local l_0_29 = l_0_25:match("%.[^%.]+$")
      if l_0_29 ~= nil and (mp.bitand)((mp.GetExtensionClass)(l_0_29), 3) ~= 0 and #l_0_25 < #l_0_26 and l_0_26:find(l_0_25, 1, true) == 1 and l_0_26:byte(#l_0_25 + 1) ~= 58 then
        l_0_10[l_0_27] = 1
        local l_0_30 = l_0_26:match("%.[^%.]+$")
        if (mp.GetExtensionClass)(l_0_30) ~= 4 then
          if l_0_1[l_0_28] ~= nil then
            l_0_11[l_0_24] = l_0_1[l_0_28]
          else
            if l_0_1[l_0_27] ~= nil then
              l_0_11[l_0_24] = l_0_1[l_0_27]
            end
          end
          local l_0_31 = (string.sub)(l_0_26, #l_0_25 + 1)
          if l_0_8[l_0_31] ~= nil then
            (table.insert)(l_0_8[l_0_31], l_0_24)
          else
            local l_0_32 = {}
            -- DECOMPILER ERROR at PC151: No list found for R27 , SetList fails

          end
          do
            -- DECOMPILER ERROR at PC153: Overwrote pending register: R28 in 'AssignReg'

            local l_0_33 = l_0_31:match("%.[^%.]+$", 1, true)
            if l_0_33 ~= nil then
              if l_0_9[l_0_33] ~= nil then
                (table.insert)(l_0_9[l_0_33], l_0_24)
              else
                local l_0_34 = {}
                -- DECOMPILER ERROR at PC171: No list found for R28 , SetList fails

              end
              do
                do
                  if #l_0_9[l_0_33] >= 5 then
                    local l_0_35 = 0
                    -- DECOMPILER ERROR at PC178: Overwrote pending register: R29 in 'AssignReg'

                    for l_0_39,l_0_40 in l_0_24(l_0_8) do
                      if #l_0_8[l_0_39] == 1 then
                        l_0_35 = l_0_35 + 1
                      end
                    end
                    if l_0_35 >= 5 then
                      l_0_8 = l_0_9
                      l_0_31 = l_0_33
                      l_0_20 = true
                    end
                  end
                  if #l_0_8[l_0_31] >= 5 then
                    local l_0_41 = false
                    local l_0_42 = {}
                    l_0_42.count = 0
                    for l_0_46,l_0_47 in pairs(l_0_8[l_0_31]) do
                      local l_0_48 = (sysio.GetFileSize)((sigattr_tail[l_0_47]).utf8p1)
                      local l_0_49 = (sysio.ReadFile)((sigattr_tail[l_0_47]).utf8p1, 0, 4)
                      if l_0_49 ~= nil and l_0_42[l_0_49] == nil then
                        l_0_42[l_0_49] = 1
                        l_0_42.count = l_0_42.count + 1
                      end
                      if l_0_11[l_0_47] ~= nil and l_0_19 == false then
                        local l_0_50 = (sigattr_tail[l_0_11[l_0_47]]).utf8p2
                        if #l_0_50 > 136 then
                          local l_0_51 = (string.find)(l_0_50, "RemoteIp", 100, true)
                          if l_0_51 ~= nil and #l_0_50 - l_0_51 > 20 then
                            local l_0_52 = {}
                            for l_0_56,l_0_57 in (string.gmatch)(l_0_50, "(%w+):([^;]+)") do
                              l_0_52[l_0_56] = l_0_57
                            end
                            if l_0_52.UsrName ~= nil and l_0_52.Domain ~= nil and l_0_52.RemoteIp ~= nil then
                              l_0_14 = l_0_52.UsrName
                              l_0_15 = l_0_52.Domain
                              l_0_16 = scrubData(l_0_52.UsrName)
                              l_0_17 = scrubData(l_0_52.Domain)
                              local l_0_58 = (string.match)(l_0_52.RemoteIp, "(.*):(.*)")
                              local l_0_59 = "NA"
                              if l_0_49 ~= nil then
                                l_0_59 = (string.format)("0x%02X%02X%02X%02X", (string.byte)(l_0_49, 1, 4))
                              end
                              if l_0_58 ~= nil and (l_0_18 == "" or l_0_18 == l_0_58) then
                                local l_0_60 = table.insert
                                local l_0_61 = l_0_13
                                local l_0_62 = {}
                                l_0_62.path = (sigattr_tail[l_0_47]).utf8p1
                                l_0_62.magic = l_0_59
                                l_0_62.fileSize = l_0_48
                                l_0_60(l_0_61, l_0_62)
                                l_0_18 = l_0_58
                              else
                                do
                                  do
                                    l_0_19 = true
                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC321: LeaveBlock: unexpected jumping out IF_STMT

                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    if l_0_42.count > 4 then
                      l_0_41 = true
                    end
                    ;
                    (bm.add_related_string)("magic_mismatch", tostring(l_0_41), bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("ransom_extension", l_0_31, bm.RelatedStringBMReport)
                    local l_0_63 = {}
                    local l_0_64 = {}
                    local l_0_65 = (bm.get_imagepath)()
                    if isnull(l_0_65) then
                      l_0_65 = "NA"
                    else
                      l_0_65 = l_0_65:lower()
                    end
                    local l_0_66 = (bm.get_current_process_startup_info)()
                    local l_0_67 = ""
                    if l_0_66 ~= nil then
                      l_0_67 = l_0_66.command_line
                      l_0_66 = l_0_66.ppid
                    else
                      l_0_66 = -1
                    end
                    l_0_63.cur_image_path = l_0_65
                    l_0_63.proc_info = l_0_66
                    l_0_63.appended_ext = l_0_31
                    l_0_63.magic_mismatch = l_0_41
                    l_0_63.is_double_ext = l_0_20
                    l_0_63.sig_count = l_0_2
                    local l_0_68 = "FileChain_MainSet:"
                    for l_0_72,l_0_73 in pairs(l_0_8[l_0_31]) do
                      local l_0_74 = (sigattr_tail[l_0_73]).utf8p1
                      do
                        local l_0_75, l_0_76, l_0_77 = (string.find)(l_0_74, "\\[^\\]*$") or 0
                        -- DECOMPILER ERROR at PC394: Confused about usage of register: R42 in 'UnsetPending'

                        local l_0_78 = nil
                        do
                          if (string.find)(l_0_74, ".", l_0_75, true) ~= nil then
                            local l_0_79 = nil
                            l_0_68 = l_0_68 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_74, l_0_78 + 1, (string.find)(l_0_74, ".", l_0_75, true) - 1), 0, #(string.sub)(l_0_74, l_0_78 + 1, (string.find)(l_0_74, ".", l_0_75, true) - 1))
                            l_0_68 = l_0_68 .. ";" .. (string.sub)(l_0_74, l_0_79 + 1) .. ";"
                          end
                          l_0_74 = (sigattr_tail[l_0_73]).utf8p2
                          l_0_78 = (string.find)(l_0_74, "\\[^\\]*$") or 0
                          -- DECOMPILER ERROR at PC448: Confused about usage of register: R43 in 'UnsetPending'

                          do
                            do
                              if (string.find)(l_0_74, ".", l_0_78, true) ~= nil then
                                local l_0_80 = nil
                                l_0_68 = l_0_68 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_74, (l_0_78) + 1, (string.find)(l_0_74, ".", l_0_78, true) - 1), 0, #(string.sub)(l_0_74, (l_0_78) + 1, (string.find)(l_0_74, ".", l_0_78, true) - 1))
                                l_0_68 = l_0_68 .. ";" .. (string.sub)(l_0_74, l_0_80 + 1) .. ";"
                              end
                              ;
                              (table.insert)(l_0_64, (sigattr_tail[l_0_73]).utf8p1)
                              ;
                              (table.insert)(l_0_64, (sigattr_tail[l_0_73]).utf8p2)
                              -- DECOMPILER ERROR at PC482: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC482: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC482: LeaveBlock: unexpected jumping out DO_STMT

                            end
                          end
                        end
                      end
                    end
                    l_0_63.file_list = l_0_64
                    local l_0_81, l_0_82 = (bm.get_process_relationships)()
                    for l_0_86,l_0_87 in ipairs(l_0_81) do
                      if l_0_87.image_path ~= nil then
                        (bm.add_related_process)(l_0_87.ppid)
                      end
                    end
                    for l_0_91,l_0_92 in ipairs(l_0_82) do
                      if l_0_92.image_path ~= nil then
                        (bm.add_related_process)(l_0_92.ppid)
                        TrackPidAndTechniqueBM(l_0_92.ppid, "T1485", "susp_ransomware_childproc_type2")
                      end
                    end
                    ;
                    (bm.add_related_string)("ransom_files_main", l_0_68, bm.RelatedStringBMReport)
                    local l_0_93 = safeJsonSerialize(l_0_63)
                    ;
                    (bm.add_related_string)("genb_ransom_meta", l_0_93, bm.RelatedStringBMReport)
                    ;
                    (bm.trigger_sig)("GenericRansomware:Type2", l_0_93)
                    ;
                    (bm.trigger_sig_delayed)("DelayedRansom:Type2", l_0_93, 10000)
                    sms_untrusted_process()
                    ;
                    (bm.add_action)("SmsAsyncScanEvent", 100)
                    TrackPidAndTechniqueBM(l_0_66, "T1486", "susp_ransomware_type2")
                    reportTimingData()
                    reportSessionInformationInclusive()
                    local l_0_94, l_0_95 = pcall(reportBmInfo)
                    if not l_0_94 and l_0_95 then
                      (bm.add_related_string)("bmInfoFailReason", tostring(l_0_95), bm.RelatedStringBMReport)
                    end
                    if l_0_19 == false and #l_0_13 > 0 and l_0_18 ~= nil and l_0_18 ~= "" then
                      local l_0_96 = (mp.GetExtensionClass)(l_0_31)
                      if isnull(l_0_96) then
                        l_0_96 = 1000
                      end
                      local l_0_97, l_0_98 = nil, nil
                      if MpCommon.GetBehavioralNetworkBlocksSettings then
                        l_0_97 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
                      end
                      do
                        if not l_0_97 or l_0_98 == nil then
                          local l_0_99 = {}
                          l_0_99.State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                          l_0_99.MaxTimeout = 0
                          l_0_99.Exclusions = ""
                          l_0_99.AggressiveLevel = 0
                          -- DECOMPILER ERROR at PC622: Overwrote pending register: R43 in 'AssignReg'

                        end
                        local l_0_100 = {}
                        l_0_100.Extension = l_0_31
                        l_0_100.ExtensionClass = l_0_96
                        l_0_100.imagePath = l_0_65
                        l_0_100.commandLine = l_0_67
                        l_0_100.ppID = l_0_66
                        l_0_100.UserName = l_0_16
                        l_0_100.Domain = l_0_17
                        l_0_100.file_list = l_0_13
                        l_0_100.Type = "Type2"
                        l_0_100.RemoteEncConfig = l_0_98
                        l_0_12 = l_0_100
                        l_0_100 = safeJsonSerialize
                        l_0_100 = l_0_100(l_0_12)
                        ;
                        (bm.add_related_string)("RemoteClientData", l_0_100, bm.RelatedStringBMReport)
                        ;
                        (bm.trigger_sig)("RemoteGenericRansomware:Type2", l_0_100)
                        local l_0_101, l_0_102 = pcall(updateSystemDNSServers)
                        if not l_0_101 then
                          (bm.add_related_string)("updateSystemDNSServers_fail", l_0_102, bm.RelatedStringBMReport)
                        end
                        local l_0_103, l_0_104, l_0_105, l_0_106 = pcall(updateDomainInfo)
                        if l_0_103 then
                          l_0_12.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_18)
                        else
                          ;
                          (bm.add_related_string)("updateDomainInfo_fail", l_0_104, bm.RelatedStringBMReport)
                        end
                        local l_0_107 = SafeGetUrlReputation
                        local l_0_108 = {}
                        -- DECOMPILER ERROR at PC683: No list found for R52 , SetList fails

                        local l_0_109 = {}
                        l_0_109.SIG_CONTEXT = "BM"
                        l_0_109.CONTEXT_SOURCE = "GenRansom3"
                        l_0_109.TAG = "NOLOOKUP"
                        l_0_109.data = safeJsonSerialize(l_0_12)
                        l_0_107 = l_0_107(l_0_108, l_0_109, false, 3000, false)
                        if l_0_107 then
                          l_0_108 = l_0_107.error
                          if l_0_108 == 3 then
                            l_0_12.CRReportError = "Failed the first attempt"
                            l_0_108 = SafeGetUrlReputation
                            local l_0_110 = {}
                            l_0_110.SIG_CONTEXT = "BM"
                            l_0_110.CONTEXT_SOURCE = "GenRansom3"
                            l_0_110.TAG = "NOLOOKUP"
                            l_0_110.data = safeJsonSerialize(l_0_12)
                            l_0_108, l_0_109 = l_0_108(l_0_109, l_0_110, false, 3000, false), {l_0_18}
                            l_0_107 = l_0_108
                          end
                        end
                        do
                          do
                            do
                              l_0_108 = l_0_107.urls
                              l_0_108 = l_0_108[l_0_18]
                              if l_0_108 then
                                l_0_108 = l_0_107.urls
                                l_0_108 = l_0_108[l_0_18]
                                l_0_108 = l_0_108.determination
                                if l_0_108 ~= 2 then
                                  l_0_108 = l_0_107.urls
                                  l_0_108 = l_0_108[l_0_18]
                                  l_0_108 = l_0_108.determination
                                end
                                if l_0_108 == 1 then
                                  l_0_108 = l_0_107.urls
                                  l_0_108 = l_0_108[l_0_18]
                                  l_0_108 = l_0_108.confidence
                                  if l_0_108 then
                                    l_0_108 = l_0_107.urls
                                    l_0_108 = l_0_108[l_0_18]
                                    l_0_108 = l_0_108.confidence
                                    if l_0_108 >= 50 then
                                      l_0_108 = l_0_107.urls
                                      l_0_108 = l_0_108[l_0_18]
                                      l_0_108 = l_0_108.context
                                      l_0_108 = l_0_108.Source
                                      if l_0_108 == "GenRansom" then
                                        l_0_108 = l_0_107.urls
                                        l_0_108 = l_0_108[l_0_18]
                                        l_0_108 = l_0_108.confidence
                                        l_0_12.confidence = l_0_108
                                        l_0_108 = l_0_107.urls
                                        l_0_108 = l_0_108[l_0_18]
                                        l_0_108 = l_0_108.context
                                        l_0_108 = l_0_108.Family
                                        l_0_12.family = l_0_108
                                        l_0_108 = l_0_107.urls
                                        l_0_108 = l_0_108[l_0_18]
                                        l_0_108 = l_0_108.determination
                                        l_0_12.determination = l_0_108
                                        l_0_109 = l_0_107.urls
                                        l_0_109 = l_0_109[l_0_18]
                                        l_0_109 = l_0_109.context
                                        l_0_109 = l_0_109.action
                                        l_0_109 = l_0_107.urls
                                        l_0_109 = l_0_109[l_0_18]
                                        l_0_109 = l_0_109.context
                                        l_0_109 = l_0_109.action_parameter
                                        l_0_109 = l_0_107.urls
                                        l_0_109 = l_0_109[l_0_18]
                                        l_0_109 = l_0_109.context
                                        l_0_109 = l_0_109.action_ttl
                                        l_0_12.action, l_0_108 = l_0_108, {action = l_0_109, parameter = l_0_109, ttl = l_0_109}
                                        l_0_109 = l_0_107.urls
                                        l_0_109 = l_0_109[l_0_18]
                                        l_0_109 = l_0_109.context
                                        l_0_12.context = l_0_109
                                        l_0_12.ip = l_0_18
                                        l_0_12.unscrubbed_username = l_0_14
                                        l_0_12.unscrubbed_domain = l_0_15
                                        l_0_109 = bm
                                        l_0_109 = l_0_109.trigger_sig
                                        l_0_109("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_12))
                                      end
                                    end
                                  end
                                end
                              end
                              -- DECOMPILER ERROR at PC796: Overwrote pending register: R43 in 'AssignReg'

                              ;
                              (bm.add_related_string)("sigcount_type2", l_0_98, bm.RelatedStringBMReport)
                              do return mp.INFECTED end
                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC803: LeaveBlock: unexpected jumping out IF_STMT

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

