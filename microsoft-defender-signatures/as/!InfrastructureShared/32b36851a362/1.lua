-- Threat: !InfrastructureShared
-- Name: 32b36851a362
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = safeJsonDeserialize(l_0_0)
  local l_0_2 = l_0_1.type
  local l_0_3 = l_0_1.event
  local l_0_4 = l_0_1.weight
  local l_0_5 = l_0_1.blocked
  local l_0_6 = l_0_1.procInfo
  local l_0_7 = l_0_1.parents
  local l_0_8 = {}
  local l_0_9 = {}
  local l_0_10 = {}
  if contains(l_0_6.cmdline, {"netsvcs", "gpsvc"}) then
    return mp.CLEAN
  end
  if not l_0_6.friendly then
    table.insert(l_0_10, l_0_6.pid .. ";" .. l_0_6.imagePath)
    local l_0_11 = mp.ContextualExpandEnvironmentVariables(l_0_6.imagePath)
    if l_0_11 and mp.IsKnownFriendlyFile(l_0_11, false, true) == false then
      table.insert(l_0_8, l_0_11)
    end
  end
  if l_0_6.shellScripts then
    local l_0_12 = l_0_6.shellScripts
    for l_0_13, l_0_14 in ipairs(l_0_12) do
      local l_0_15 = mp.ContextualExpandEnvironmentVariables(l_0_14)
      if l_0_15 and mp.IsKnownFriendlyFile(l_0_15, false, true) == false then
        table.insert(l_0_8, l_0_15)
      end
    end
  end
  if l_0_6.scriptInCmdline then
    local l_0_16 = l_0_6.scriptInCmdline
    for l_0_17, l_0_18 in ipairs(l_0_16) do
      if l_0_18.age ~= 0 then
        local l_0_19 = l_0_18.path
        l_0_19 = l_0_19:gsub("\\\\", "\\")
        local l_0_20 = mp.ContextualExpandEnvironmentVariables(l_0_19)
        if l_0_20 and mp.IsKnownFriendlyFile(l_0_20, false, true) == false then
          table.insert(l_0_8, l_0_20)
        end
      end
    end
  end
  for l_0_21, l_0_22 in ipairs(l_0_7) do
    if contains(l_0_22.cmdline, {"netsvcs", "gpsvc"}) then
      return mp.CLEAN
    end
    if not l_0_22.friendly then
      table.insert(l_0_10, l_0_22.ppid .. ";" .. l_0_22.imagePath)
      local l_0_23 = mp.ContextualExpandEnvironmentVariables(l_0_22.imagePath)
      if l_0_23 and mp.IsKnownFriendlyFile(l_0_23, false, true) == false then
        table.insert(l_0_8, l_0_23)
      end
    end
    local l_0_24 = l_0_22.shellScripts
    for l_0_25, l_0_26 in ipairs(l_0_24) do
      local l_0_27 = mp.ContextualExpandEnvironmentVariables(l_0_26)
      if l_0_27 and mp.IsKnownFriendlyFile(l_0_27, false, true) == false then
        table.insert(l_0_8, l_0_27)
      end
    end
    if l_0_22.scriptInCmdline and next(l_0_22.scriptInCmdline) then
      for l_0_28, l_0_29 in l_0_22.scriptInCmdline, nil, nil do
        if l_0_29.age ~= 0 then
          local l_0_30 = l_0_29.path
          l_0_30 = l_0_30:gsub("\\\\", "\\")
          local l_0_31 = mp.ContextualExpandEnvironmentVariables(l_0_30)
          if l_0_31 and mp.IsKnownFriendlyFile(l_0_31, false, true) == false then
            table.insert(l_0_8, l_0_31)
          end
        end
      end
    end
  end
  local l_0_32 = {}
  l_0_32["cmd.exe"] = true
  l_0_32["powershell.exe"] = true
  l_0_32["wscript.exe.exe"] = true
  local l_0_33 = {}
  for l_0_34, l_0_35 in ipairs(l_0_8) do
    local l_0_36 = l_0_35.match("([^\\]+)$")
    if l_0_36 and l_0_32[l_0_36] then
      table.insert(l_0_33, l_0_35)
    end
  end
  l_0_8 = l_0_33
  local l_0_37 = false
  local l_0_38 = 0
  if 30 <= l_0_4 and l_0_2 == "AMSI_Exclusion" then
    for l_0_39 in l_0_3:gmatch("([^;]+)") do
      local l_0_40, l_0_41 = MpCommon.StringRegExpSearch("(%userprofile%|%systemdrive%|%programdata%|%appdata%|%localappdata%|%windir%|%programfiles(x86)%|%programfiles%)$|(c:\\\\users\\\\.*\\\\(documents|downloads|pictures|music|videos))$|\\|\\.?(exe|dll|ps1|bat|cmd|sys)$|(\\w:(\\\\*)?\\*?%?$)", l_0_39)
      if l_0_40 then
        table.insert(l_0_9, l_0_39)
        l_0_38 = l_0_38 + 1
      end
    end
    l_0_37 = true
  end
  if string.find(l_0_3, "^trojan.*bulk") and l_0_2 == "AMSI" then
    l_0_37 = true
    l_0_38 = l_0_38 + 1
    table.insert(l_0_9, l_0_3)
  end
  if 100 <= l_0_4 and l_0_6.avExcludedEntities and next(l_0_6.avExcludedEntities) then
    local l_0_42 = l_0_6.avExcludedEntities
    for l_0_43, l_0_44 in ipairs(l_0_8) do
      if l_0_42[l_0_44] then
        l_0_37 = true
        table.insert(l_0_9, l_0_44)
      end
    end
  end
  if not l_0_37 then
    return mp.CLEAN
  end
  local l_0_45 = {}
  l_0_45.Event = l_0_0
  l_0_45.FilesToRemediate = l_0_8
  l_0_45.ProcessesToRemediate = l_0_10
  l_0_45.ExclusionsToRevert = l_0_9
  if (l_0_2 == "AMSI" or l_0_2 == "CMD") and l_0_5 then
    l_0_45.Reason = "BlockedTampering"
    bm.trigger_sig("Remediate_MassTampering_Q", safeJsonSerialize(l_0_45))
    return mp.CLEAN
  end
  if 1 < l_0_38 then
    l_0_45.Reason = "MultipleSuspExclusions"
    bm.trigger_sig("Remediate_MassTampering_Z", safeJsonSerialize(l_0_45))
    return mp.CLEAN
  end
  if 200 < l_0_4 and next(l_0_8) then
    l_0_45.Reason = "HighScore_FileToRemediate"
    bm.trigger_sig("Remediate_MassTampering_W", safeJsonSerialize(l_0_45))
    return mp.CLEAN
  end
  bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_45), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
