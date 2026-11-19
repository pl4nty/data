-- Threat: !InfrastructureShared
-- Name: WinRMSessionInfra
-- Type: 1
-- Includes: TechniqueTracker, LuaFuncHelper, Path

function IsWinRMToolFilenameContext(l_1_0, l_1_1)
  if l_1_0 == nil or type(l_1_0) ~= "string" then
    return false, nil
  end
  l_1_0 = string.lower(l_1_0)
  local l_1_2 = {
    ["\\wsmprovhost%.exe$"] = "wsmprovhost",
    ["\\winrs%.exe$"] = "winrs",
    ["\\winrshost%.exe$"] = "winrshost",
    ["\\winrm%.cmd$"] = "winrm",
    ["\\wsmprovider%.dll$"] = "wsmprovider",
    ["\\evil%-winrm[^\\]*$"] = "evilwinrm",
    ["\\ruby%.exe$"] = "ruby",
    ["\\ansible%-runner[^\\]*$"] = "ansible",
    ["\\ansible%-playbook[^\\]*$"] = "ansible",
    ["\\ccmexec%.exe$"] = "sccm",
    ["\\sensendr%.exe$"] = "sccm",
    ["\\intunemanagementextension%.exe$"] = "intune"
  }
  for l_1_3, l_1_4 in pairs(l_1_2) do
    if l_1_0:match(l_1_3) then
      if l_1_1 ~= nil then
        l_1_1 = string.lower(l_1_1)
        return l_1_4 == l_1_1, l_1_4
      else
        return true, l_1_4
      end
    end
  end
  return false, nil
end

function IsWinRMToolLocationContext(l_2_0, l_2_1)
  if l_2_0 == nil or type(l_2_0) ~= "string" then
    return false, nil
  end
  l_2_0 = string.lower(l_2_0)
  local l_2_2 = {
    [":\\program files\\winrm"] = "winrm",
    [":\\program files (x86)\\winrm"] = "winrm",
    [":\\program files\\ansible"] = "ansible",
    [":\\program files (x86)\\ansible"] = "ansible",
    [":\\program files\\microsoft configuration manager"] = "sccm",
    [":\\windows\\ccm\\"] = "sccm",
    [":\\program files (x86)\\microsoft intune management extension"] = "intune"
  }
  for l_2_3, l_2_4 in pairs(l_2_2) do
    if string.find(l_2_0, l_2_3, 1, true) or l_2_0:match(l_2_3) then
      if l_2_1 ~= nil then
        l_2_1 = string.lower(l_2_1)
        return l_2_4 == l_2_1, l_2_4
      else
        return true, l_2_4
      end
    end
  end
  return false, nil
end

function IsTrustedWinRMToolName(l_3_0)
  if l_3_0 == nil or type(l_3_0) ~= "string" then
    return false
  end
  l_3_0 = string.lower(l_3_0)
  local l_3_1 = {
    ansible = true,
    sccm = true,
    intune = true
  }
  return l_3_1[l_3_0] == true
end

function WinRMSessionTrackProcess(l_4_0, l_4_1, l_4_2, l_4_3)
  if l_4_0 == nil then
    return
  end
  if l_4_3 == nil then
    l_4_3 = 1
  end
  local l_4_4 = "WinRMSessionTracking"
  l_4_0 = GetRealPidForScenario(l_4_0)
  if l_4_0 == nil then
    return
  end
  local l_4_5 = "wrm-" .. tostring(l_4_0)
  if l_4_1 ~= nil and type(l_4_1) == "string" then
    l_4_1 = string.lower(l_4_1)
    AppendToRollingQueueNamespaced(l_4_5, l_4_4, l_4_1)
  else
    l_4_1 = "any"
  end
  AppendToRollingQueueNamespaced(l_4_5, l_4_4, "any")
  pcall(MpCommon.BmTriggerSig, l_4_0, l_4_4, l_4_1)
  if l_4_2 ~= nil and type(l_4_2) == "string" then
    l_4_2 = string.lower(l_4_2)
    AppendToRollingQueueNamespaced(l_4_5, l_4_4, l_4_2, l_4_3)
    pcall(MpCommon.BmTriggerSig, l_4_0, "WinRMSessionTrackingRole", l_4_2)
  end
  return
end

function IsWinRMSessionForPpid(l_5_0, l_5_1, l_5_2)
  if l_5_0 == nil then
    return
  end
  local l_5_3 = "WinRMSessionTracking"
  l_5_0 = GetRealPidForScenario(l_5_0)
  if l_5_0 == nil then
    return false
  end
  local l_5_4 = "wrm-" .. tostring(l_5_0)
  if l_5_1 ~= nil and type(l_5_1) == "string" then
    l_5_1 = string.lower(l_5_1)
  else
    l_5_1 = "any"
  end
  local l_5_5, l_5_6 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_5_4, l_5_3, l_5_1)
  if l_5_5 and l_5_6 ~= nil and 1 <= l_5_6 then
    if l_5_2 == nil then
      return true
    end
    l_5_2 = string.lower(l_5_2)
    local l_5_7, l_5_8 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_5_4, l_5_3, l_5_2)
    if l_5_7 and l_5_8 ~= nil and 1 <= l_5_8 then
      return true
    end
  end
  return false
end

function IsWinRMSessionFoundInParents(l_6_0, l_6_1, l_6_2, l_6_3)
  if l_6_0 == nil then
    return
  end
  if l_6_2 == nil then
    l_6_2 = 4
  end
  if type(l_6_2) ~= "number" or 15 < l_6_2 then
    return
  end
  if l_6_2 <= 0 then
    return false
  end
  local l_6_4 = l_6_0
  l_6_0 = GetRealPidForScenario(l_6_0)
  if l_6_0 == nil then
    return false
  end
  local l_6_5 = false
  if type(l_6_4) == "string" and string.lower(l_6_4) == "cmdhstr" then
    l_6_5 = IsWinRMSessionForPpid(l_6_0, l_6_1, l_6_3)
    if l_6_5 then
      return l_6_5
    end
  end
  local l_6_6 = mp.GetParentProcInfo(l_6_0)
  if l_6_6 ~= nil and l_6_6.ppid ~= nil then
    l_6_5 = IsWinRMSessionForPpid(l_6_6.ppid, l_6_1, l_6_3)
    if l_6_5 then
      return l_6_5
    else
      return IsWinRMSessionFoundInParents(l_6_6.ppid, l_6_1, l_6_2 - 1, l_6_3)
    end
  end
  return false
end

function WinRMSessionTrackFile(l_7_0, l_7_1, l_7_2, l_7_3)
  if l_7_0 == nil then
    return
  end
  if l_7_3 == nil then
    l_7_3 = 1
  end
  local l_7_4 = normalize_path(l_7_0)
  if l_7_4 == nil then
    return
  end
  local l_7_5 = "WinRMSessionTracking"
  if l_7_1 ~= nil and type(l_7_1) == "string" then
    l_7_1 = string.lower(l_7_1)
    AppendToRollingQueueNamespaced(l_7_4, l_7_5, l_7_1)
  else
    l_7_1 = "any"
  end
  AppendToRollingQueueNamespaced(l_7_4, l_7_5, "any")
  if l_7_2 ~= nil and type(l_7_2) == "string" then
    l_7_2 = string.lower(l_7_2)
    AppendToRollingQueueNamespaced(l_7_4, l_7_5, l_7_2, l_7_3)
  end
  return
end

function IsWinRMTrackedFile(l_8_0, l_8_1, l_8_2)
  if l_8_0 == nil then
    return
  end
  local l_8_3 = normalize_path(l_8_0)
  if l_8_3 == nil then
    return false
  end
  local l_8_4 = "WinRMSessionTracking"
  if l_8_1 ~= nil and type(l_8_1) == "string" then
    l_8_1 = string.lower(l_8_1)
  else
    l_8_1 = "any"
  end
  local l_8_5, l_8_6 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_8_3, l_8_4, l_8_1)
  if l_8_5 and l_8_6 ~= nil and 1 <= l_8_6 then
    if l_8_2 == nil then
      return true
    end
    l_8_2 = string.lower(l_8_2)
    local l_8_7, l_8_8 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_8_3, l_8_4, l_8_2)
    if l_8_7 and l_8_8 ~= nil and 1 <= l_8_8 then
      return true
    end
  end
  return false
end

function SetWinRMSessionMetadata(l_9_0, l_9_1, l_9_2)
  if l_9_0 == nil then
    return
  end
  if l_9_1 == nil or type(l_9_1) ~= "string" or l_9_1 == "" then
    return
  end
  if l_9_2 == nil or type(l_9_2) ~= "string" then
    return
  end
  local l_9_3 = "WinRMSessionMetadata"
  l_9_0 = GetRealPidForScenario(l_9_0)
  if l_9_0 == nil then
    return
  end
  local l_9_4 = "wrm-meta-" .. tostring(l_9_0)
  AppendToRollingQueueNamespaced(l_9_4, l_9_3, string.lower(l_9_1) .. "=" .. l_9_2)
  return
end

function HasWinRMSessionMetadata(l_10_0, l_10_1, l_10_2)
  if l_10_0 == nil then
    return false
  end
  if l_10_1 == nil or type(l_10_1) ~= "string" then
    return false
  end
  if l_10_2 == nil or type(l_10_2) ~= "string" then
    return false
  end
  local l_10_3 = "WinRMSessionMetadata"
  l_10_0 = GetRealPidForScenario(l_10_0)
  if l_10_0 == nil then
    return false
  end
  local l_10_4 = "wrm-meta-" .. tostring(l_10_0)
  local l_10_5 = string.lower(l_10_1) .. "=" .. l_10_2
  local l_10_6, l_10_7 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_10_4, l_10_3, l_10_5)
  return l_10_6 and l_10_7 ~= nil and 1 <= l_10_7
end

function IsTrustedWinRMSession(l_11_0)
  if l_11_0 == nil then
    return false
  end
  if IsWinRMSessionForPpid(l_11_0, "ansible") == true then
    return true
  end
  if IsWinRMSessionForPpid(l_11_0, "sccm") == true then
    return true
  end
  if IsWinRMSessionForPpid(l_11_0, "intune") == true then
    return true
  end
  if IsWinRMSessionFoundInParents(l_11_0, "ansible", 4) == true then
    return true
  end
  if IsWinRMSessionFoundInParents(l_11_0, "sccm", 4) == true then
    return true
  end
  if IsWinRMSessionFoundInParents(l_11_0, "intune", 4) == true then
    return true
  end
  return false
end
