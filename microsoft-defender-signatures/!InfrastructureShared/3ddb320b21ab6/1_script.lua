-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3ddb320b21ab6\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = 16385
local l_0_1 = 16386
local l_0_2 = mp.SIGATTR_LOG_SZ
local l_0_3 = {}
local l_0_4 = (bm.get_sig_count)()
for l_0_8 = 1, l_0_2 do
  if (sigattr_tail[l_0_8]).attribute == l_0_0 then
    local l_0_9 = ((sigattr_tail[l_0_8]).utf8p1):lower()
    l_0_3[(mp.crc32)(0, l_0_9, 1, #l_0_9)] = l_0_8
  end
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
for l_0_26 = 1, l_0_2 do
  if (sigattr_tail[l_0_26]).attribute == l_0_1 then
    local l_0_27 = ((sigattr_tail[l_0_26]).utf8p2):lower()
    local l_0_28 = ((sigattr_tail[l_0_26]).utf8p1):lower()
    local l_0_29 = (mp.crc32)(0, l_0_27, 1, #l_0_27)
    local l_0_30 = (mp.crc32)(0, l_0_28, 1, #l_0_28)
    if (l_0_3[l_0_30] ~= nil or l_0_3[l_0_29] ~= nil) and l_0_11[l_0_29] == nil then
      local l_0_31 = l_0_27:match("%.[^%.]+$")
      if l_0_31 ~= nil and (mp.bitand)((mp.GetExtensionClass)(l_0_31), 3) ~= 0 then
        local l_0_32, l_0_33, l_0_34 = (string.match)(l_0_27, "(.-)([^\\]-([^\\%.]+))$")
        l_0_34 = "." .. l_0_34
        local l_0_35, l_0_36, l_0_37 = (string.match)(l_0_28, "(.-)([^\\]-([^\\%.]+))$")
        l_0_37 = "." .. l_0_37
        local l_0_38 = 0
        if l_0_32 == l_0_35 and l_0_33:find(l_0_36, 1, true) ~= 1 and l_0_36:find(l_0_33, 1, true) ~= 1 then
          l_0_11[l_0_29] = 1
          if (mp.GetExtensionClass)(l_0_37) ~= 4 then
            if l_0_3[l_0_30] ~= nil then
              l_0_13[l_0_26] = l_0_3[l_0_30]
            else
              if l_0_3[l_0_29] ~= nil then
                l_0_13[l_0_26] = l_0_3[l_0_29]
              end
            end
            if l_0_10[l_0_37] ~= nil then
              (table.insert)(l_0_10[l_0_37], l_0_26)
            else
              local l_0_39 = {}
              -- DECOMPILER ERROR at PC160: No list found for R34 , SetList fails

            end
            do
              -- DECOMPILER ERROR at PC167: Overwrote pending register: R35 in 'AssignReg'

              if l_0_12[l_0_35] ~= nil then
                (table.insert)(l_0_26, l_0_26)
              else
                local l_0_40 = {}
                -- DECOMPILER ERROR at PC173: No list found for R34 , SetList fails

              end
              do
                if #l_0_10[l_0_37] >= 5 or l_0_38 >= 20 then
                  local l_0_41 = false
                  local l_0_42 = {}
                  l_0_42.count = 0
                  for l_0_46,l_0_47 in pairs(l_0_10[l_0_37]) do
                    local l_0_48 = (sysio.GetFileSize)((sigattr_tail[l_0_47]).utf8p1)
                    local l_0_49 = (sysio.ReadFile)((sigattr_tail[l_0_47]).utf8p1, 0, 4)
                    if l_0_49 ~= nil and l_0_42[l_0_49] == nil then
                      l_0_42[l_0_49] = 1
                      l_0_42.count = l_0_42.count + 1
                    end
                    if l_0_13[l_0_47] ~= nil and l_0_21 == false then
                      local l_0_50 = (sigattr_tail[l_0_13[l_0_47]]).utf8p2
                      if #l_0_50 > 136 then
                        local l_0_51 = (string.find)(l_0_50, "RemoteIp", 100, true)
                        if l_0_51 ~= nil and #l_0_50 - l_0_51 > 20 then
                          local l_0_52 = {}
                          for l_0_56,l_0_57 in (string.gmatch)(l_0_50, "(%w+):([^;]+)") do
                            l_0_52[l_0_56] = l_0_57
                          end
                          if l_0_52.UsrName ~= nil and l_0_52.Domain ~= nil and l_0_52.RemoteIp ~= nil then
                            l_0_16 = l_0_52.UsrName
                            l_0_17 = l_0_52.Domain
                            l_0_18 = scrubData(l_0_52.UsrName)
                            l_0_19 = scrubData(l_0_52.Domain)
                            local l_0_58 = (string.match)(l_0_52.RemoteIp, "(.*):(.*)")
                            local l_0_59 = "NA"
                            if l_0_49 ~= nil then
                              l_0_59 = (string.format)("0x%02X%02X%02X%02X", (string.byte)(l_0_49, 1, 4))
                            end
                            if l_0_58 ~= nil and (l_0_20 == "" or l_0_20 == l_0_58) then
                              local l_0_60 = table.insert
                              local l_0_61 = l_0_15
                              local l_0_62 = {}
                              l_0_62.path = (sigattr_tail[l_0_47]).utf8p1
                              l_0_62.magic = l_0_59
                              l_0_62.fileSize = l_0_48
                              l_0_60(l_0_61, l_0_62)
                              l_0_20 = l_0_58
                            else
                              do
                                do
                                  l_0_21 = true
                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC305: LeaveBlock: unexpected jumping out IF_STMT

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
                  (bm.add_related_string)("ransom_extension", l_0_37, bm.RelatedStringBMReport)
                  local l_0_63 = {}
                  local l_0_64 = {}
                  local l_0_65 = ((bm.get_imagepath)()):lower()
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
                  l_0_63.modd_ext = l_0_37
                  l_0_63.magic_mismatch = l_0_41
                  l_0_63.is_double_ext = l_0_22
                  l_0_63.dir_count = l_0_38
                  local l_0_68 = "FileChain_MainSet:"
                  for l_0_72,l_0_73 in pairs(l_0_10[l_0_37]) do
                    local l_0_74 = (sigattr_tail[l_0_73]).utf8p1
                    do
                      local l_0_75, l_0_76, l_0_77 = (string.find)(l_0_74, "\\[^\\]*$") or 0
                      -- DECOMPILER ERROR at PC370: Confused about usage of register: R48 in 'UnsetPending'

                      local l_0_78 = nil
                      do
                        if (string.find)(l_0_74, ".", l_0_75, true) ~= nil then
                          local l_0_79 = nil
                          l_0_68 = l_0_68 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_74, l_0_78 + 1, (string.find)(l_0_74, ".", l_0_75, true) - 1), 0, #(string.sub)(l_0_74, l_0_78 + 1, (string.find)(l_0_74, ".", l_0_75, true) - 1))
                          l_0_68 = l_0_68 .. ";" .. (string.sub)(l_0_74, l_0_79 + 1) .. ";"
                        end
                        l_0_74 = (sigattr_tail[l_0_73]).utf8p2
                        l_0_78 = (string.find)(l_0_74, "\\[^\\]*$") or 0
                        -- DECOMPILER ERROR at PC424: Confused about usage of register: R49 in 'UnsetPending'

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
                            -- DECOMPILER ERROR at PC458: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC458: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC458: LeaveBlock: unexpected jumping out DO_STMT

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
                  (bm.trigger_sig)("GenericRansomware:Type2.2", l_0_93)
                  sms_untrusted_process()
                  ;
                  (bm.add_action)("SmsAsyncScanEvent", 100)
                  TrackPidAndTechniqueBM(l_0_66, "T1486", "susp_ransomware_type2")
                  reportTimingData()
                  reportSessionInformationInclusive()
                  if l_0_21 == false and #l_0_15 > 0 and l_0_20 ~= nil and l_0_20 ~= "" then
                    local l_0_94 = (mp.GetExtensionClass)(l_0_37)
                    if isnull(l_0_94) then
                      l_0_94 = 1000
                    end
                    local l_0_95, l_0_96 = nil, nil
                    if MpCommon.GetBehavioralNetworkBlocksSettings then
                      l_0_95 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
                    end
                    do
                      if not l_0_95 or l_0_96 == nil then
                        local l_0_97 = {}
                        l_0_97.State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                        l_0_97.MaxTimeout = 0
                        l_0_97.Exclusions = ""
                        l_0_97.AggressiveLevel = 0
                        -- DECOMPILER ERROR at PC576: Overwrote pending register: R47 in 'AssignReg'

                      end
                      local l_0_98 = {}
                      l_0_98.Extension = l_0_37
                      l_0_98.ExtensionClass = l_0_94
                      l_0_98.imagePath = l_0_65
                      l_0_98.commandLine = l_0_67
                      l_0_98.ppID = l_0_66
                      l_0_98.UserName = l_0_18
                      l_0_98.Domain = l_0_19
                      l_0_98.file_list = l_0_15
                      l_0_98.Type = "Type2.2"
                      l_0_98.RemoteEncConfig = l_0_96
                      l_0_14 = l_0_98
                      l_0_98 = safeJsonSerialize
                      l_0_98 = l_0_98(l_0_14)
                      ;
                      (bm.add_related_string)("RemoteClientData", l_0_98, bm.RelatedStringBMReport)
                      ;
                      (bm.trigger_sig)("RemoteGenericRansomware:Type2.2", l_0_98)
                      local l_0_99, l_0_100 = pcall(updateSystemDNSServers)
                      if not l_0_99 then
                        (bm.add_related_string)("updateSystemDNSServers_fail", l_0_100, bm.RelatedStringBMReport)
                      end
                      local l_0_101, l_0_102, l_0_103, l_0_104 = pcall(updateDomainInfo)
                      if l_0_101 then
                        l_0_14.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_20)
                      else
                        ;
                        (bm.add_related_string)("updateDomainInfo_fail", l_0_102, bm.RelatedStringBMReport)
                      end
                      local l_0_105 = SafeGetUrlReputation
                      local l_0_106 = {}
                      -- DECOMPILER ERROR at PC637: No list found for R56 , SetList fails

                      local l_0_107 = {}
                      l_0_107.SIG_CONTEXT = "BM"
                      l_0_107.CONTEXT_SOURCE = "GenRansom3"
                      l_0_107.TAG = "NOLOOKUP"
                      l_0_107.data = safeJsonSerialize(l_0_14)
                      l_0_105 = l_0_105(l_0_106, l_0_107, false, 3000, false)
                      if l_0_105 then
                        l_0_106 = l_0_105.error
                        if l_0_106 == 3 then
                          l_0_14.CRReportError = "Failed the first attempt"
                          l_0_106 = SafeGetUrlReputation
                          local l_0_108 = {}
                          l_0_108.SIG_CONTEXT = "BM"
                          l_0_108.CONTEXT_SOURCE = "GenRansom3"
                          l_0_108.TAG = "NOLOOKUP"
                          l_0_108.data = safeJsonSerialize(l_0_14)
                          l_0_106, l_0_107 = l_0_106(l_0_107, l_0_108, false, 3000, false), {l_0_20}
                          l_0_105 = l_0_106
                        end
                      end
                      do
                        do
                          do
                            l_0_106 = l_0_105.urls
                            l_0_106 = l_0_106[l_0_20]
                            if l_0_106 then
                              l_0_106 = l_0_105.urls
                              l_0_106 = l_0_106[l_0_20]
                              l_0_106 = l_0_106.determination
                              if l_0_106 ~= 2 then
                                l_0_106 = l_0_105.urls
                                l_0_106 = l_0_106[l_0_20]
                                l_0_106 = l_0_106.determination
                              end
                              if l_0_106 == 1 then
                                l_0_106 = l_0_105.urls
                                l_0_106 = l_0_106[l_0_20]
                                l_0_106 = l_0_106.confidence
                                if l_0_106 then
                                  l_0_106 = l_0_105.urls
                                  l_0_106 = l_0_106[l_0_20]
                                  l_0_106 = l_0_106.confidence
                                  if l_0_106 >= 50 then
                                    l_0_106 = l_0_105.urls
                                    l_0_106 = l_0_106[l_0_20]
                                    l_0_106 = l_0_106.context
                                    l_0_106 = l_0_106.Source
                                    if l_0_106 == "GenRansom" then
                                      l_0_106 = l_0_105.urls
                                      l_0_106 = l_0_106[l_0_20]
                                      l_0_106 = l_0_106.confidence
                                      l_0_14.confidence = l_0_106
                                      l_0_106 = l_0_105.urls
                                      l_0_106 = l_0_106[l_0_20]
                                      l_0_106 = l_0_106.context
                                      l_0_106 = l_0_106.Family
                                      l_0_14.family = l_0_106
                                      l_0_106 = l_0_105.urls
                                      l_0_106 = l_0_106[l_0_20]
                                      l_0_106 = l_0_106.determination
                                      l_0_14.determination = l_0_106
                                      l_0_107 = l_0_105.urls
                                      l_0_107 = l_0_107[l_0_20]
                                      l_0_107 = l_0_107.context
                                      l_0_107 = l_0_107.action
                                      l_0_107 = l_0_105.urls
                                      l_0_107 = l_0_107[l_0_20]
                                      l_0_107 = l_0_107.context
                                      l_0_107 = l_0_107.action_parameter
                                      l_0_107 = l_0_105.urls
                                      l_0_107 = l_0_107[l_0_20]
                                      l_0_107 = l_0_107.context
                                      l_0_107 = l_0_107.action_ttl
                                      l_0_14.action, l_0_106 = l_0_106, {action = l_0_107, parameter = l_0_107, ttl = l_0_107}
                                      l_0_107 = l_0_105.urls
                                      l_0_107 = l_0_107[l_0_20]
                                      l_0_107 = l_0_107.context
                                      l_0_14.context = l_0_107
                                      l_0_14.ip = l_0_20
                                      l_0_14.unscrubbed_username = l_0_16
                                      l_0_14.unscrubbed_domain = l_0_17
                                      l_0_107 = bm
                                      l_0_107 = l_0_107.trigger_sig
                                      l_0_107("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_14))
                                    end
                                  end
                                end
                              end
                            end
                            -- DECOMPILER ERROR at PC750: Overwrote pending register: R47 in 'AssignReg'

                            ;
                            (bm.add_related_string)("sigcount_type2", l_0_96, bm.RelatedStringBMReport)
                            do return mp.INFECTED end
                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC757: LeaveBlock: unexpected jumping out IF_STMT

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

