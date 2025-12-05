-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\95bb3b32d9b54\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0[".zzz"] = true
l_0_0[".couch"] = true
l_0_0[".___"] = true
l_0_0[".amq"] = true
l_0_0[".aaaa"] = true
l_0_0[".importing"] = true
l_0_0[".yyy"] = true
l_0_0[".____"] = true
l_0_0[".xxxx"] = true
l_0_0[".nuspec"] = true
l_0_0[".status"] = true
l_0_0[".wfcont"] = true
l_0_0[".dbf_xc2"] = true
l_0_0[".bundle"] = true
l_0_0[".zzzz"] = true
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = (bm.get_sig_count)()
for l_0_7 = 1, l_0_1 do
  if (sigattr_tail[l_0_7]).attribute == 16385 then
    l_0_2[((sigattr_tail[l_0_7]).utf8p1):lower()] = l_0_7
  end
end
local l_0_8 = {}
local l_0_9 = {}
local l_0_10 = {}
local l_0_11 = {}
local l_0_12 = {}
local l_0_13, l_0_14, l_0_15, l_0_16 = nil, nil, nil, nil
local l_0_17 = ""
local l_0_18 = false
for l_0_22 = 1, l_0_1 do
  if (sigattr_tail[l_0_22]).attribute == 16386 then
    local l_0_23 = ((sigattr_tail[l_0_22]).utf8p2):lower()
    local l_0_24 = ((sigattr_tail[l_0_22]).utf8p1):lower()
    if (l_0_2[l_0_24] ~= nil or l_0_2[l_0_23] ~= nil) and l_0_9[l_0_23] == nil then
      local l_0_25 = l_0_24:match("%.[^%.]+$")
      if l_0_25 and l_0_0[l_0_25] == nil and (mp.GetExtensionClass)(l_0_25) == 0 then
        local l_0_26 = l_0_23:match("%.[^%.]+$")
        if l_0_26 ~= nil and (mp.bitand)((mp.GetExtensionClass)(l_0_26), 3) ~= 0 then
          local l_0_27 = l_0_23:match("^(.+)\\")
          local l_0_28 = l_0_24:match("^(.+)\\")
          local l_0_29 = l_0_23:match("[^\\]+$")
          local l_0_30 = l_0_24:match("[^\\]+$")
          local l_0_31 = (l_0_30:match("(.+)%..+")):lower()
          local l_0_32 = (l_0_29:match("(.+)%..+")):lower()
          if l_0_27 == l_0_28 and l_0_24:byte(#l_0_24 + 1) ~= 58 and l_0_31:find(l_0_32, 1, true) == nil then
            l_0_9[l_0_23] = 1
            if l_0_2[l_0_24] ~= nil then
              l_0_10[l_0_22] = l_0_2[l_0_24]
            else
              if l_0_2[l_0_23] ~= nil then
                l_0_10[l_0_22] = l_0_2[l_0_23]
              end
            end
            if l_0_8[l_0_25] ~= nil then
              (table.insert)(l_0_8[l_0_25], l_0_22)
            else
              local l_0_33 = {}
              -- DECOMPILER ERROR at PC163: No list found for R29 , SetList fails

            end
            do
              if #l_0_8[l_0_25] >= 5 then
                local l_0_34 = false
                local l_0_35 = {}
                l_0_35.count = 0
                for l_0_39,l_0_40 in pairs(l_0_8[l_0_25]) do
                  local l_0_41 = (sysio.GetFileSize)((sigattr_tail[l_0_40]).utf8p1)
                  local l_0_42 = (sysio.ReadFile)((sigattr_tail[l_0_40]).utf8p1, 0, 4)
                  if l_0_42 ~= nil and l_0_35[l_0_42] == nil then
                    l_0_35[l_0_42] = 1
                    l_0_35.count = l_0_35.count + 1
                  end
                  if l_0_10[l_0_40] ~= nil and l_0_18 == false then
                    local l_0_43 = (sigattr_tail[l_0_10[l_0_40]]).utf8p2
                    if #l_0_43 > 136 then
                      local l_0_44 = (string.find)(l_0_43, "RemoteIp", 100, true)
                      if l_0_44 ~= nil and #l_0_43 - l_0_44 > 20 then
                        local l_0_45 = {}
                        for l_0_49,l_0_50 in (string.gmatch)(l_0_43, "(%w+):([^;]+)") do
                          l_0_45[l_0_49] = l_0_50
                        end
                        if l_0_45.UsrName ~= nil and l_0_45.Domain ~= nil and l_0_45.RemoteIp ~= nil then
                          l_0_13 = l_0_45.UsrName
                          l_0_14 = l_0_45.Domain
                          l_0_15 = scrubData(l_0_45.UsrName)
                          l_0_16 = scrubData(l_0_45.Domain)
                          local l_0_51 = (string.match)(l_0_45.RemoteIp, "(.*):(.*)")
                          local l_0_52 = "NA"
                          if l_0_42 ~= nil then
                            l_0_52 = (string.format)("0x%02X%02X%02X%02X", (string.byte)(l_0_42, 1, 4))
                          end
                          if l_0_51 ~= nil and (l_0_17 == "" or l_0_17 == l_0_51) then
                            local l_0_53 = table.insert
                            local l_0_54 = l_0_12
                            local l_0_55 = {}
                            l_0_55.path = (sigattr_tail[l_0_40]).utf8p1
                            l_0_55.magic = l_0_52
                            l_0_55.fileSize = l_0_41
                            l_0_53(l_0_54, l_0_55)
                            l_0_17 = l_0_51
                          else
                            do
                              do
                                l_0_18 = true
                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if l_0_35.count > 4 then
                  l_0_34 = true
                end
                ;
                (bm.add_related_string)("magic_mismatch", tostring(l_0_34), bm.RelatedStringBMReport)
                ;
                (bm.add_related_string)("ransom_extension", l_0_25, bm.RelatedStringBMReport)
                local l_0_56 = {}
                local l_0_57 = {}
                local l_0_58 = (bm.get_imagepath)()
                if isnull(l_0_58) then
                  l_0_58 = "NA"
                else
                  l_0_58 = l_0_58:lower()
                end
                local l_0_59 = (bm.get_current_process_startup_info)()
                local l_0_60 = ""
                if l_0_59 ~= nil then
                  l_0_60 = l_0_59.command_line
                  l_0_59 = l_0_59.ppid
                else
                  l_0_59 = -1
                end
                l_0_56.cur_image_path = l_0_58
                l_0_56.proc_info = l_0_59
                l_0_56.appended_ext = l_0_25
                l_0_56.magic_mismatch = l_0_34
                l_0_56.sig_count = l_0_3
                local l_0_61 = "FileChain_MainSet:"
                for l_0_65,l_0_66 in pairs(l_0_8[l_0_25]) do
                  local l_0_67 = (sigattr_tail[l_0_66]).utf8p1
                  do
                    local l_0_68, l_0_69, l_0_70 = (string.find)(l_0_67, "\\[^\\]*$") or 0
                    -- DECOMPILER ERROR at PC364: Confused about usage of register: R43 in 'UnsetPending'

                    local l_0_71 = nil
                    do
                      if (string.find)(l_0_67, ".", l_0_68, true) ~= nil then
                        local l_0_72 = nil
                        l_0_61 = l_0_61 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_67, l_0_71 + 1, (string.find)(l_0_67, ".", l_0_68, true) - 1), 0, #(string.sub)(l_0_67, l_0_71 + 1, (string.find)(l_0_67, ".", l_0_68, true) - 1))
                        l_0_61 = l_0_61 .. ";" .. (string.sub)(l_0_67, l_0_72 + 1) .. ";"
                      end
                      l_0_67 = (sigattr_tail[l_0_66]).utf8p2
                      l_0_71 = (string.find)(l_0_67, "\\[^\\]*$") or 0
                      -- DECOMPILER ERROR at PC418: Confused about usage of register: R44 in 'UnsetPending'

                      do
                        do
                          if (string.find)(l_0_67, ".", l_0_71, true) ~= nil then
                            local l_0_73 = nil
                            l_0_61 = l_0_61 .. (crypto.CRC32Buffer)(-1, (string.sub)(l_0_67, (l_0_71) + 1, (string.find)(l_0_67, ".", l_0_71, true) - 1), 0, #(string.sub)(l_0_67, (l_0_71) + 1, (string.find)(l_0_67, ".", l_0_71, true) - 1))
                            l_0_61 = l_0_61 .. ";" .. (string.sub)(l_0_67, l_0_73 + 1) .. ";"
                          end
                          ;
                          (table.insert)(l_0_57, (sigattr_tail[l_0_66]).utf8p1)
                          ;
                          (table.insert)(l_0_57, (sigattr_tail[l_0_66]).utf8p2)
                          -- DECOMPILER ERROR at PC452: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC452: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC452: LeaveBlock: unexpected jumping out DO_STMT

                        end
                      end
                    end
                  end
                end
                l_0_56.file_list = l_0_57
                local l_0_74, l_0_75 = (bm.get_process_relationships)()
                for l_0_79,l_0_80 in ipairs(l_0_74) do
                  if l_0_80.image_path ~= nil then
                    (bm.add_related_process)(l_0_80.ppid)
                  end
                end
                for l_0_84,l_0_85 in ipairs(l_0_75) do
                  if l_0_85.image_path ~= nil then
                    (bm.add_related_process)(l_0_85.ppid)
                    TrackPidAndTechniqueBM(l_0_85.ppid, "T1485", "susp_ransomware_childproc_type2")
                  end
                end
                ;
                (bm.add_related_string)("ransom_files_main", l_0_61, bm.RelatedStringBMReport)
                local l_0_86 = safeJsonSerialize(l_0_56)
                ;
                (bm.add_related_string)("genf_ransom_meta", l_0_86, bm.RelatedStringBMReport)
                ;
                (bm.trigger_sig)("GenericRansomware:Type6", l_0_86)
                sms_untrusted_process()
                ;
                (bm.add_action)("SmsAsyncScanEvent", 100)
                TrackPidAndTechniqueBM(l_0_59, "T1486", "susp_ransomware_type6")
                reportTimingData()
                reportSessionInformationInclusive()
                local l_0_87, l_0_88 = pcall(reportBmInfo)
                if not l_0_87 and l_0_88 then
                  (bm.add_related_string)("bmInfoFailReason", tostring(l_0_88), bm.RelatedStringBMReport)
                end
                if l_0_18 == false and #l_0_12 > 0 and l_0_17 ~= nil and l_0_17 ~= "" then
                  local l_0_89 = (mp.GetExtensionClass)(l_0_25)
                  if isnull(l_0_89) then
                    l_0_89 = 1000
                  end
                  local l_0_90, l_0_91 = nil, nil
                  if MpCommon.GetBehavioralNetworkBlocksSettings then
                    l_0_90 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
                  end
                  do
                    if not l_0_90 or l_0_91 == nil then
                      local l_0_92 = {}
                      l_0_92.State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED
                      l_0_92.MaxTimeout = 0
                      l_0_92.Exclusions = ""
                      l_0_92.AggressiveLevel = 0
                      -- DECOMPILER ERROR at PC586: Overwrote pending register: R44 in 'AssignReg'

                    end
                    local l_0_93 = {}
                    l_0_93.Extension = l_0_25
                    l_0_93.ExtensionClass = l_0_89
                    l_0_93.imagePath = l_0_58
                    l_0_93.commandLine = l_0_60
                    l_0_93.ppID = l_0_59
                    l_0_93.UserName = l_0_15
                    l_0_93.Domain = l_0_16
                    l_0_93.file_list = l_0_12
                    l_0_93.Type = "Type6"
                    l_0_93.RemoteEncConfig = l_0_91
                    l_0_11 = l_0_93
                    l_0_93 = safeJsonSerialize
                    l_0_93 = l_0_93(l_0_11)
                    ;
                    (bm.add_related_string)("RemoteClientData", l_0_93, bm.RelatedStringBMReport)
                    ;
                    (bm.trigger_sig)("RemoteGenericRansomware:Type6", l_0_93)
                    local l_0_94, l_0_95 = pcall(updateSystemDNSServers)
                    if not l_0_94 then
                      (bm.add_related_string)("updateSystemDNSServers_fail", l_0_95, bm.RelatedStringBMReport)
                    end
                    local l_0_96, l_0_97, l_0_98, l_0_99 = pcall(updateDomainInfo)
                    if l_0_96 then
                      l_0_11.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_17)
                    else
                      ;
                      (bm.add_related_string)("updateDomainInfo_fail", l_0_97, bm.RelatedStringBMReport)
                    end
                    local l_0_100 = SafeGetUrlReputation
                    local l_0_101 = {}
                    -- DECOMPILER ERROR at PC647: No list found for R53 , SetList fails

                    local l_0_102 = {}
                    l_0_102.SIG_CONTEXT = "BM"
                    l_0_102.CONTEXT_SOURCE = "GenRansom"
                    l_0_102.TAG = "NOLOOKUP"
                    l_0_102.data = safeJsonSerialize(l_0_11)
                    l_0_100 = l_0_100(l_0_101, l_0_102, false, 3000, false)
                    if l_0_100 then
                      l_0_101 = l_0_100.error
                      if l_0_101 == 3 then
                        l_0_11.CRReportError = "Failed the first attempt"
                        l_0_101 = SafeGetUrlReputation
                        local l_0_103 = {}
                        l_0_103.SIG_CONTEXT = "BM"
                        l_0_103.CONTEXT_SOURCE = "GenRansom3"
                        l_0_103.TAG = "NOLOOKUP"
                        l_0_103.data = safeJsonSerialize(l_0_11)
                        l_0_101, l_0_102 = l_0_101(l_0_102, l_0_103, false, 3000, false), {l_0_17}
                        l_0_100 = l_0_101
                      end
                    end
                    do
                      do
                        do
                          l_0_101 = l_0_100.urls
                          l_0_101 = l_0_101[l_0_17]
                          if l_0_101 then
                            l_0_101 = l_0_100.urls
                            l_0_101 = l_0_101[l_0_17]
                            l_0_101 = l_0_101.determination
                            if l_0_101 ~= 2 then
                              l_0_101 = l_0_100.urls
                              l_0_101 = l_0_101[l_0_17]
                              l_0_101 = l_0_101.determination
                            end
                            if l_0_101 == 1 then
                              l_0_101 = l_0_100.urls
                              l_0_101 = l_0_101[l_0_17]
                              l_0_101 = l_0_101.confidence
                              if l_0_101 then
                                l_0_101 = l_0_100.urls
                                l_0_101 = l_0_101[l_0_17]
                                l_0_101 = l_0_101.confidence
                                if l_0_101 >= 50 then
                                  l_0_101 = l_0_100.urls
                                  l_0_101 = l_0_101[l_0_17]
                                  l_0_101 = l_0_101.context
                                  l_0_101 = l_0_101.Source
                                  if l_0_101 == "GenRansom" then
                                    l_0_101 = l_0_100.urls
                                    l_0_101 = l_0_101[l_0_17]
                                    l_0_101 = l_0_101.confidence
                                    l_0_11.confidence = l_0_101
                                    l_0_101 = l_0_100.urls
                                    l_0_101 = l_0_101[l_0_17]
                                    l_0_101 = l_0_101.context
                                    l_0_101 = l_0_101.Family
                                    l_0_11.family = l_0_101
                                    l_0_101 = l_0_100.urls
                                    l_0_101 = l_0_101[l_0_17]
                                    l_0_101 = l_0_101.determination
                                    l_0_11.determination = l_0_101
                                    l_0_102 = l_0_100.urls
                                    l_0_102 = l_0_102[l_0_17]
                                    l_0_102 = l_0_102.context
                                    l_0_102 = l_0_102.action
                                    l_0_102 = l_0_100.urls
                                    l_0_102 = l_0_102[l_0_17]
                                    l_0_102 = l_0_102.context
                                    l_0_102 = l_0_102.action_parameter
                                    l_0_102 = l_0_100.urls
                                    l_0_102 = l_0_102[l_0_17]
                                    l_0_102 = l_0_102.context
                                    l_0_102 = l_0_102.action_ttl
                                    l_0_102 = l_0_100.urls
                                    l_0_102 = l_0_102[l_0_17]
                                    l_0_102 = l_0_102.context
                                    l_0_11.context = l_0_102
                                    l_0_11.action, l_0_101 = l_0_101, {action = l_0_102, parameter = l_0_102, ttl = l_0_102}
                                    l_0_11.ip = l_0_17
                                    l_0_11.unscrubbed_username = l_0_13
                                    l_0_11.unscrubbed_domain = l_0_14
                                    l_0_102 = bm
                                    l_0_102 = l_0_102.trigger_sig
                                    l_0_102("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_11))
                                  end
                                end
                              end
                            end
                          end
                          -- DECOMPILER ERROR at PC760: Overwrote pending register: R44 in 'AssignReg'

                          ;
                          (bm.add_related_string)("sigcount_type6", l_0_91, bm.RelatedStringBMReport)
                          do return mp.INFECTED end
                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_STMT

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

