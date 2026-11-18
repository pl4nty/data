-- Threat: !InfrastructureShared
-- Name: 5f0b3b316fe5f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_0 = string.match(l_0_1, "\\([^\\]+)$")
  l_0_3 = string.lower(this_sigattrlog[1].utf8p2)
  l_0_2 = this_sigattrlog[1].ppid
end
if l_0_1 == nil or l_0_0 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_4
local l_0_5 = {}
local l_0_6 = "T1547.001"
local l_0_7, l_0_8
local l_0_9 = true
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[2].utf8p2
  l_0_7 = "reg_run"
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[3].utf8p2
  l_0_7 = "reg_runonce"
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[4].utf8p2
  l_0_7 = "reg_runonceex"
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[5].utf8p2
  l_0_7 = "reg_runservices"
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[6].utf8p2
  l_0_7 = "reg_runservicesonce"
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[7].utf8p2
  l_0_7 = "reg_explorer_run"
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[8].utf8p2
  l_0_7 = "reg_winlogon_shell"
  l_0_6 = "T1547.004"
  table.insert(l_0_5, "BM_MT1547.001:persistence")
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[9].utf8p2
  l_0_7 = "reg_winlogon_userinit"
  l_0_6 = "T1547.004"
  table.insert(l_0_5, "BM_MT1547.001:persistence")
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[10].utf8p2
  l_0_7 = "reg_windows_load"
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[11].utf8p2
  l_0_7 = "reg_winlogon_notify"
  l_0_6 = "T1547.004"
elseif this_sigattrlog[12].matched and this_sigattrlog[12].p2 ~= nil then
  l_0_4 = normalize_unicode(this_sigattrlog[2].p2)
  l_0_7 = "reg_tasks_actions"
  l_0_6 = "T1053.002"
  l_0_9 = false
  l_0_8 = {
    ["svchost.exe"] = true,
    ["schtasks.exe"] = true
  }
else
  return mp.CLEAN
end
if l_0_4 == nil or #l_0_4 <= 0 then
  return mp.CLEAN
end
local l_0_10 = get_filepaths_from_string(string.lower(l_0_4))
if l_0_10 == nil then
  return mp.CLEAN
end
local l_0_11 = "BM_M" .. l_0_6
table.insert(l_0_5, l_0_11)
table.insert(l_0_5, l_0_11 .. ":persistence_target")
table.insert(l_0_5, l_0_11 .. ":sourcefilename_" .. l_0_0)
table.insert(l_0_5, l_0_11 .. ":sourceppid_" .. l_0_2)
if string.lower(l_0_0) == "reg.exe" and string.find(l_0_3, " add ", 1, true) then
  table.insert(l_0_5, l_0_11 .. ":source_reg_add")
end
if l_0_7 ~= nil and 0 < #l_0_7 then
  table.insert(l_0_5, l_0_11 .. ":" .. l_0_7)
end
if l_0_9 == true and string.find(l_0_4, " ", 1, true) then
  TrackCommandLineAndTechnique(l_0_4, l_0_5)
  TrackCommandLineAndTechnique(l_0_4, l_0_11 .. ":track_cmdline")
end
local l_0_12 = false
for l_0_13, l_0_14 in ipairs(l_0_10) do
  if string.sub(l_0_14, 1, 1) == "%" then
    l_0_14 = mp.ContextualExpandEnvironmentVariables(l_0_14)
  end
  if isLolbinFile(l_0_14) == false and not MpCommon.QueryPersistContext(l_0_14, "RegistryValueDataToFilePersistContext.A") and sysio.IsFileExists(l_0_14) then
    MpCommon.AppendPersistContext(l_0_14, "RegistryValueDataToFilePersistContext.A", 0)
    l_0_12 = appendFilePersistContextFromList(l_0_14, l_0_5)
  end
end
if l_0_12 == false then
  return mp.CLEAN
end
if l_0_8 == nil or type(l_0_8) == "table" and l_0_8[l_0_0] == nil then
  TrackPidAndTechniqueBM(l_0_2, l_0_6, "persistence_source")
  TrackPidAndTechniqueBM(l_0_2, l_0_6, l_0_7)
end
if not MpCommon.QueryPersistContext(l_0_1, "RegistryValueDataToFilePersistContext.A") and isLolbinFile(l_0_1) == false then
  MpCommon.AppendPersistContext(l_0_1, "RegistryValueDataToFilePersistContext.A", 0)
  local l_0_15 = l_0_11 .. ":persistence_source"
  appendNotExistingFilePersistContext(l_0_1, l_0_15)
end
return mp.INFECTED
