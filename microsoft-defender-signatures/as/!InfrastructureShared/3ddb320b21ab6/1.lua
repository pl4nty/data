-- Threat: !InfrastructureShared
-- Name: 3ddb320b21ab6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = 16385
local l_0_1 = 16386
local l_0_2 = mp.SIGATTR_LOG_SZ
local l_0_3 = {}
local l_0_4 = bm.get_sig_count()
for l_0_5 = 1, l_0_2 do
  if sigattr_tail[l_0_5].attribute == l_0_0 then
    local l_0_6 = sigattr_tail[l_0_5].utf8p1:lower()
    l_0_3[mp.crc32(0, l_0_6, 1, #l_0_6)] = l_0_5
  end
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
for l_0_20 = 1, l_0_2 do
  if sigattr_tail[l_0_20].attribute == l_0_1 then
    local l_0_21 = sigattr_tail[l_0_20].utf8p2:lower()
    local l_0_22 = sigattr_tail[l_0_20].utf8p1:lower()
    local l_0_23 = mp.crc32(0, l_0_21, 1, #l_0_21)
    local l_0_24 = mp.crc32(0, l_0_22, 1, #l_0_22)
    if (l_0_3[l_0_24] ~= nil or l_0_3[l_0_23] ~= nil) and l_0_8[l_0_23] == nil then
      local l_0_25 = l_0_21:match("%.[^%.]+$")
      if l_0_25 ~= nil and mp.bitand(mp.GetExtensionClass(l_0_25), 3) ~= 0 then
        local l_0_26, l_0_27, l_0_28 = string.match(l_0_21, "(.-)([^\\]-([^\\%.]+))$")
        l_0_28 = "." .. l_0_28
        local l_0_29, l_0_30, l_0_31 = string.match(l_0_22, "(.-)([^\\]-([^\\%.]+))$")
        l_0_31 = "." .. l_0_31
        local l_0_32 = 0
        if l_0_26 == l_0_29 and l_0_27:find(l_0_30, 1, true) ~= 1 and l_0_30:find(l_0_27, 1, true) ~= 1 then
          l_0_8[l_0_23] = 1
          if mp.GetExtensionClass(l_0_31) ~= 4 then
            if l_0_3[l_0_24] ~= nil then
              l_0_10[l_0_20] = l_0_3[l_0_24]
            elseif l_0_3[l_0_23] ~= nil then
              l_0_10[l_0_20] = l_0_3[l_0_23]
            end
            if l_0_7[l_0_31] ~= nil then
              table.insert(l_0_7[l_0_31], l_0_20)
            else
              l_0_7[l_0_31] = {l_0_20}
            end
            if l_0_9[l_0_29] ~= nil then
              table.insert(l_0_9[l_0_29], l_0_20)
            else
              l_0_9[l_0_29] = {l_0_20}
              l_0_32 = l_0_32 + 1
            end
            if 5 <= #l_0_7[l_0_31] or 20 <= l_0_32 then
              local l_0_33 = false
              local l_0_34 = {}
              l_0_34.count = 0
              for l_0_35, l_0_36 in pairs(l_0_7[l_0_31]) do
                local l_0_37 = sysio.GetFileSize(sigattr_tail[l_0_36].utf8p1)
                local l_0_38 = sysio.ReadFile(sigattr_tail[l_0_36].utf8p1, 0, 4)
                if l_0_38 ~= nil and l_0_34[l_0_38] == nil then
                  l_0_34[l_0_38] = 1
                  l_0_34.count = l_0_34.count + 1
                end
                if l_0_10[l_0_36] ~= nil and l_0_18 == false then
                  local l_0_39 = sigattr_tail[l_0_10[l_0_36]].utf8p2
                  if 136 < #l_0_39 then
                    local l_0_40 = string.find(l_0_39, "RemoteIp", 100, true)
                    if l_0_40 ~= nil and 20 < #l_0_39 - l_0_40 then
                      local l_0_41 = {}
                      for l_0_42, l_0_43 in string.gmatch(l_0_39, "(%w+):([^;]+)") do
                        l_0_41[l_0_42] = l_0_43
                      end
                      if l_0_41.UsrName ~= nil and l_0_41.Domain ~= nil and l_0_41.RemoteIp ~= nil then
                        l_0_13 = l_0_41.UsrName
                        l_0_14 = l_0_41.Domain
                        l_0_15 = scrubData(l_0_41.UsrName)
                        l_0_16 = scrubData(l_0_41.Domain)
                        local l_0_44 = string.match(l_0_41.RemoteIp, "(.*):(.*)")
                        local l_0_45 = "NA"
                        if l_0_38 ~= nil then
                          l_0_45 = string.format("0x%02X%02X%02X%02X", string.byte(l_0_38, 1, 4))
                        end
                        if l_0_44 ~= nil and (l_0_17 == "" or l_0_17 == l_0_44) then
                          table.insert(l_0_12, {
                            path = sigattr_tail[l_0_36].utf8p1,
                            magic = l_0_45,
                            fileSize = l_0_37
                          })
                          l_0_17 = l_0_44
                        else
                          l_0_18 = true
                        end
                      end
                    end
                  end
                end
              end
              if 4 < l_0_34.count then
                l_0_33 = true
              end
              bm.add_related_string("magic_mismatch", tostring(l_0_33), bm.RelatedStringBMReport)
              bm.add_related_string("ransom_extension", l_0_31, bm.RelatedStringBMReport)
              local l_0_46 = {}
              local l_0_47 = {}
              local l_0_48 = bm.get_imagepath():lower()
              local l_0_49 = bm.get_current_process_startup_info()
              local l_0_50 = ""
              if l_0_49 ~= nil then
                l_0_50 = l_0_49.command_line
                l_0_49 = l_0_49.ppid
              else
                l_0_49 = -1
              end
              l_0_46.cur_image_path = l_0_48
              l_0_46.proc_info = l_0_49
              l_0_46.modd_ext = l_0_31
              l_0_46.magic_mismatch = l_0_33
              l_0_46.is_double_ext = l_0_19
              l_0_46.dir_count = l_0_32
              local l_0_51 = "FileChain_MainSet:"
              for l_0_52, l_0_53 in pairs(l_0_7[l_0_31]) do
                local l_0_54 = sigattr_tail[l_0_53].utf8p1
                local l_0_55 = string.find(l_0_54, "\\[^\\]*$") or 0
                local l_0_56 = string.find(l_0_54, ".", l_0_55, true)
                if l_0_56 ~= nil then
                  local l_0_57 = string.sub(l_0_54, l_0_55 + 1, l_0_56 - 1)
                  l_0_51 = l_0_51 .. crypto.CRC32Buffer(-1, l_0_57, 0, #l_0_57)
                  l_0_51 = l_0_51 .. ";" .. string.sub(l_0_54, l_0_56 + 1) .. ";"
                end
                l_0_54 = sigattr_tail[l_0_53].utf8p2
                l_0_55 = string.find(l_0_54, "\\[^\\]*$") or 0
                l_0_56 = string.find(l_0_54, ".", l_0_55, true)
                if l_0_56 ~= nil then
                  local l_0_58 = string.sub(l_0_54, l_0_55 + 1, l_0_56 - 1)
                  l_0_51 = l_0_51 .. crypto.CRC32Buffer(-1, l_0_58, 0, #l_0_58)
                  l_0_51 = l_0_51 .. ";" .. string.sub(l_0_54, l_0_56 + 1) .. ";"
                end
                table.insert(l_0_47, sigattr_tail[l_0_53].utf8p1)
                table.insert(l_0_47, sigattr_tail[l_0_53].utf8p2)
              end
              l_0_46.file_list = l_0_47
              local l_0_59, l_0_60 = bm.get_process_relationships()
              for l_0_61, l_0_62 in ipairs(l_0_59) do
                if l_0_62.image_path ~= nil then
                  bm.add_related_process(l_0_62.ppid)
                end
              end
              for l_0_63, l_0_64 in ipairs(l_0_60) do
                if l_0_64.image_path ~= nil then
                  bm.add_related_process(l_0_64.ppid)
                  TrackPidAndTechniqueBM(l_0_64.ppid, "T1485", "susp_ransomware_childproc_type2")
                end
              end
              bm.add_related_string("ransom_files_main", l_0_51, bm.RelatedStringBMReport)
              local l_0_65 = safeJsonSerialize(l_0_46)
              bm.add_related_string("genb_ransom_meta", l_0_65, bm.RelatedStringBMReport)
              bm.trigger_sig("GenericRansomware:Type2.2", l_0_65)
              sms_untrusted_process()
              bm.add_action("SmsAsyncScanEvent", 100)
              TrackPidAndTechniqueBM(l_0_49, "T1486", "susp_ransomware_type2")
              reportTimingData()
              reportSessionInformationInclusive()
              if l_0_18 == false and 0 < #l_0_12 and l_0_17 ~= nil and l_0_17 ~= "" then
                local l_0_66 = mp.GetExtensionClass(l_0_31)
                if isnull(l_0_66) then
                  l_0_66 = 1000
                end
                local l_0_67, l_0_68
                if MpCommon.GetBehavioralNetworkBlocksSettings then
                  l_0_67, l_0_68 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
                end
                if not l_0_67 or l_0_68 == nil then
                  l_0_68 = {
                    State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED,
                    MaxTimeout = 0,
                    Exclusions = "",
                    AggressiveLevel = 0
                  }
                end
                l_0_11 = {
                  Extension = l_0_31,
                  ExtensionClass = l_0_66,
                  imagePath = l_0_48,
                  commandLine = l_0_50,
                  ppID = l_0_49,
                  UserName = l_0_15,
                  Domain = l_0_16,
                  file_list = l_0_12,
                  Type = "Type2.2",
                  RemoteEncConfig = l_0_68
                }
                local l_0_69 = safeJsonSerialize(l_0_11)
                bm.add_related_string("RemoteClientData", l_0_69, bm.RelatedStringBMReport)
                bm.trigger_sig("RemoteGenericRansomware:Type2.2", l_0_69)
                local l_0_70, l_0_71 = pcall(updateSystemDNSServers)
                if not l_0_70 then
                  bm.add_related_string("updateSystemDNSServers_fail", l_0_71, bm.RelatedStringBMReport)
                end
                local l_0_72, l_0_73, l_0_74, l_0_75 = pcall(updateDomainInfo)
                if l_0_72 then
                  l_0_11.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_17)
                else
                  bm.add_related_string("updateDomainInfo_fail", l_0_73, bm.RelatedStringBMReport)
                end
                local l_0_76 = SafeGetUrlReputation({l_0_17}, {
                  SIG_CONTEXT = "BM",
                  CONTEXT_SOURCE = "GenRansom3",
                  TAG = "NOLOOKUP",
                  data = safeJsonSerialize(l_0_11)
                }, false, 3000, false)
                if l_0_76 and l_0_76.error == 3 then
                  l_0_11.CRReportError = "Failed the first attempt"
                  l_0_76 = SafeGetUrlReputation({l_0_17}, {
                    SIG_CONTEXT = "BM",
                    CONTEXT_SOURCE = "GenRansom3",
                    TAG = "NOLOOKUP",
                    data = safeJsonSerialize(l_0_11)
                  }, false, 3000, false)
                end
                if l_0_76.urls[l_0_17] and (l_0_76.urls[l_0_17].determination == 2 or l_0_76.urls[l_0_17].determination == 1) and l_0_76.urls[l_0_17].confidence and l_0_76.urls[l_0_17].confidence >= 50 and l_0_76.urls[l_0_17].context.Source == "GenRansom" then
                  l_0_11.confidence = l_0_76.urls[l_0_17].confidence
                  l_0_11.family = l_0_76.urls[l_0_17].context.Family
                  l_0_11.determination = l_0_76.urls[l_0_17].determination
                  local l_0_77 = {
                    action = l_0_76.urls[l_0_17].context.action,
                    parameter = l_0_76.urls[l_0_17].context.action_parameter,
                    ttl = l_0_76.urls[l_0_17].context.action_ttl
                  }
                  l_0_11.action = l_0_77
                  l_0_11.context = l_0_76.urls[l_0_17].context
                  l_0_11.ip = l_0_17
                  l_0_11.unscrubbed_username = l_0_13
                  l_0_11.unscrubbed_domain = l_0_14
                  bm.trigger_sig("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_11))
                end
              end
              bm.add_related_string("sigcount_type2", l_0_4, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
