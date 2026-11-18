-- Threat: !InfrastructureShared
-- Name: 95bb3b32d9b54
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = {
  [".zzz"] = true,
  [".couch"] = true,
  [".___"] = true,
  [".amq"] = true,
  [".aaaa"] = true,
  [".importing"] = true,
  [".yyy"] = true,
  [".____"] = true,
  [".xxxx"] = true,
  [".nuspec"] = true,
  [".status"] = true,
  [".wfcont"] = true,
  [".dbf_xc2"] = true,
  [".bundle"] = true,
  [".zzzz"] = true
}
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = bm.get_sig_count()
for l_0_4 = 1, l_0_1 do
  if sigattr_tail[l_0_4].attribute == 16385 then
    l_0_2[sigattr_tail[l_0_4].utf8p1:lower()] = l_0_4
  end
end
local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = {}
local l_0_9 = {}
local l_0_10, l_0_11, l_0_12, l_0_13
local l_0_14 = ""
local l_0_15 = false
for l_0_16 = 1, l_0_1 do
  if sigattr_tail[l_0_16].attribute == 16386 then
    local l_0_17 = sigattr_tail[l_0_16].utf8p2:lower()
    local l_0_18 = sigattr_tail[l_0_16].utf8p1:lower()
    if (l_0_2[l_0_18] ~= nil or l_0_2[l_0_17] ~= nil) and l_0_6[l_0_17] == nil then
      local l_0_19 = l_0_18:match("%.[^%.]+$")
      if l_0_19 and l_0_0[l_0_19] == nil and mp.GetExtensionClass(l_0_19) == 0 then
        local l_0_20 = l_0_17:match("%.[^%.]+$")
        if l_0_20 ~= nil and mp.bitand(mp.GetExtensionClass(l_0_20), 3) ~= 0 then
          local l_0_21 = l_0_17:match("^(.+)\\")
          local l_0_22 = l_0_18:match("^(.+)\\")
          local l_0_23 = l_0_17:match("[^\\]+$")
          local l_0_24 = l_0_18:match("[^\\]+$")
          local l_0_25 = l_0_24:match("(.+)%..+"):lower()
          local l_0_26 = l_0_23:match("(.+)%..+"):lower()
          if l_0_21 == l_0_22 and l_0_18:byte(#l_0_18 + 1) ~= 58 and l_0_25:find(l_0_26, 1, true) == nil then
            l_0_6[l_0_17] = 1
            if l_0_2[l_0_18] ~= nil then
              l_0_7[l_0_16] = l_0_2[l_0_18]
            elseif l_0_2[l_0_17] ~= nil then
              l_0_7[l_0_16] = l_0_2[l_0_17]
            end
            if l_0_5[l_0_19] ~= nil then
              table.insert(l_0_5[l_0_19], l_0_16)
            else
              l_0_5[l_0_19] = {l_0_16}
            end
            if 5 <= #l_0_5[l_0_19] then
              local l_0_27 = false
              local l_0_28 = {}
              l_0_28.count = 0
              for l_0_29, l_0_30 in pairs(l_0_5[l_0_19]) do
                local l_0_31 = sysio.GetFileSize(sigattr_tail[l_0_30].utf8p1)
                local l_0_32 = sysio.ReadFile(sigattr_tail[l_0_30].utf8p1, 0, 4)
                if l_0_32 ~= nil and l_0_28[l_0_32] == nil then
                  l_0_28[l_0_32] = 1
                  l_0_28.count = l_0_28.count + 1
                end
                if l_0_7[l_0_30] ~= nil and l_0_15 == false then
                  local l_0_33 = sigattr_tail[l_0_7[l_0_30]].utf8p2
                  if 136 < #l_0_33 then
                    local l_0_34 = string.find(l_0_33, "RemoteIp", 100, true)
                    if l_0_34 ~= nil and 20 < #l_0_33 - l_0_34 then
                      local l_0_35 = {}
                      for l_0_36, l_0_37 in string.gmatch(l_0_33, "(%w+):([^;]+)") do
                        l_0_35[l_0_36] = l_0_37
                      end
                      if l_0_35.UsrName ~= nil and l_0_35.Domain ~= nil and l_0_35.RemoteIp ~= nil then
                        l_0_10 = l_0_35.UsrName
                        l_0_11 = l_0_35.Domain
                        l_0_12 = scrubData(l_0_35.UsrName)
                        l_0_13 = scrubData(l_0_35.Domain)
                        local l_0_38 = string.match(l_0_35.RemoteIp, "(.*):(.*)")
                        local l_0_39 = "NA"
                        if l_0_32 ~= nil then
                          l_0_39 = string.format("0x%02X%02X%02X%02X", string.byte(l_0_32, 1, 4))
                        end
                        if l_0_38 ~= nil and (l_0_14 == "" or l_0_14 == l_0_38) then
                          table.insert(l_0_9, {
                            path = sigattr_tail[l_0_30].utf8p1,
                            magic = l_0_39,
                            fileSize = l_0_31
                          })
                          l_0_14 = l_0_38
                        else
                          l_0_15 = true
                        end
                      end
                    end
                  end
                end
              end
              if l_0_28.count > 4 then
                l_0_27 = true
              end
              bm.add_related_string("magic_mismatch", tostring(l_0_27), bm.RelatedStringBMReport)
              bm.add_related_string("ransom_extension", l_0_19, bm.RelatedStringBMReport)
              local l_0_40 = {}
              local l_0_41 = {}
              local l_0_42 = bm.get_imagepath()
              if isnull(l_0_42) then
                l_0_42 = "NA"
              else
                l_0_42 = l_0_42:lower()
              end
              local l_0_43 = bm.get_current_process_startup_info()
              local l_0_44 = ""
              if l_0_43 ~= nil then
                l_0_44 = l_0_43.command_line
                l_0_43 = l_0_43.ppid
              else
                l_0_43 = -1
              end
              l_0_40.cur_image_path = l_0_42
              l_0_40.proc_info = l_0_43
              l_0_40.appended_ext = l_0_19
              l_0_40.magic_mismatch = l_0_27
              l_0_40.sig_count = l_0_3
              local l_0_45 = "FileChain_MainSet:"
              for l_0_46, l_0_47 in pairs(l_0_5[l_0_19]) do
                local l_0_48 = sigattr_tail[l_0_47].utf8p1
                local l_0_49 = string.find(l_0_48, "\\[^\\]*$") or 0
                local l_0_50 = string.find(l_0_48, ".", l_0_49, true)
                if l_0_50 ~= nil then
                  local l_0_51 = string.sub(l_0_48, l_0_49 + 1, l_0_50 - 1)
                  l_0_45 = l_0_45 .. crypto.CRC32Buffer(-1, l_0_51, 0, #l_0_51)
                  l_0_45 = l_0_45 .. ";" .. string.sub(l_0_48, l_0_50 + 1) .. ";"
                end
                l_0_48 = sigattr_tail[l_0_47].utf8p2
                l_0_49 = string.find(l_0_48, "\\[^\\]*$") or 0
                l_0_50 = string.find(l_0_48, ".", l_0_49, true)
                if l_0_50 ~= nil then
                  local l_0_52 = string.sub(l_0_48, l_0_49 + 1, l_0_50 - 1)
                  l_0_45 = l_0_45 .. crypto.CRC32Buffer(-1, l_0_52, 0, #l_0_52)
                  l_0_45 = l_0_45 .. ";" .. string.sub(l_0_48, l_0_50 + 1) .. ";"
                end
                table.insert(l_0_41, sigattr_tail[l_0_47].utf8p1)
                table.insert(l_0_41, sigattr_tail[l_0_47].utf8p2)
              end
              l_0_40.file_list = l_0_41
              local l_0_53, l_0_54 = bm.get_process_relationships()
              for l_0_55, l_0_56 in ipairs(l_0_53) do
                if l_0_56.image_path ~= nil then
                  bm.add_related_process(l_0_56.ppid)
                end
              end
              for l_0_57, l_0_58 in ipairs(l_0_54) do
                if l_0_58.image_path ~= nil then
                  bm.add_related_process(l_0_58.ppid)
                  TrackPidAndTechniqueBM(l_0_58.ppid, "T1485", "susp_ransomware_childproc_type2")
                end
              end
              bm.add_related_string("ransom_files_main", l_0_45, bm.RelatedStringBMReport)
              local l_0_59 = safeJsonSerialize(l_0_40)
              bm.add_related_string("genf_ransom_meta", l_0_59, bm.RelatedStringBMReport)
              bm.trigger_sig("GenericRansomware:Type6", l_0_59)
              sms_untrusted_process()
              bm.add_action("SmsAsyncScanEvent", 100)
              TrackPidAndTechniqueBM(l_0_43, "T1486", "susp_ransomware_type6")
              reportTimingData()
              reportSessionInformationInclusive()
              local l_0_60, l_0_61 = pcall(reportBmInfo)
              if not l_0_60 and l_0_61 then
                bm.add_related_string("bmInfoFailReason", tostring(l_0_61), bm.RelatedStringBMReport)
              end
              if l_0_15 == false and 0 < #l_0_9 and l_0_14 ~= nil and l_0_14 ~= "" then
                local l_0_62 = mp.GetExtensionClass(l_0_19)
                if isnull(l_0_62) then
                  l_0_62 = 1000
                end
                local l_0_63, l_0_64
                if MpCommon.GetBehavioralNetworkBlocksSettings then
                  l_0_63, l_0_64 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
                end
                if not l_0_63 or l_0_64 == nil then
                  l_0_64 = {
                    State = MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_NOT_CONFIGURED,
                    MaxTimeout = 0,
                    Exclusions = "",
                    AggressiveLevel = 0
                  }
                end
                l_0_8 = {
                  Extension = l_0_19,
                  ExtensionClass = l_0_62,
                  imagePath = l_0_42,
                  commandLine = l_0_44,
                  ppID = l_0_43,
                  UserName = l_0_12,
                  Domain = l_0_13,
                  file_list = l_0_9,
                  Type = "Type6",
                  RemoteEncConfig = l_0_64
                }
                local l_0_65 = safeJsonSerialize(l_0_8)
                bm.add_related_string("RemoteClientData", l_0_65, bm.RelatedStringBMReport)
                bm.trigger_sig("RemoteGenericRansomware:Type6", l_0_65)
                local l_0_66, l_0_67 = pcall(updateSystemDNSServers)
                if not l_0_66 then
                  bm.add_related_string("updateSystemDNSServers_fail", l_0_67, bm.RelatedStringBMReport)
                end
                local l_0_68, l_0_69, l_0_70, l_0_71 = pcall(updateDomainInfo)
                if l_0_68 then
                  l_0_8.ipTypeFlags = GetRollingQueueKeyValue("domainInfo", l_0_14)
                else
                  bm.add_related_string("updateDomainInfo_fail", l_0_69, bm.RelatedStringBMReport)
                end
                local l_0_72 = SafeGetUrlReputation({l_0_14}, {
                  SIG_CONTEXT = "BM",
                  CONTEXT_SOURCE = "GenRansom",
                  TAG = "NOLOOKUP",
                  data = safeJsonSerialize(l_0_8)
                }, false, 3000, false)
                if l_0_72 and l_0_72.error == 3 then
                  l_0_8.CRReportError = "Failed the first attempt"
                  l_0_72 = SafeGetUrlReputation({l_0_14}, {
                    SIG_CONTEXT = "BM",
                    CONTEXT_SOURCE = "GenRansom3",
                    TAG = "NOLOOKUP",
                    data = safeJsonSerialize(l_0_8)
                  }, false, 3000, false)
                end
                if l_0_72.urls[l_0_14] and (l_0_72.urls[l_0_14].determination == 2 or l_0_72.urls[l_0_14].determination == 1) and l_0_72.urls[l_0_14].confidence and l_0_72.urls[l_0_14].confidence >= 50 and l_0_72.urls[l_0_14].context.Source == "GenRansom" then
                  l_0_8.confidence = l_0_72.urls[l_0_14].confidence
                  l_0_8.family = l_0_72.urls[l_0_14].context.Family
                  l_0_8.determination = l_0_72.urls[l_0_14].determination
                  local l_0_73 = {
                    action = l_0_72.urls[l_0_14].context.action,
                    parameter = l_0_72.urls[l_0_14].context.action_parameter,
                    ttl = l_0_72.urls[l_0_14].context.action_ttl
                  }
                  l_0_8.context = l_0_72.urls[l_0_14].context
                  l_0_8.action = l_0_73
                  l_0_8.ip = l_0_14
                  l_0_8.unscrubbed_username = l_0_10
                  l_0_8.unscrubbed_domain = l_0_11
                  bm.trigger_sig("RemoteGenericRansomware:Malware", safeJsonSerialize(l_0_8))
                end
              end
              bm.add_related_string("sigcount_type6", l_0_3, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
