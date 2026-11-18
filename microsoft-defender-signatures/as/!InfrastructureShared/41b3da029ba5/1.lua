-- Threat: !InfrastructureShared
-- Name: 41b3da029ba5
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
local l_0_5 = "["
for l_0_6, l_0_7 in ipairs(l_0_3) do
  if l_0_7.PoolName ~= nil and l_0_7.PoolName ~= "" and l_0_7.Path ~= nil and l_0_7.Path ~= "" and string.lower(l_0_7.PoolName) == l_0_0 then
    l_0_5 = l_0_5 .. l_0_7.Path .. "|"
    l_0_4 = true
  end
end
local l_0_8, l_0_9
if this_sigattrlog[2].matched then
  l_0_8 = this_sigattrlog[2].utf8p2
  if l_0_8 ~= nil then
    bm.add_related_string("IIS_InMemoryLoadBlocked", l_0_8, bm.RelatedStringBMReport)
  end
elseif this_sigattrlog[3].matched then
  l_0_9 = this_sigattrlog[3].utf8p2
  if l_0_9 ~= nil then
    bm.add_related_string("IIS_InMemoryLoadDHA", l_0_9, bm.RelatedStringBMReport)
  end
end
if l_0_4 and l_0_8 then
  l_0_5 = l_0_5 .. "]"
  bm.add_related_string("webshellpaths", l_0_5, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
