-- Threat: !InfrastructureShared
-- Name: !#BLKEXC:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & BM_LNK_FILE

if mp.IsHipsRuleEnabled("b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4") ~= true then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = "enghipscpy:blockexecution:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = MpCommon.PathToWin32Path(l_0_1)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if mp.IsPathExcludedForHipsRule(l_0_1, "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4") then
  return mp.CLEAN
end
if MpCommon.QueryPersistContext(l_0_1, l_0_0) then
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
else
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_DEVICE_CHARACTERISTICS)
  if mp.bitand(l_0_2, 264193) ~= 264193 then
    return mp.CLEAN
  end
  local l_0_3 = MpCommon.ExpandEnvironmentVariables("%systemdrive%")
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  l_0_3 = string.lower(l_0_3)
  if string.find(l_0_1, "^" .. l_0_3) ~= nil then
    return mp.CLEAN
  end
end
local l_0_4 = {
  ["cmd.exe"] = true,
  ["powershell.exe"] = true,
  ["wscript.exe"] = true,
  ["cscript.exe"] = true,
  ["schtasks.exe"] = true,
  ["at.exe"] = true,
  ["bitsadmin.exe"] = true,
  ["mshta.exe"] = true,
  ["rundll32.exe"] = true,
  ["regasm.exe"] = true,
  ["regsvc.exe"] = true,
  ["regsvr32.exe"] = true,
  ["msbuild.exe"] = true,
  ["certutil.exe"] = true,
  ["installutil.exe"] = true,
  ["msiexec.exe"] = true
}
local l_0_5 = {
  exe = true,
  msi = true,
  js = true,
  vbs = true,
  ps1 = true,
  cmd = true,
  bat = true
}
local l_0_6 = mp.GetLnkInfo()
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
local l_0_7 = false
local l_0_8 = l_0_6.BasePath
if l_0_8 ~= nil then
  l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
  if l_0_8 ~= nil then
    l_0_8 = MpCommon.PathToWin32Path(l_0_8)
    if l_0_8 ~= nil then
      l_0_8 = string.lower(l_0_8)
      if sysio.IsFileExists(l_0_8) then
        local l_0_9 = string.match(l_0_8, "\\.+%.([^%.\\]+)$")
        if l_0_4[string.match(l_0_8, "\\([^\\]+%.exe)$")] == true or l_0_9 ~= nil and l_0_9 ~= "" and l_0_5[l_0_9] == true and not mp.IsKnownFriendlyFile(l_0_8, false, true) then
          l_0_7 = true
        end
      end
    end
  end
end
if l_0_7 == false then
  local l_0_10 = l_0_6.RelativePath
  if l_0_10 == nil or l_0_10 == "" then
    return mp.CLEAN
  end
  l_0_10 = string.lower(l_0_10)
  local l_0_11 = mp.getfilename(mp.FILEPATH_QUERY_PATH)
  if l_0_11 == nil or l_0_11 == "" then
    return mp.CLEAN
  end
  l_0_11 = MpCommon.PathToWin32Path(l_0_11)
  if l_0_11 == nil or l_0_11 == "" then
    return mp.CLEAN
  end
  l_0_11 = string.lower(l_0_11)
  local l_0_12
  if string.find(l_0_10, "^%.%.\\") then
    l_0_12 = l_0_11 .. "\\" .. l_0_10
  elseif string.find(l_0_10, "^%.\\") then
    l_0_10 = string.match(l_0_10, "^%.\\(.+)$")
    l_0_12 = l_0_11 .. "\\" .. l_0_10
  else
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_12) then
    local l_0_13 = string.match(l_0_12, "\\.+%.([^%.\\]+)$")
    if l_0_4[string.match(l_0_12, "\\([^\\]+%.exe)$")] == true or l_0_13 ~= nil and l_0_13 ~= "" and l_0_5[l_0_13] == true and not mp.IsKnownFriendlyFile(l_0_12, false, true) then
      l_0_7 = true
    end
  end
end
if l_0_7 == false then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
if MpCommon.GetPersistContextCount(l_0_1) == 0 then
  local l_0_14 = {}
  table.insert(l_0_14, l_0_0)
  MpCommon.SetPersistContext(l_0_1, l_0_14, 0)
elseif not MpCommon.QueryPersistContext(l_0_1, l_0_0) then
  MpCommon.AppendPersistContext(l_0_1, l_0_0, 0)
end
return mp.INFECTED
