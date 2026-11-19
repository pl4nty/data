-- Threat: !InfrastructureShared
-- Name: 1d3b34501776c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = 60
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = bm.get_imagepath()
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1.ppid == nil or l_0_1.command_line == nil or l_0_1.command_line == "" then
  return mp.CLEAN
end
if IsProcessExcludedFromRansomwareAnalysis() == true then
  return mp.CLEAN
end
local l_0_3 = "Ransomware_Analysis_pid_Generic.E"
local l_0_4 = MpCommon.GetPersistContextNoPath(l_0_3)
if l_0_4 ~= nil then
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if string.find(l_0_1.ppid, l_0_6, 1, true) == 1 then
      return mp.CLEAN
    end
  end
end
MpCommon.SetPersistContextNoPath(l_0_3, {
  l_0_1.ppid
}, l_0_0)
local l_0_7 = "Ransomware_Analysis_cmd_Generic.E"
local l_0_8 = MpCommon.GetPersistContextNoPath(l_0_7)
if l_0_8 ~= nil then
  for l_0_9, l_0_10 in ipairs(l_0_8) do
    if string.find(l_0_1.command_line, l_0_10, 1, true) == 1 then
      return mp.CLEAN
    end
  end
end
MpCommon.SetPersistContextNoPath(l_0_7, {
  l_0_1.command_line
}, l_0_0)
local l_0_11 = mp.GetParentProcInfo()
if l_0_11 == nil or l_0_11.ppid == nil then
  return mp.CLEAN
end
local l_0_12 = l_0_11.ppid .. ":" .. l_0_2 .. ":File_Changed"
if string.find(l_0_2, "/bin/tar", -8, true) then
  return mp.CLEAN
end
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  local l_0_13 = this_sigattrlog[12].utf8p1
  if isMultiExtensionFileName(l_0_13) == false then
    return mp.CLEAN
  end
  local l_0_14 = l_0_13:match("%.[^/%.]+$")
  if l_0_14 == nil then
    return mp.CLEAN
  end
  if string.find(l_0_2, "/usr/bin/gpg", 1, true) == 1 and (string.find(l_0_13, "/trustdb.gpg", -12, true) or string.find(l_0_13, "/secring.gpg", -12, true)) then
    return mp.CLEAN
  end
  if l_0_14:match("%.(%d+)$") ~= nil or l_0_14:match("%.%-(%w+)$") ~= nil then
    return mp.CLEAN
  end
  if CheckFileExtnIncludeProcessId(l_0_1.ppid, l_0_14) then
    return mp.CLEAN
  end
  if string.find(l_0_13, "/miniconda/", 1, true) or string.find(l_0_13, "/.cache/", 1, true) or string.find(l_0_13, "backup/", 1, true) or string.find(l_0_13, "/backup", 1, true) or string.find(l_0_13, "/opt/splunk/", 1, true) == 1 then
    return mp.CLEAN
  end
  if isKnownFileExtension(l_0_13) == false and IsRansomwareProcessImagePathExtensionExcluded(l_0_2, l_0_14) == false then
    MpCommon.SetPersistContextNoPath(l_0_12, {l_0_13}, l_0_0)
    if analyzeRansomwarePattern5(l_0_12, "NEW_FILE_CREATED") == mp.INFECTED then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
