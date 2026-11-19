-- Threat: !InfrastructureShared
-- Name: cc2b352916364
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = 5
for l_0_4 = 1, l_0_0 do
  local l_0_5 = sigattr_tail[l_0_4].utf8p2
  if sigattr_tail[l_0_4].attribute == 16385 and sigattr_tail[l_0_4].utf8p1 and sigattr_tail[l_0_4].utf8p1:byte(1) ~= 37 and l_0_5:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_6 = sigattr_tail[l_0_4].utf8p1:lower()
    local l_0_7 = l_0_6:match("[^\\]+$")
    if l_0_7 ~= nil then
      local l_0_8 = l_0_7:match("%.[^%.]+$")
      if l_0_8 ~= nil and l_0_2[l_0_6] == nil then
        l_0_2[l_0_6] = l_0_4
        local l_0_9 = {}
        for l_0_10, l_0_11 in string.gmatch(l_0_5, "(%w+):(%w+)") do
          l_0_9[l_0_10] = l_0_11
        end
        local l_0_12 = tonumber(l_0_9.NumWrites)
        local l_0_13 = tonumber(l_0_9.TotalSizeWrite)
        local l_0_14 = tonumber(l_0_9.TotalSizeAppend)
        if l_0_12 ~= nil and l_0_13 ~= nil and l_0_14 ~= nil and 0 < l_0_12 and 0 < l_0_13 and l_0_13 > l_0_14 and 5 < l_0_14 and l_0_14 < 2000 then
          if l_0_1[l_0_14] ~= nil then
            table.insert(l_0_1[l_0_14], l_0_4)
          else
            l_0_1[l_0_14] = {l_0_4}
          end
        end
      end
    end
  end
end
local l_0_15 = ""
local l_0_16 = false
local l_0_17 = {}
local l_0_18 = {}
local l_0_19 = ""
local l_0_20 = ""
local l_0_21 = ""
local l_0_22 = ""
local l_0_23 = 0
local l_0_24 = 0
for l_0_25, l_0_26 in pairs(l_0_1) do
  local l_0_27 = #l_0_26
  if l_0_3 <= l_0_27 then
    local l_0_28 = {}
    local l_0_29 = {}
    for l_0_30 = 1, l_0_27 do
      local l_0_31 = l_0_1[l_0_25][l_0_30]
      local l_0_32 = sigattr_tail[l_0_31].utf8p2
      local l_0_33 = {}
      local l_0_34 = {}
      for l_0_35, l_0_36 in string.gmatch(l_0_32, "(%w+):(%w+)") do
        l_0_33[l_0_35] = l_0_36
      end
      l_0_34.block_size = math_floor((tonumber(l_0_33.TotalSizeWrite) - tonumber(l_0_33.TotalSizeAppend)) / tonumber(l_0_33.NumWrites))
      l_0_34.path = sigattr_tail[l_0_31].utf8p1
      for l_0_37 = 1, l_0_0 do
        if sigattr_tail[l_0_37].attribute == 16386 and sigattr_tail[l_0_37].utf8p1:byte(1) ~= 37 and sigattr_tail[l_0_37].utf8p2 == sigattr_tail[l_0_31].utf8p1 then
          l_0_34.renamed_path = sigattr_tail[l_0_37].utf8p1
          local l_0_38 = sigattr_tail[l_0_37].utf8p1:lower()
          local l_0_39 = sigattr_tail[l_0_37].utf8p2:lower()
          local l_0_40 = l_0_38:match("(.*[/\\])"):lower()
          local l_0_41 = l_0_39:match("(.*[/\\])"):lower()
          if l_0_40 == l_0_41 and l_0_38:find(l_0_39, 1, true) == 1 and l_0_38:byte(#l_0_39 + 1) ~= 58 then
            local l_0_42 = l_0_38:match("%.[^%.]+$")
            if l_0_42 and mp.GetExtensionClass(l_0_42) ~= 4 then
              local l_0_43 = string.sub(l_0_38, #l_0_39 + 1)
              if l_0_17[l_0_43] ~= nil then
                table.insert(l_0_17[l_0_43], l_0_37)
              else
                l_0_17[l_0_43] = {l_0_37}
              end
            end
          end
        end
      end
      if l_0_23 < 5 then
        table.insert(l_0_28, l_0_34)
        l_0_23 = l_0_23 + 1
      end
      local l_0_44 = sigattr_tail[l_0_31].utf8p2
      if 136 < #l_0_44 then
        local l_0_45 = string.find(l_0_44, "RemoteIp", 100, true)
        if l_0_45 ~= nil and 20 < #l_0_44 - l_0_45 then
          local l_0_46 = {}
          for l_0_47, l_0_48 in string.gmatch(l_0_44, "(%w+):([^;]+)") do
            l_0_46[l_0_47] = l_0_48
          end
          if l_0_46.UsrName ~= nil and l_0_46.Domain ~= nil and l_0_46.RemoteIp ~= nil then
            l_0_22 = l_0_46.UsrName
            l_0_20 = l_0_46.Domain
            l_0_19 = scrubData(l_0_46.UsrName)
            l_0_21 = scrubData(l_0_46.Domain)
            local l_0_49 = string.match(l_0_46.RemoteIp, "(.*):(.*)")
            local l_0_50 = l_0_46.FSize
            if l_0_50 == nil then
              l_0_50 = sysio.GetFileSize(sigattr_tail[l_0_31].utf8p1)
            end
            local l_0_51 = "NA"
            local l_0_52 = -1
            if l_0_50 ~= nil and 256 < l_0_50 then
              local l_0_53 = sysio.ReadFile(sigattr_tail[l_0_31].utf8p1, 0, 256)
              if l_0_53 ~= nil then
                l_0_51 = string.format("0x%02X%02X%02X%02X", string.byte(l_0_53, 1, 4))
                l_0_52 = crypto.ComputeEntropy(l_0_53)
              end
            end
            if l_0_49 ~= nil and (l_0_15 == "" or l_0_15 == l_0_49) then
              if l_0_24 < 5 then
                table.insert(l_0_18, {
                  path = sigattr_tail[l_0_31].utf8p1,
                  magic = l_0_51,
                  fileSize = l_0_50,
                  entropy = l_0_52
                })
                l_0_24 = l_0_24 + 1
              end
              l_0_15 = l_0_49
            else
              l_0_16 = true
            end
          end
        end
      end
    end
    local l_0_54 = ""
    for l_0_55, l_0_56 in pairs(l_0_17) do
      local l_0_57 = false
      local l_0_58 = {}
      l_0_58.count = 0
      local l_0_59 = "FileChain_MainSet:"
      l_0_54 = l_0_55
      if 4 < #l_0_17[l_0_54] then
        for l_0_60, l_0_61 in pairs(l_0_56) do
          local l_0_62 = sysio.ReadFile(sigattr_tail[l_0_61].utf8p1, 0, 4)
          if l_0_62 ~= nil and l_0_58[l_0_62] == nil then
            l_0_58[l_0_62] = 1
            l_0_58.count = l_0_58.count + 1
          end
          local l_0_63 = sigattr_tail[l_0_61].utf8p1
          local l_0_64 = string.find(l_0_63, "\\[^\\]*$") or 0
          local l_0_65 = string.find(l_0_63, ".", l_0_64, true)
          if l_0_65 ~= nil then
            local l_0_66 = string.sub(l_0_63, l_0_64 + 1, l_0_65 - 1)
            l_0_59 = l_0_59 .. crypto.CRC32Buffer(-1, l_0_66, 0, #l_0_66)
            l_0_59 = l_0_59 .. ";" .. string.sub(l_0_63, l_0_65 + 1) .. ";"
          end
          l_0_63 = sigattr_tail[l_0_61].utf8p2
          l_0_64 = string.find(l_0_63, "\\[^\\]*$") or 0
          l_0_65 = string.find(l_0_63, ".", l_0_64, true)
          if l_0_65 ~= nil then
            local l_0_67 = string.sub(l_0_63, l_0_64 + 1, l_0_65 - 1)
            l_0_59 = l_0_59 .. crypto.CRC32Buffer(-1, l_0_67, 0, #l_0_67)
            l_0_59 = l_0_59 .. ";" .. string.sub(l_0_63, l_0_65 + 1) .. ";"
          end
        end
        if 4 < l_0_58.count then
          l_0_57 = true
        end
        bm.add_related_string("magic_mismatch", tostring(l_0_57), bm.RelatedStringBMReport)
        bm.add_related_string("ransom_files_main", l_0_59, bm.RelatedStringBMReport)
        bm.add_related_string("ransom_extension", l_0_54, bm.RelatedStringBMReport)
        break
      end
    end
    local l_0_68 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
    local l_0_69 = false
    local l_0_70 = -1
    local l_0_71 = -1
    local l_0_72 = -1
    local l_0_73 = -1
    if not isnull(l_0_68) then
      l_0_69 = MpCommon.QueryPersistContext(l_0_68, "NewPECreatedNoCert")
      l_0_73 = MpCommon.GetPersistContext(l_0_68)
      if l_0_73 ~= nil then
        for l_0_74, l_0_75 in ipairs(l_0_73) do
          local l_0_76 = tonumber(string.match(l_0_75, "^Age:([0-9]+)$"))
          if l_0_76 ~= nil and l_0_70 < l_0_76 then
            l_0_70 = l_0_76
          end
          local l_0_77 = tonumber(string.match(l_0_75, "^Prevalence:([0-9]+)$"))
          if l_0_77 ~= nil and l_0_72 < l_0_77 then
            l_0_72 = l_0_77
          end
        end
      end
      l_0_71 = sysio.GetFileLastWriteTime(l_0_68)
      if sysio.GetLastResult().Success and l_0_71 ~= 0 then
        l_0_71 = MpCommon.GetCurrentTimeT() - (l_0_71 / 10000000 - 11644473600)
      else
        l_0_71 = -1
      end
    else
      l_0_68 = ""
    end
    local l_0_78 = ""
    local l_0_79 = ""
    local l_0_80 = bm.get_current_process_startup_info()
    if l_0_80 ~= nil then
      l_0_78 = l_0_80.command_line
      l_0_79 = l_0_80.ppid
    else
      l_0_80 = -1
    end
    local l_0_81 = {
      cur_image_path = l_0_68,
      cmd_line = l_0_78,
      newpe_nocert = l_0_69,
      elapsed_time = l_0_71,
      file_age = l_0_70,
      file_prevlence = l_0_72
    }
    l_0_29.appended_ext = l_0_54
    l_0_29.append_size = l_0_25
    l_0_29.file_paths = l_0_28
    l_0_29.proc_meta_info = l_0_81
    local l_0_82 = safeJsonSerialize(l_0_29)
    bm.add_related_string("genfa_ransom_meta", l_0_82, bm.RelatedStringBMReport)
    bm.trigger_sig("GenericRansomware:FileAppend", l_0_82)
    reportTimingData()
    sms_untrusted_process()
    if l_0_16 == false and 0 < #l_0_18 and l_0_15 ~= nil and l_0_15 ~= "" then
      local l_0_83 = 1000
      if not isnull(l_0_54) then
        l_0_83 = mp.GetExtensionClass(l_0_54)
      end
      local l_0_84, l_0_85
      if MpCommon.GetBehavioralNetworkBlocksSettings then
        l_0_84, l_0_85 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
      end
      if not l_0_84 or l_0_85 == nil then
        l_0_85 = {
          State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED,
          MaxTimeout = 0,
          Exclusions = "",
          AggressiveLevel = 0
        }
      end
      local l_0_86 = {
        AppendedSize = l_0_25,
        Extension = l_0_54,
        ExtensionClass = l_0_83,
        imagePath = l_0_68,
        commandLine = l_0_78,
        ppID = l_0_79,
        UserName = l_0_19,
        Domain = l_0_21,
        file_list = l_0_18,
        Type = "Type1",
        RemoteEncConfig = l_0_85
      }
      local l_0_87 = safeJsonSerialize(l_0_86)
      bm.add_related_string("RemoteClientData", l_0_87, bm.RelatedStringBMReport)
      local l_0_88, l_0_89 = pcall(updateSystemDNSServers)
      if not l_0_88 then
        bm.add_related_string("updateSystemDNSServers_fail", l_0_89, bm.RelatedStringBMReport)
      end
      local l_0_90, l_0_91, l_0_92, l_0_93 = pcall(updateDomainInfo)
      if l_0_90 then
        l_0_86.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_15)
      else
        bm.add_related_string("updateDomainInfo_fail", l_0_91, bm.RelatedStringBMReport)
      end
      local l_0_94 = "GenRansomNote_enc"
      local l_0_95 = bm.get_current_process_startup_info()
      if l_0_95 ~= nil and l_0_95.ppid ~= nil then
        local l_0_96 = tostring(l_0_95.ppid)
        if l_0_15 and l_0_15 ~= "" then
          l_0_96 = l_0_96 .. "|" .. l_0_15
        end
        local l_0_97 = GetRollingQueueKeyValues(l_0_94, l_0_96)
        if l_0_97 ~= nil then
          l_0_86.noteItems = l_0_97
          l_0_86.typex_enc_transfer = "success"
        else
          l_0_86.typex_enc_transfer = "failure RQ nil"
        end
      else
        l_0_86.typex_enc_transfer = "failure general"
      end
      local l_0_98 = SafeGetUrlReputation({l_0_15}, {
        SIG_CONTEXT = "BM",
        CONTEXT_SOURCE = "GenRansom3",
        TAG = "NOLOOKUP",
        data = safeJsonSerialize(l_0_86)
      }, false, 3000, false)
      if l_0_98 and l_0_98.error == 3 then
        l_0_86.CRReportError = "Failed the first attempt"
        l_0_98 = SafeGetUrlReputation({l_0_15}, {
          SIG_CONTEXT = "BM",
          CONTEXT_SOURCE = "GenRansom3",
          TAG = "NOLOOKUP",
          data = safeJsonSerialize(l_0_86)
        }, false, 3000, false)
      end
      if l_0_98.urls[l_0_15] and (l_0_98.urls[l_0_15].determination == 2 or l_0_98.urls[l_0_15].determination == 1) and l_0_98.urls[l_0_15].confidence and l_0_98.urls[l_0_15].confidence >= 50 and l_0_98.urls[l_0_15].context.Source == "GenRansom" then
        l_0_86.confidence = l_0_98.urls[l_0_15].confidence
        l_0_86.family = l_0_98.urls[l_0_15].context.Family
        l_0_86.determination = l_0_98.urls[l_0_15].determination
        local l_0_99 = {
          action = l_0_98.urls[l_0_15].context.action,
          parameter = l_0_98.urls[l_0_15].context.action_parameter,
          ttl = l_0_98.urls[l_0_15].context.action_ttl
        }
        l_0_86.action = l_0_99
        l_0_86.ip = l_0_15
        l_0_86.context = l_0_98.urls[l_0_15].context
        l_0_86.unscrubbed_username = l_0_22
        l_0_86.unscrubbed_domain = l_0_20
        bm.trigger_sig("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_86))
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
