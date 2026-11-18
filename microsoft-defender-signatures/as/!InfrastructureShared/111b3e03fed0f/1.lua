-- Threat: !InfrastructureShared
-- Name: 111b3e03fed0f
-- Type: 21
-- Includes: BMLuaLib, HvaLookupHelpers

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and string.find(l_0_0, "-ap \"", 1, true) then
  l_0_0 = string.lower(l_0_0):match("-ap \"([^\"]+)\"")
else
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1 ~= nil and l_0_1.command_line ~= nil then
    l_0_0 = string.lower(l_0_1.command_line):match("-ap \"([^\"]+)\"")
  end
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2
local l_0_3 = ExtractDeviceProperties()
if l_0_3.DeviceRoles and l_0_3.DeviceRoles.SharePointServer ~= nil or IsSharepointServer() then
  local l_0_4 = "C:\\Program Files\\Common Files\\microsoft shared\\Web Server Extensions\\15\\TEMPLATE\\LAYOUTS"
  local l_0_5 = "C:\\Program Files\\Common Files\\microsoft shared\\Web Server Extensions\\16\\TEMPLATE\\LAYOUTS"
  if sysio.IsFolderExists(l_0_4) then
    l_0_2 = l_0_4
  elseif sysio.IsFolderExists(l_0_5) then
    l_0_2 = l_0_5
  end
  if l_0_2 == nil then
    return mp.CLEAN
  end
  mp.TriggerScanResource("folder", l_0_2)
  local l_0_6 = sysio.FindFiles(l_0_2, "*.aspx", 0)
  for l_0_7, l_0_8 in pairs(l_0_6) do
    mp.ReportLowfi(l_0_8, 2037457591)
  end
  return mp.INFECTED
end
local l_0_9 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\inetsrv\\config\\applicationHost.config")
if l_0_9 == nil or l_0_9 == "" then
  return mp.CLEAN
end
local l_0_10 = MpCommon.GetIisInstallPaths(l_0_9)
if l_0_10 == nil or l_0_10 == "" then
  return mp.CLEAN
end
local l_0_11 = false
local l_0_12 = false
local l_0_13 = "["
local l_0_14 = ""

function merge_tables(...)
  local l_1_0 = {}
  for l_1_1, l_1_2 in ipairs({
    ...
  }) do
    for l_1_3, l_1_4 in ipairs(l_1_2) do
      table.insert(l_1_0, l_1_4)
    end
  end
  return l_1_0
end

for l_0_15, l_0_16 in ipairs(l_0_10) do
  if l_0_16.PoolName ~= nil and l_0_16.PoolName ~= "" and l_0_16.Path ~= nil and l_0_16.Path ~= "" and string.lower(l_0_16.PoolName) == l_0_0 then
    l_0_13 = l_0_13 .. l_0_16.Path .. "|"
    mp.TriggerScanResource("folder", l_0_16.Path)
    local l_0_17 = sysio.FindFiles(l_0_16.Path, "*.aspx", -1)
    local l_0_18 = sysio.FindFiles(l_0_16.Path, "*.asp", -1)
    local l_0_19 = sysio.FindFiles(l_0_16.Path, "*.ashx", -1)
    local l_0_20 = sysio.FindFiles(l_0_16.Path, "*.jsp", -1)
    local l_0_21 = sysio.FindFiles(l_0_16.Path, "*.php", -1)
    local l_0_22 = l_0_16.Path .. "\\web.config"
    if sysio.IsFileExists(l_0_22) then
      l_0_14 = l_0_14 .. l_0_22 .. "|"
      l_0_12 = true
    end
    local l_0_23 = merge_tables(l_0_17, l_0_18, l_0_19, l_0_20, l_0_21)
    if l_0_23 then
      l_0_11 = true
      for l_0_24, l_0_25 in pairs(l_0_23) do
        if string.find(l_0_25, "\\owa\\auth\\errorFE.aspx", 1, true) == nil and string.find(l_0_25, "\\ecp\\auth\\TimeoutLogout.aspx", 1, true) == nil then
          mp.ReportLowfi(l_0_25, 2037457591)
        end
      end
    end
  end
end
if l_0_12 then
  bm.trigger_sig("webconfig_paths", l_0_14)
end
if l_0_11 then
  l_0_13 = l_0_13 .. "]"
  bm.add_related_string("webshellpaths", l_0_13, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
