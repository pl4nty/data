-- Threat: !InfrastructureShared
-- Name: 386b3821f0595
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = {}
local l_0_9 = {}
local l_0_10, l_0_11, l_0_12, l_0_13
local l_0_14 = ""
local l_0_15 = false
local l_0_16 = 0
local l_0_17 = 0
local l_0_18 = {}
local l_0_19 = bm.get_sig_count()
for l_0_20 = 1, l_0_0 do
  local l_0_21 = sigattr_tail[l_0_20].attribute
  if l_0_21 == 16384 then
    local l_0_22 = sigattr_tail[l_0_20].utf8p1:lower()
    if versioning.IsSampled(60000, true, true, true) == true then
      local l_0_23 = mp.crc32(0, l_0_22, 1, #l_0_22)
      if l_0_1[l_0_23] ~= nil then
        table.insert(l_0_1[l_0_23], l_0_20)
      else
        l_0_1[l_0_23] = {l_0_20}
        l_0_17 = l_0_17 + 1
      end
      bm.add_related_string("zygorinthal", "unchained", bm.RelatedStringBMReport)
    else
      local l_0_24 = l_0_22:match("%.[^%.]+$")
      if l_0_24 ~= nil then
        l_0_24 = l_0_24 .. "\""
        if mp.GetExtensionClass(l_0_24) ~= 4 or isKnownRansomExtension(l_0_24) then
          local l_0_25 = mp.crc32(0, l_0_22, 1, #l_0_22)
          if l_0_1[l_0_25] ~= nil then
            table.insert(l_0_1[l_0_25], l_0_20)
          else
            l_0_1[l_0_25] = {l_0_20}
            l_0_17 = l_0_17 + 1
          end
        end
      end
    end
  end
end
if l_0_17 < 5 then
  return mp.CLEAN
end
for l_0_26 = 1, l_0_0 do
  local l_0_27 = sigattr_tail[l_0_26].attribute
  if l_0_27 == 16389 and sigattr_tail[l_0_26].utf8p2 == "ATTR_c09458eb" then
    local l_0_28 = sigattr_tail[l_0_26].utf8p1:lower()
    local l_0_29 = mp.crc32(0, l_0_28, 1, #l_0_28)
    if l_0_3[l_0_29] ~= nil then
      table.insert(l_0_3[l_0_29], l_0_26)
    else
      l_0_3[l_0_29] = {l_0_26}
    end
    if l_0_1[l_0_29] ~= nil then
      local l_0_30 = string.find(l_0_28, "\\[^\\]*$") or 0
      local l_0_31 = string.find(l_0_28, ".", l_0_30, true)
      if l_0_31 ~= nil then
        local l_0_32 = string.sub(l_0_28, l_0_30 + 1, l_0_31 - 1)
        if l_0_32 ~= nil then
          if l_0_4[l_0_32] == nil then
            l_0_4[l_0_32] = {l_0_29, l_0_26}
          else
            table.insert(l_0_4[l_0_32], l_0_26)
          end
        end
      end
    end
  end
end
l_0_17 = 0
local l_0_33 = {}
for l_0_34 = 1, l_0_0 do
  local l_0_35 = sigattr_tail[l_0_34].attribute
  if l_0_35 == 16387 then
    local l_0_36 = sigattr_tail[l_0_34].utf8p1:lower()
    local l_0_37 = mp.crc32(0, l_0_36, 1, #l_0_36)
    if l_0_1[l_0_37] == nil then
      table.insert(l_0_2, l_0_34)
    else
      l_0_3[l_0_37] = nil
    end
    if l_0_33[l_0_37] == nil then
      l_0_17 = l_0_17 + 1
      l_0_33[l_0_37] = 1
    end
  end
end
if l_0_17 < 5 then
  return mp.CLEAN
end
for l_0_38, l_0_39 in pairs(l_0_2) do
  local l_0_40 = sigattr_tail[l_0_39].utf8p1:lower()
  local l_0_41 = string.find(l_0_40, "\\[^\\]*$") or 0
  local l_0_42 = string.find(l_0_40, ".", l_0_41, true)
  if l_0_42 ~= nil then
    local l_0_43 = string.sub(l_0_40, l_0_41 + 1, -1)
    local l_0_44 = string.sub(l_0_40, l_0_41 + 1, l_0_42 - 1)
    local l_0_45
    if l_0_43 ~= nil then
      l_0_45 = l_0_43:match("%.[^%.]+$")
    end
    if l_0_44 ~= nil and l_0_45 ~= nil and mp.bitand(mp.GetExtensionClass(l_0_45), 3) ~= 0 and l_0_4[l_0_44] ~= nil then
      local l_0_46 = l_0_4[l_0_44][1]
      if l_0_3[l_0_46] ~= nil then
        local l_0_47 = sigattr_tail[l_0_3[l_0_46][1]].utf8p1:lower()
        if l_0_1[l_0_46] ~= nil and l_0_1[l_0_46][1] then
          l_0_7[l_0_39] = l_0_1[l_0_46][1]
        end
        if #l_0_47 > #l_0_40 and l_0_47:find(l_0_40, 1, true) == 1 and l_0_47:byte(#l_0_40 + 1) ~= 58 then
          local l_0_48 = string.sub(l_0_47, #l_0_40 + 1)
          if l_0_5[l_0_48] ~= nil then
            if l_0_6[l_0_46] == nil then
              l_0_6[l_0_46] = 1
              table.insert(l_0_5[l_0_48], l_0_3[l_0_46][1])
              table.insert(l_0_5[l_0_48], l_0_39)
              if 10 <= #l_0_5[l_0_48] then
                local l_0_49 = false
                local l_0_50 = {}
                l_0_50.count = 0
                for l_0_51, l_0_52 in pairs(l_0_5[l_0_48]) do
                  local l_0_53 = sysio.ReadFile(sigattr_tail[l_0_52].utf8p1, 0, 4)
                  if l_0_53 ~= nil and l_0_50[l_0_53] == nil then
                    l_0_50[l_0_53] = 1
                    l_0_50.count = l_0_50.count + 1
                  end
                  if l_0_7[l_0_52] ~= nil and l_0_15 == false then
                    local l_0_54 = sigattr_tail[l_0_7[l_0_52]].utf8p2
                    if not l_0_54:find("RemoteIp:;", 1, true) then
                      local l_0_55 = string.find(l_0_54, "RemoteIp", 17, true)
                      if l_0_55 ~= nil and 20 < #l_0_54 - l_0_55 then
                        local l_0_56 = {}
                        for l_0_57, l_0_58 in string.gmatch(l_0_54, "(%w+):([^;]+)") do
                          l_0_56[l_0_57] = l_0_58
                        end
                        if l_0_56.UsrName ~= nil and l_0_56.Domain ~= nil and l_0_56.RemoteIp ~= nil then
                          l_0_10 = l_0_56.UsrName
                          l_0_11 = l_0_56.Domain
                          l_0_12 = scrubData(l_0_56.UsrName)
                          l_0_13 = scrubData(l_0_56.Domain)
                          l_0_16 = l_0_56.FSize
                          local l_0_59 = string.match(l_0_56.RemoteIp, "(.*):(.*)")
                          local l_0_60 = "NA"
                          if l_0_53 ~= nil then
                            l_0_60 = string.format("0x%02X%02X%02X%02X", string.byte(l_0_53, 1, 4))
                          end
                          if l_0_59 ~= nil and (l_0_14 == "" or l_0_14 == l_0_59) then
                            table.insert(l_0_9, {
                              path = sigattr_tail[l_0_52].utf8p1,
                              magic = l_0_60,
                              fileSize = l_0_16
                            })
                            l_0_14 = l_0_59
                          else
                            l_0_15 = true
                          end
                        end
                      end
                    end
                  end
                end
                if 4 < l_0_50.count then
                  l_0_49 = true
                end
                bm.add_related_string("magic_mismatch", tostring(l_0_49), bm.RelatedStringBMReport)
                bm.add_related_string("ransom_extension", l_0_48, bm.RelatedStringBMReport)
                local l_0_61 = {}
                local l_0_62 = {}
                local l_0_63 = {}
                local l_0_64 = bm.get_imagepath()
                if isnull(l_0_64) then
                  l_0_64 = "NA"
                else
                  l_0_64 = l_0_64:lower()
                end
                local l_0_65 = bm.get_current_process_startup_info()
                local l_0_66 = ""
                if l_0_65 ~= nil then
                  l_0_66 = l_0_65.command_line
                  l_0_65 = l_0_65.ppid
                else
                  l_0_65 = -1
                end
                l_0_61.cur_image_path = l_0_64
                l_0_61.proc_info = l_0_65
                l_0_61.appended_ext = l_0_48
                l_0_61.magic_mismatch = l_0_49
                l_0_61.sig_count = l_0_19
                l_0_61.debug_data = l_0_18
                local l_0_67 = "FileChain_MainSet:"
                for l_0_68, l_0_69 in pairs(l_0_5[l_0_48]) do
                  local l_0_70 = sigattr_tail[l_0_69].utf8p1
                  local l_0_71 = string.find(l_0_70, "\\[^\\]*$") or 0
                  local l_0_72 = string.find(l_0_70, ".", l_0_71, true)
                  if l_0_72 ~= nil then
                    local l_0_73 = string.sub(l_0_70, l_0_71 + 1, l_0_72 - 1)
                    l_0_67 = l_0_67 .. crypto.CRC32Buffer(-1, l_0_73, 0, #l_0_73)
                    l_0_67 = l_0_67 .. ";" .. string.sub(l_0_70, l_0_72 + 1) .. ";"
                  end
                  table.insert(l_0_62, sigattr_tail[l_0_69].utf8p1)
                  local l_0_74
                  if l_0_7[l_0_69] ~= nil then
                    if sigattr_tail[l_0_7[l_0_69]] ~= nil then
                      local l_0_75 = sigattr_tail[l_0_7[l_0_69]].utf8p1:lower()
                      local l_0_76 = sigattr_tail[l_0_7[l_0_69]].utf8p2:lower()
                      l_0_74 = string.match(l_0_76, "fsize:(%d+)")
                      if l_0_74 == nil then
                        l_0_74 = -1
                      end
                      table.insert(l_0_63, l_0_75)
                      table.insert(l_0_63, l_0_74)
                    end
                    if sigattr_tail[l_0_69] ~= nil then
                      local l_0_77 = sigattr_tail[l_0_69].utf8p1:lower()
                      local l_0_78 = sigattr_tail[l_0_69].utf8p2:lower()
                      l_0_74 = string.match(l_0_78, "fsize:(%d+)")
                      if l_0_74 == nil then
                        l_0_74 = -1
                      end
                      table.insert(l_0_63, l_0_77)
                      table.insert(l_0_63, l_0_74)
                    end
                  end
                end
                l_0_61.file_list = l_0_62
                l_0_61.file_size = l_0_63
                local l_0_79, l_0_80 = bm.get_process_relationships()
                for l_0_81, l_0_82 in ipairs(l_0_79) do
                  if l_0_82.image_path ~= nil then
                    bm.add_related_process(l_0_82.ppid)
                  end
                end
                for l_0_83, l_0_84 in ipairs(l_0_80) do
                  if l_0_84.image_path ~= nil then
                    bm.add_related_process(l_0_84.ppid)
                    TrackPidAndTechniqueBM(l_0_84.ppid, "T1485", "susp_ransomware_childproc_type4")
                  end
                end
                bm.add_related_string("ransom_files_main", l_0_67, bm.RelatedStringBMReport)
                local l_0_85 = safeJsonSerialize(l_0_61)
                bm.add_related_string("gend_ransom_meta", l_0_85, bm.RelatedStringBMReport)
                bm.trigger_sig("GenericRansomware:Type4", l_0_85)
                bm.trigger_sig_delayed("DelayedRansom:Type4", l_0_85, 10000)
                sms_untrusted_process()
                bm.add_action("SmsAsyncScanEvent", 100)
                TrackPidAndTechniqueBM(l_0_65, "T1486", "susp_ransomware_type4")
                reportTimingData()
                bm.add_related_string("sigcount_type4", l_0_19, bm.RelatedStringBMReport)
                reportSessionInformationInclusive()
                local l_0_86, l_0_87 = pcall(reportBmInfo)
                if not l_0_86 and l_0_87 then
                  bm.add_related_string("bmInfoFailReason", tostring(l_0_87), bm.RelatedStringBMReport)
                end
                if l_0_15 == false and 0 < #l_0_9 and l_0_14 ~= nil and l_0_14 ~= "" then
                  local l_0_88 = mp.GetExtensionClass(l_0_48)
                  if isnull(l_0_88) then
                    l_0_88 = 1000
                  end
                  local l_0_89, l_0_90
                  if MpCommon.GetBehavioralNetworkBlocksSettings then
                    l_0_89, l_0_90 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
                  end
                  if not l_0_89 or l_0_90 == nil then
                    l_0_90 = {
                      State = 0,
                      MaxTimeout = 0,
                      Exclusions = "",
                      AggressiveLevel = 0,
                      Plugins = 0
                    }
                  end
                  l_0_8 = {
                    Extension = l_0_48,
                    ExtensionClass = l_0_88,
                    imagePath = l_0_64,
                    commandLine = l_0_66,
                    ppID = l_0_65,
                    UserName = l_0_12,
                    Domain = l_0_13,
                    file_list = l_0_9,
                    Type = "Type4",
                    RemoteEncConfig = l_0_90
                  }
                  local l_0_91 = safeJsonSerialize(l_0_8)
                  bm.add_related_string("RemoteClientData", l_0_91, bm.RelatedStringBMReport)
                  bm.trigger_sig("RemoteGenericRansomware:Type4", l_0_91)
                  local l_0_92, l_0_93 = pcall(updateSystemDNSServers)
                  if not l_0_92 then
                    bm.add_related_string("updateSystemDNSServers_fail", l_0_93, bm.RelatedStringBMReport)
                  end
                  local l_0_94, l_0_95, l_0_96, l_0_97 = pcall(updateDomainInfo)
                  if l_0_94 then
                    l_0_8.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_14)
                  else
                    bm.add_related_string("updateDomainInfo_fail", l_0_95, bm.RelatedStringBMReport)
                  end
                  local l_0_98, l_0_99 = pcall(getBmInfo)
                  if l_0_98 and l_0_99 then
                    l_0_8.BmInfo = l_0_99
                  end
                  local l_0_100 = SafeGetUrlReputation({l_0_14}, {
                    SIG_CONTEXT = "BM",
                    CONTEXT_SOURCE = "GenRansom3",
                    TAG = "NOLOOKUP",
                    data = safeJsonSerialize(l_0_8)
                  }, false, 3000, false)
                  if l_0_100 and l_0_100.error == 3 then
                    l_0_8.CRReportError = "Failed the first attempt"
                    l_0_100 = SafeGetUrlReputation({l_0_14}, {
                      SIG_CONTEXT = "BM",
                      CONTEXT_SOURCE = "GenRansom3",
                      TAG = "NOLOOKUP",
                      data = safeJsonSerialize(l_0_8)
                    }, false, 3000, false)
                  end
                  if l_0_100.urls[l_0_14] and (l_0_100.urls[l_0_14].determination == 2 or l_0_100.urls[l_0_14].determination == 1) and l_0_100.urls[l_0_14].confidence and l_0_100.urls[l_0_14].confidence >= 50 and l_0_100.urls[l_0_14].context.Source == "GenRansom" then
                    l_0_8.confidence = l_0_100.urls[l_0_14].confidence
                    l_0_8.family = l_0_100.urls[l_0_14].context.Family
                    l_0_8.determination = l_0_100.urls[l_0_14].determination
                    local l_0_101 = {
                      action = l_0_100.urls[l_0_14].context.action,
                      parameter = l_0_100.urls[l_0_14].context.action_parameter,
                      ttl = l_0_100.urls[l_0_14].context.action_ttl
                    }
                    l_0_8.action = l_0_101
                    l_0_8.ip = l_0_14
                    l_0_8.context = l_0_100.urls[l_0_14].context
                    l_0_8.unscrubbed_username = l_0_10
                    l_0_8.unscrubbed_domain = l_0_11
                    bm.trigger_sig("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_8))
                  end
                end
                return mp.INFECTED
              end
            end
          else
            l_0_5[l_0_48] = {
              l_0_3[l_0_46][1],
              l_0_39
            }
            l_0_6[l_0_46] = 1
          end
        end
      end
    end
  end
end
return mp.CLEAN
