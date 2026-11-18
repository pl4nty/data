-- Threat: !InfrastructureShared
-- Name: 3bb3cb1fb85b
-- Type: 21

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
local l_0_2 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\inetsrv\\config\\applicationHost.config")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetIisInstallPaths(l_0_2)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = false
local l_0_5 = false
local l_0_6 = "["
local l_0_7 = ""
for l_0_8, l_0_9 in ipairs(l_0_3) do
  if l_0_9.PoolName ~= nil and l_0_9.PoolName ~= "" and l_0_9.Path ~= nil and l_0_9.Path ~= "" and string.lower(l_0_9.PoolName) == l_0_0 then
    l_0_6 = l_0_6 .. l_0_9.Path .. "|"
    l_0_4 = true
    local l_0_10 = l_0_9.Path .. "\\web.config"
    if sysio.IsFileExists(l_0_10) then
      l_0_7 = l_0_7 .. l_0_10 .. "|"
      l_0_5 = true
    end
  end
end
if l_0_5 then
  bm.trigger_sig("webconfig_paths", l_0_7)
end
if l_0_4 then
  l_0_6 = l_0_6 .. "]"
  bm.add_related_string("webshellpaths", l_0_6, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
