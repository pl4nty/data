-- Threat: !InfrastructureShared
-- Name: d30b3d0db6634
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = {}
local l_0_1 = false
if this_sigattrlog[19].matched then
  if this_sigattrlog[19].reg_block_src ~= bm.BM_REG_BLOCK_TAMPER_PROTECTION or not this_sigattrlog[19].reg_block_usermode then
    return mp.CLEAN
  end
  l_0_0.type = "BM_REG_BLOCK"
  l_0_0.event = this_sigattrlog[19].utf8p1
elseif this_sigattrlog[20].matched then
  if this_sigattrlog[20].reg_block_src ~= bm.BM_REG_BLOCK_TAMPER_PROTECTION or not this_sigattrlog[20].reg_block_usermode then
    return mp.CLEAN
  end
  l_0_0.type = "BM_REG_BLOCK"
  l_0_0.event = this_sigattrlog[20].utf8p1
elseif this_sigattrlog[25].matched then
  l_0_0.type = "BM_Exclusion"
  l_0_0.event = this_sigattrlog[25].utf8p1
elseif this_sigattrlog[26].matched then
  l_0_0.type = "BM_Exclusion"
  l_0_0.event = this_sigattrlog[26].utf8p1
elseif this_sigattrlog[27].matched then
  l_0_0.type = "AMSI_Exclusion"
  l_0_0.event = this_sigattrlog[27].utf8p2
elseif this_sigattrlog[29].matched then
  l_0_0.type = "BM_Exclusion_Wide"
  l_0_0.event = this_sigattrlog[29].utf8p1
elseif this_sigattrlog[28].matched then
  l_0_0.type = "BM_FW"
  l_0_0.event = this_sigattrlog[28].utf8p1
elseif this_sigattrlog[21].matched then
  l_0_0.type = "BM_REG_IGNORE"
  l_0_0.event = this_sigattrlog[21].utf8p1
elseif this_sigattrlog[22].matched then
  l_0_0.type = "BM_REG_IGNORE"
  l_0_0.event = this_sigattrlog[22].utf8p1
elseif this_sigattrlog[23].matched then
  l_0_0.type = "BM_REG_IGNORE"
  l_0_0.event = this_sigattrlog[23].utf8p1
elseif this_sigattrlog[24].matched then
  l_0_0.type = "BM_REG_IGNORE"
  l_0_0.event = this_sigattrlog[24].utf8p1
else
  l_0_1 = true
end
if l_0_1 then
  for l_0_2 = mp.SIGATTR_LOG_SZ, 1, -1 do
    local l_0_3 = sigattr_tail[l_0_2]
    if l_0_3.matched then
      if l_0_3.attribute == 16407 and l_0_3.utf8p2 then
        local l_0_4, l_0_5 = MpCommon.StringRegExpSearch("Trojan:Win32\\/MpTamper(SrvDisableAV|BlockNewFirewall|DisableFeatureWd|SvcCfg|BulkExcl|SvcCfg|SysAdmin|SrvStop|PsExec)", l_0_3.utf8p2)
        if l_0_4 then
          l_0_0.type = "CMD"
          l_0_0.event = l_0_3.utf8p2
          l_0_0.blocked = l_0_3.utf8p1 == "BM_BLOCKPROCESSCREATE" and true
          break
        end
      elseif l_0_3.attribute == 16472 and l_0_3.utf8p1 then
        local l_0_7, l_0_8 = MpCommon.StringRegExpSearch("^Trojan:Win32\\/MpTamper(SrvDisableAV|DisableFeatureWd|BulkExcl)", l_0_3.utf8p1)
        if l_0_7 then
          l_0_0.type = "AMSI"
          l_0_0.event = l_0_3.utf8p1
          l_0_0.blocked = l_0_3.utf8p2 == "INFECTED" and true
          break
        end
      end
    end
  end
end
local l_0_10 = false
local l_0_11 = false
local l_0_12 = {}
local l_0_13 = bm.get_current_process_startup_info()
local l_0_14 = bm.get_imagepath()
local l_0_15 = l_0_14:match("([^\\]+)$")
local l_0_16, l_0_17 = hasSeenBefore(l_0_15, l_0_0.event, 7, "TamperingAttemptInMachine")
if l_0_16 and 3 < l_0_17 then
  return mp.CLEAN
end
l_0_12.pid = l_0_13.ppid
l_0_12.imagePath = bm.get_imagepath()
l_0_12.friendly = MpCommon.IsFriendlyProcess(l_0_13.ppid)
l_0_12.cmdline = mp.GetProcessCommandLine(l_0_13.ppid) or ""
l_0_12.cmdline = string.lower(l_0_12.cmdline)
if not l_0_12.friendly then
  l_0_11 = true
end
local l_0_18 = {
  [".bat"] = true,
  [".cmd"] = true,
  [".ps1"] = true,
  [".vbs"] = true
}
l_0_12.scriptInCmdline = bm_AddRelatedFileFromCommandLine("bm", l_0_18, nil, 2)
if l_0_12.scriptInCmdline and next(l_0_12.scriptInCmdline) then
  l_0_10 = true
  l_0_12.hasScriptInCmdline = true
end
local l_0_19, l_0_20, l_0_21 = IsKeyInRollingQueue("ShellScripts", l_0_13.ppid, false)
l_0_12.shellScripts = {}
if l_0_19 then
  for l_0_22, l_0_23 in ipairs(l_0_21) do
    table.insert(l_0_12.shellScripts, l_0_23.value)
  end
end
local l_0_24, l_0_25 = pcall(reportAVExcludedEntities)
if l_0_24 then
  l_0_12.avExcludedEntities = l_0_25
end
l_0_0.procInfo = l_0_12
local l_0_26, l_0_27 = bm.get_process_relationships()
local l_0_28 = {}
if l_0_26 then
  for l_0_29, l_0_30 in ipairs(l_0_26) do
    local l_0_31 = {}
    if l_0_30.ppid then
      l_0_31.ppid = l_0_30.ppid
      l_0_31.imagePath = l_0_30.image_path or ""
      l_0_31.friendly = MpCommon.IsFriendlyProcess(l_0_30.ppid)
      if not l_0_31.friendly then
        l_0_11 = true
      end
      l_0_31.cmdline = string.lower(mp.GetProcessCommandLine(l_0_30.ppid) or "")
      l_0_31.scriptInCmdline = bm_AddRelatedFileFromCommandLine(l_0_31.cmdline, l_0_18, nil, 2)
      if l_0_31.scriptInCmdline and next(l_0_31.scriptInCmdline) then
        l_0_10 = true
        l_0_31.hasScriptInCmdline = true
      end
      if l_0_30.reason == bm.RELATIONSHIP_CREATED then
        l_0_31.reason = "CREATED"
      elseif l_0_30.reason == bm.RELATIONSHIP_INJECTION then
        l_0_31.reason = "INJECTION"
      end
      local l_0_32, l_0_33, l_0_34 = IsKeyInRollingQueue("ShellScripts", l_0_30.ppid, false)
      l_0_31.shellScripts = {}
      if l_0_32 then
        for l_0_35, l_0_36 in ipairs(l_0_34) do
          table.insert(l_0_31.shellScripts, l_0_36.value)
          l_0_10 = true
        end
      end
      table.insert(l_0_28, l_0_31)
    end
  end
end
l_0_0.parents = l_0_28
local l_0_37 = {
  BM_Exclusion = 5,
  BM_REG_IGNORE = 50,
  BM_REG_BLOCK = 50,
  BM_Exclusion_Wide = 50,
  BM_FW = 100,
  CMD = 50,
  AMSI = 50,
  AMSI_Exclusion = 5
}
l_0_0.weight = l_0_37[l_0_0.type]
l_0_0.event = string.lower(l_0_0.event)
local l_0_38 = {
  ["reg.exe"] = 10,
  ["cmd.exe"] = 10,
  ["powershell.exe"] = 10,
  ["regedit.exe"] = 10,
  ["svchost.exe"] = 0,
  ["services.exe"] = 0,
  ["wmiprvse.exe"] = 0,
  ["csrss.exe"] = 0,
  ["lsass.exe"] = 0,
  ["acmpclientservice.exe"] = 0,
  ["ccmexec.exe"] = 0,
  ["taniumcx.exe"] = 0,
  default = 1
}
if l_0_0.type == "BM_Exclusion" then
  local l_0_39 = l_0_0.event
  local l_0_40 = 3600
  local l_0_41 = 100
  local l_0_42 = "exclusion_events"
  if IsKeyInRollingQueue(l_0_42, l_0_39, true) then
    return mp.CLEAN
  end
  AppendToRollingQueue(l_0_42, l_0_39, 1, l_0_40, l_0_41)
  if string.find(l_0_0.event, "exclusions\\paths", 1, true) then
    l_0_0.type = "BM_Exclusion_Path"
  elseif string.find(l_0_0.event, "exclusions\\extensions", 1, true) then
    l_0_0.type = "BM_Exclusion_Extension"
  elseif string.find(l_0_0.event, "exclusions\\process", 1, true) then
    l_0_0.type = "BM_Exclusion_Process"
  else
    l_0_0.type = "BM_Exclusion_IP"
  end
  local l_0_43 = l_0_12.pid .. l_0_12.imagePath
  local l_0_44 = 3600
  local l_0_45 = 100
  local l_0_46 = "exclusion_events_pid"
  local l_0_47 = GetRollingQueueKeyValue(l_0_46, l_0_43)
  if l_0_47 then
    AppendToRollingQueue(l_0_46, l_0_43, l_0_47 + 1, l_0_44, l_0_45)
  else
    AppendToRollingQueue(l_0_46, l_0_43, 1, l_0_44, l_0_45)
    l_0_47 = 0
  end
  local l_0_48 = string.lower(l_0_12.imagePath:match("([^\\]+)$"))
  l_0_0.weight = l_0_0.weight * (l_0_38[l_0_48] or l_0_38.default)
  if l_0_0.weight == 0 then
    return mp.CLEAN
  end
  local l_0_49, l_0_50 = MpCommon.StringRegExpSearch("(documents|downloads|pictures|music|videos)$|\\\\\\\\\\.?(exe|dll|ps1|bat|cmd|sys)$|(\\w:(\\\\*)?\\*?%?$)", l_0_0.event)
  if l_0_49 then
    l_0_0.weight = l_0_0.weight * 10
  end
  if l_0_0.event:find("(%w+%.%w+)$") or l_0_0.event:find("(%.%w+)$") then
    l_0_49, l_0_50 = MpCommon.StringRegExpSearch("[\\\\\\.](exe|dll|ps1|bat|cmd|sys)$", l_0_0.event)
    if l_0_49 then
      if not l_0_0.event:match("\\extensions\\\\") then
        l_0_0.weight = l_0_0.weight / (l_0_47 + 1)
      end
    else
      l_0_0.weight = 0
    end
  end
  if l_0_0.weight == 0 then
    return mp.CLEAN
  end
end
if l_0_0.type == "AMSI_Exclusion" then
  local l_0_51 = l_0_0.event
  local l_0_52 = 3600
  local l_0_53 = 100
  local l_0_54 = "exclusion_events"
  if IsKeyInRollingQueue(l_0_54, l_0_51, true) then
    return mp.CLEAN
  end
  AppendToRollingQueue(l_0_54, l_0_51, 1, l_0_52, l_0_53)
  local l_0_55, l_0_56, l_0_57 = IsKeyInRollingQueue("WDAVExclusion", l_0_51)
  l_0_0.weight = 0
  local l_0_58 = {}
  if l_0_55 then
    for l_0_59, l_0_60 in ipairs(l_0_57) do
      local l_0_61 = string.lower(l_0_60.value)
      if not in_array(l_0_58, l_0_61) then
        table.insert(l_0_58, l_0_61)
        local l_0_62 = l_0_12.pid .. l_0_12.imagePath
        local l_0_63 = "exclusion_events_pid"
        local l_0_64 = GetRollingQueueKeyValue(l_0_63, l_0_62)
        if l_0_64 then
          AppendToRollingQueue(l_0_63, l_0_62, l_0_64 + 1, l_0_52, l_0_53)
        else
          AppendToRollingQueue(l_0_63, l_0_62, 1, l_0_52, l_0_53)
          l_0_64 = 0
        end
        local l_0_65 = l_0_37.AMSI_Exclusion
        local l_0_66 = l_0_12.imagePath:match("(%w+%.exe)$")
        l_0_65 = l_0_65 * (l_0_38[l_0_66] or l_0_38.default)
        local l_0_67, l_0_68 = MpCommon.StringRegExpSearch("(documents|downloads|pictures|music|videos)$|\\|\\.?(exe|dll|ps1|bat|cmd|sys)$|(\\w:(\\\\*)?\\*?%?$)", l_0_61)
        if l_0_67 then
          l_0_65 = l_0_65 * 10
        end
        if l_0_61:find("(%w+%.%w+)$") or l_0_61:find("(%.%w+)$") then
          l_0_67, l_0_68 = MpCommon.StringRegExpSearch("[\\|\\.](exe|dll|ps1|bat|cmd|sys)$", l_0_61)
          if l_0_67 then
            if not l_0_61:match("^extension") then
              l_0_65 = l_0_65 / (l_0_64 + 1)
            end
          else
            l_0_65 = 0
          end
        end
        l_0_0.weight = l_0_0.weight + l_0_65
      end
    end
  end
  l_0_0.event = table.concat(l_0_58, ";")
  if l_0_0.weight == 0 then
    return mp.CLEAN
  end
end
local l_0_69 = {
  disablearchivescanning = 4,
  ["threatseveritydefaultaction\\2"] = 8,
  disablescriptscanning = 20,
  ["5"] = 33,
  ["4"] = 33,
  disableroutinelytakingaction = 50
}
local l_0_70 = {
  disableantispyware = 5,
  disableinformationprotectioncontrol = 6,
  disablerawwritenotification = 6,
  disablerealtimemonitoring = 7,
  spynetreporting = 7,
  disablebehaviormonitoring = 8,
  disableintrusionpreventionsystem = 14,
  disableioavprotection = 16,
  disablescriptscanning = 50,
  disableonaccessprotection = 50,
  disablescanonrealtimeenable = 50
}
if l_0_0.type == "BM_REG_BLOCK" or l_0_0.type == "BM_REG_IGNORE" then
  local l_0_71 = l_0_0.event
  local l_0_72 = 3600
  local l_0_73 = 100
  local l_0_74 = "reg_events"
  if IsKeyInRollingQueue(l_0_74, l_0_71, true) then
    return mp.CLEAN
  end
  AppendToRollingQueue(l_0_74, l_0_71, 1, l_0_72, l_0_73)
  local l_0_75 = 0
  local l_0_76 = GetRollingQueueKeys(l_0_74)
  if l_0_76 then
    l_0_75 = #l_0_76
  end
  if l_0_75 <= 1 then
    local l_0_77 = l_0_0.event:match("\\\\(%w+)")
    if l_0_0.type == "BM_REG_BLOCK" then
      l_0_0.weight = l_0_69[l_0_77] or l_0_37.BM_REG_BLOCK
    elseif l_0_0.type == "BM_REG_IGNORE" then
      l_0_0.weight = l_0_70[l_0_77] or l_0_37.BM_REG_IGNORE
      l_0_0.weight = l_0_0.weight * (l_0_38[l_0_15] or l_0_38.default)
      if l_0_0.weight == 0 then
        return mp.CLEAN
      end
    end
  end
end
if l_0_11 then
  l_0_0.weight = l_0_0.weight + 10
end
local l_0_78 = {
  [21] = "L",
  [51] = "M",
  [101] = "H",
  [121] = "HP"
}
local l_0_79 = {
  [21] = "L",
  [51] = "M",
  [101] = "H",
  [121] = "HP"
}
local l_0_80 = reportSessionInformation()
l_0_0.sessionInfo = l_0_80 or {}
local l_0_81 = "TamperingTracking"
local l_0_82 = 3600
local l_0_83 = 100
local l_0_84 = safeJsonSerialize(l_0_0)
AppendToRollingQueue(l_0_81, l_0_84, l_0_0.weight, l_0_82, l_0_83)
local l_0_85 = GetRollingQueueSumOfValues(l_0_81)
local l_0_86, l_0_87 = CheckNewThresholdMet(l_0_85.sum, l_0_0.weight, l_0_78)
if l_0_86 then
  bm.trigger_sig("MassTampering_" .. l_0_87 .. "_Machine", tostring(l_0_85.sum) .. ";" .. l_0_81)
  if l_0_11 or l_0_10 or next(l_0_25) then
    local l_0_88 = true
    if #l_0_25 == 1 then
      local l_0_89, l_0_90 = next(l_0_25)
      if l_0_90 == "[]" or string.find(l_0_90, "c:\\windows\\system32\\wbem\\wmiprvse.exe", 1, true) or string.find(l_0_90, "windows\\system32\\svchost.exe", 1, true) then
        l_0_88 = false
      end
    end
    if l_0_88 then
      bm.trigger_sig("MassTampering_NonFriendly_Machine", tostring(l_0_85.sum) .. ";" .. l_0_87 .. ";" .. l_0_81)
    end
  end
end
if l_0_80.User and l_0_80.User.UserName and l_0_80.Session and l_0_80.Session.Id then
  local l_0_91 = l_0_81 .. "-" .. l_0_80.User.UserName
  AppendToRollingQueue(l_0_91, l_0_84, l_0_0.weight, l_0_82, l_0_83)
  local l_0_92 = GetRollingQueueSumOfValues(l_0_91)
  local l_0_93, l_0_94 = CheckNewThresholdMet(l_0_92.sum, l_0_0.weight, l_0_79)
  if l_0_93 then
    bm.trigger_sig("MassTampering_" .. l_0_94 .. "_User", tostring(l_0_92.sum) .. ";" .. l_0_91)
  end
end
if string.find(l_0_0.type, "BM_Exclusion", 1, true) then
  local l_0_95 = "AVExclusions"
  local l_0_96 = 946080000
  local l_0_97 = 100
  AppendToRollingQueue(l_0_95, l_0_0.event, l_0_84, l_0_96, l_0_97)
end
return mp.CLEAN
