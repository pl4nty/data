-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\453b3d8af5937\0x0000c509_luac 

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
                  local l_0_41 = {}
                  for l_0_45,l_0_46 in pairs(l_0_8) do
                    (table.insert)(l_0_41, l_0_45)
                  end
                  if #l_0_41 >= 5 then
                    local l_0_47 = false
                    local l_0_48 = {}
                    l_0_48.count = 0
                    for l_0_52,l_0_53 in ipairs(l_0_41) do
                      for l_0_57,l_0_58 in pairs(l_0_8[l_0_53]) do
                        local l_0_59 = (sysio.GetFileSize)((sigattr_tail[l_0_58]).utf8p1)
                        local l_0_60 = (sysio.ReadFile)((sigattr_tail[l_0_58]).utf8p1, 0, 4)
                        if l_0_60 ~= nil and l_0_48[l_0_60] == nil then
                          l_0_48[l_0_60] = 1
                          l_0_48.count = l_0_48.count + 1
                        end
                        if l_0_11[l_0_58] ~= nil and l_0_19 == false then
                          local l_0_61 = (sigattr_tail[l_0_11[l_0_58]]).utf8p2
                          if #l_0_61 > 136 then
                            local l_0_62 = (string.find)(l_0_61, "RemoteIp", 100, true)
                            if l_0_62 ~= nil and #l_0_61 - l_0_62 > 20 then
                              local l_0_63 = {}
                              for l_0_67,l_0_68 in (string.gmatch)(l_0_61, "(%w+):([^;]+)") do
                                l_0_63[l_0_67] = l_0_68
                              end
                              if l_0_63.UsrName ~= nil and l_0_63.Domain ~= nil and l_0_63.RemoteIp ~= nil then
                                l_0_14 = l_0_63.UsrName
                                l_0_15 = l_0_63.Domain
                                l_0_16 = scrubData(l_0_63.UsrName)
                                l_0_17 = scrubData(l_0_63.Domain)
                                local l_0_69 = (string.match)(l_0_63.RemoteIp, "(.*):(.*)")
                                local l_0_70 = "NA"
                                if l_0_60 ~= nil then
                                  l_0_70 = (string.format)("0x%02X%02X%02X%02X", (string.byte)(l_0_60, 1, 4))
                                end
                                if l_0_69 ~= nil and (l_0_18 == "" or l_0_18 == l_0_69) then
                                  local l_0_71 = table.insert
                                  local l_0_72 = l_0_13
                                  local l_0_73 = {}
                                  l_0_73.path = (sigattr_tail[l_0_58]).utf8p1
                                  l_0_73.magic = l_0_70
                                  l_0_73.fileSize = l_0_59
                                  l_0_71(l_0_72, l_0_73)
                                  l_0_18 = l_0_69
                                else
                                  do
                                    do
                                      l_0_19 = true
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
                    end
                    if l_0_48.count > 4 then
                      l_0_47 = true
                    end
                    ;
                    (bm.add_related_string)("magic_mismatch", tostring(l_0_47), bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("ransom_extension", safeJsonSerialize(l_0_41), bm.RelatedStringBMReport)
                    local l_0_74 = {}
                    local l_0_75 = {}
                    local l_0_76 = ((bm.get_imagepath)()):lower()
                    local l_0_77 = (bm.get_current_process_startup_info)()
                    local l_0_78 = ""
                    if l_0_77 ~= nil then
                      l_0_78 = l_0_77.command_line
                      l_0_77 = l_0_77.ppid
                    else
                      l_0_77 = -1
                    end
                    l_0_74.cur_image_path = l_0_76
                    l_0_74.proc_info = l_0_77
                    l_0_74.appended_ext = l_0_41
                    l_0_74.magic_mismatch = l_0_47
                    l_0_74.is_double_ext = l_0_20
                    local l_0_79 = "FileChain_MainSet:"
                    for l_0_83,l_0_84 in ipairs(l_0_41) do
                      for l_0_88,l_0_89 in pairs(l_0_8[l_0_84]) do
                        local l_0_90 = (sigattr_tail[l_0_89]).utf8p1
                        do
                          local l_0_91, l_0_92, l_0_93 = (string.find)(l_0_90, "\\[^\\]*$") or 0
                          -- DECOMPILER ERROR at PC408: Confused about usage of register: R48 in 'UnsetPending'

                          local l_0_94 = nil
                          do
                            if (string.find)(l_0_90, ".", l_0_91, true) ~= nil then
                              local l_0_95 = nil
                              l_0_79 = l_0_79 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_90, l_0_94 + 1, (string.find)(l_0_90, ".", l_0_91, true) - 1), 0, #(string.sub)(l_0_90, l_0_94 + 1, (string.find)(l_0_90, ".", l_0_91, true) - 1))
                              l_0_79 = l_0_79 .. ";" .. (string.sub)(l_0_90, l_0_95 + 1) .. ";"
                            end
                            l_0_90 = (sigattr_tail[l_0_89]).utf8p2
                            l_0_94 = (string.find)(l_0_90, "\\[^\\]*$") or 0
                            -- DECOMPILER ERROR at PC462: Confused about usage of register: R49 in 'UnsetPending'

                            do
                              do
                                if (string.find)(l_0_90, ".", l_0_94, true) ~= nil then
                                  local l_0_96 = nil
                                  l_0_79 = l_0_79 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_90, (l_0_94) + 1, (string.find)(l_0_90, ".", l_0_94, true) - 1), 0, #(string.sub)(l_0_90, (l_0_94) + 1, (string.find)(l_0_90, ".", l_0_94, true) - 1))
                                  l_0_79 = l_0_79 .. ";" .. (string.sub)(l_0_90, l_0_96 + 1) .. ";"
                                end
                                ;
                                (table.insert)(l_0_75, (sigattr_tail[l_0_89]).utf8p1)
                                ;
                                (table.insert)(l_0_75, (sigattr_tail[l_0_89]).utf8p2)
                                -- DECOMPILER ERROR at PC496: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC496: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC496: LeaveBlock: unexpected jumping out DO_STMT

                              end
                            end
                          end
                        end
                      end
                    end
                    l_0_74.file_list = l_0_75
                    local l_0_97, l_0_98 = (bm.get_process_relationships)()
                    for l_0_102,l_0_103 in ipairs(l_0_97) do
                      if l_0_103.image_path ~= nil then
                        (bm.add_related_process)(l_0_103.ppid)
                      end
                    end
                    for l_0_107,l_0_108 in ipairs(l_0_98) do
                      if l_0_108.image_path ~= nil then
                        (bm.add_related_process)(l_0_108.ppid)
                        TrackPidAndTechniqueBM(l_0_108.ppid, "T1485", "susp_ransomware_childproc_type2")
                      end
                    end
                    ;
                    (bm.add_related_string)("ransom_files_main", l_0_79, bm.RelatedStringBMReport)
                    local l_0_109 = safeJsonSerialize(l_0_74)
                    ;
                    (bm.add_related_string)("genb_ransom_meta", l_0_109, bm.RelatedStringBMReport)
                    ;
                    (bm.trigger_sig)("GenericRansomware:Type2_multi_ext", l_0_109)
                    sms_untrusted_process()
                    ;
                    (bm.add_action)("SmsAsyncScanEvent", 100)
                    TrackPidAndTechniqueBM(l_0_77, "T1486", "susp_ransomware_type2")
                    reportTimingData()
                    reportSessionInformationInclusive()
                    if l_0_19 == false and #l_0_13 > 0 and l_0_18 ~= nil and l_0_18 ~= "" then
                      local l_0_110 = (mp.GetExtensionClass)(l_0_31)
                      if isnull(l_0_110) then
                        l_0_110 = 1000
                      end
                      local l_0_111, l_0_112 = nil, nil
                      if MpCommon.GetBehavioralNetworkBlocksSettings then
                        l_0_111 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
                      end
                      do
                        if not l_0_111 or l_0_112 == nil then
                          local l_0_113 = {}
                          l_0_113.State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                          l_0_113.MaxTimeout = 0
                          l_0_113.Exclusions = ""
                          l_0_113.AggressiveLevel = 0
                          -- DECOMPILER ERROR at PC616: Overwrote pending register: R42 in 'AssignReg'

                        end
                        local l_0_114 = {}
                        l_0_114.Extension = l_0_31
                        l_0_114.ExtensionClass = l_0_110
                        l_0_114.imagePath = l_0_76
                        l_0_114.commandLine = l_0_78
                        l_0_114.ppID = l_0_77
                        l_0_114.UserName = l_0_16
                        l_0_114.Domain = l_0_17
                        l_0_114.file_list = l_0_13
                        l_0_114.Type = "Type2.1"
                        l_0_114.RemoteEncConfig = l_0_112
                        l_0_12 = l_0_114
                        l_0_114 = safeJsonSerialize
                        l_0_114 = l_0_114(l_0_12)
                        ;
                        (bm.add_related_string)("RemoteClientData", l_0_114, bm.RelatedStringBMReport)
                        ;
                        (bm.trigger_sig)("RemoteGenericRansomware:Type2_multi_ext", l_0_114)
                        local l_0_115, l_0_116 = pcall(updateSystemDNSServers)
                        if not l_0_115 then
                          (bm.add_related_string)("updateSystemDNSServers_fail", l_0_116, bm.RelatedStringBMReport)
                        end
                        local l_0_117, l_0_118, l_0_119, l_0_120 = pcall(updateDomainInfo)
                        if l_0_117 then
                          l_0_12.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_18)
                        else
                          ;
                          (bm.add_related_string)("updateDomainInfo_fail", l_0_118, bm.RelatedStringBMReport)
                        end
                        local l_0_121 = SafeGetUrlReputation
                        local l_0_122 = {}
                        -- DECOMPILER ERROR at PC677: No list found for R51 , SetList fails

                        local l_0_123 = {}
                        l_0_123.SIG_CONTEXT = "BM"
                        l_0_123.CONTEXT_SOURCE = "GenRansom3"
                        l_0_123.TAG = "NOLOOKUP"
                        l_0_123.data = safeJsonSerialize(l_0_12)
                        l_0_121 = l_0_121(l_0_122, l_0_123, false, 3000, false)
                        if l_0_121 then
                          l_0_122 = l_0_121.error
                          if l_0_122 == 3 then
                            l_0_12.CRReportError = "Failed the first attempt"
                            l_0_122 = SafeGetUrlReputation
                            local l_0_124 = {}
                            l_0_124.SIG_CONTEXT = "BM"
                            l_0_124.CONTEXT_SOURCE = "GenRansom3"
                            l_0_124.TAG = "NOLOOKUP"
                            l_0_124.data = safeJsonSerialize(l_0_12)
                            l_0_122, l_0_123 = l_0_122(l_0_123, l_0_124, false, 3000, false), {l_0_18}
                            l_0_121 = l_0_122
                          end
                        end
                        do
                          do
                            do
                              l_0_122 = l_0_121.urls
                              l_0_122 = l_0_122[l_0_18]
                              if l_0_122 then
                                l_0_122 = l_0_121.urls
                                l_0_122 = l_0_122[l_0_18]
                                l_0_122 = l_0_122.determination
                                if l_0_122 ~= 2 then
                                  l_0_122 = l_0_121.urls
                                  l_0_122 = l_0_122[l_0_18]
                                  l_0_122 = l_0_122.determination
                                end
                                if l_0_122 == 1 then
                                  l_0_122 = l_0_121.urls
                                  l_0_122 = l_0_122[l_0_18]
                                  l_0_122 = l_0_122.confidence
                                  if l_0_122 then
                                    l_0_122 = l_0_121.urls
                                    l_0_122 = l_0_122[l_0_18]
                                    l_0_122 = l_0_122.confidence
                                    if l_0_122 >= 50 then
                                      l_0_122 = l_0_121.urls
                                      l_0_122 = l_0_122[l_0_18]
                                      l_0_122 = l_0_122.context
                                      l_0_122 = l_0_122.Source
                                      if l_0_122 == "GenRansom" then
                                        l_0_122 = l_0_121.urls
                                        l_0_122 = l_0_122[l_0_18]
                                        l_0_122 = l_0_122.confidence
                                        l_0_12.confidence = l_0_122
                                        l_0_122 = l_0_121.urls
                                        l_0_122 = l_0_122[l_0_18]
                                        l_0_122 = l_0_122.context
                                        l_0_122 = l_0_122.Family
                                        l_0_12.family = l_0_122
                                        l_0_122 = l_0_121.urls
                                        l_0_122 = l_0_122[l_0_18]
                                        l_0_122 = l_0_122.determination
                                        l_0_12.determination = l_0_122
                                        l_0_123 = l_0_121.urls
                                        l_0_123 = l_0_123[l_0_18]
                                        l_0_123 = l_0_123.context
                                        l_0_123 = l_0_123.action
                                        l_0_123 = l_0_121.urls
                                        l_0_123 = l_0_123[l_0_18]
                                        l_0_123 = l_0_123.context
                                        l_0_123 = l_0_123.action_parameter
                                        l_0_123 = l_0_121.urls
                                        l_0_123 = l_0_123[l_0_18]
                                        l_0_123 = l_0_123.context
                                        l_0_123 = l_0_123.action_ttl
                                        l_0_12.action, l_0_122 = l_0_122, {action = l_0_123, parameter = l_0_123, ttl = l_0_123}
                                        l_0_12.ip = l_0_18
                                        l_0_123 = l_0_121.urls
                                        l_0_123 = l_0_123[l_0_18]
                                        l_0_123 = l_0_123.context
                                        l_0_12.context = l_0_123
                                        l_0_12.unscrubbed_username = l_0_14
                                        l_0_12.unscrubbed_domain = l_0_15
                                        l_0_123 = bm
                                        l_0_123 = l_0_123.trigger_sig
                                        l_0_123("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_12))
                                      end
                                    end
                                  end
                                end
                              end
                              -- DECOMPILER ERROR at PC790: Overwrote pending register: R42 in 'AssignReg'

                              ;
                              (bm.add_related_string)("sigcount_type2_multi_ext", l_0_112, bm.RelatedStringBMReport)
                              do return mp.INFECTED end
                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC797: LeaveBlock: unexpected jumping out IF_STMT

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

