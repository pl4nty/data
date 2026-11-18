-- Threat: !InfrastructureShared
-- Name: 2c3b33687b1e5
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper

local l_0_0 = bm.get_imagepath():lower()
if contains(l_0_0, {
  "conhost.exe",
  "werfault.exe"
}) then
  return mp.CLEAN
end
local l_0_1
local l_0_2 = false
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].utf8p1:match("([^\\]+)$")
  l_0_2 = true
elseif this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1:match("([^\\]+)$")
  l_0_2 = true
elseif this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p1:match("([^\\]+)$")
  l_0_2 = true
elseif this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p1:match("([^\\]+)$")
  l_0_2 = true
elseif this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p1:match("([^\\]+)$")
  l_0_2 = true
elseif this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[8].matched then
  l_0_1 = this_sigattrlog[8].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[9].matched then
  l_0_1 = this_sigattrlog[9].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[10].matched then
  l_0_1 = this_sigattrlog[10].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[11].matched then
  l_0_2 = true
  if this_sigattrlog[11].utf8p2:find(".home=.* start") then
    l_0_1 = this_sigattrlog[11].utf8p1:match("([^\\]+)$")
  end
elseif this_sigattrlog[12].matched then
  if this_sigattrlog[12].utf8p2:find(".home=.* start") then
    l_0_1 = this_sigattrlog[12].utf8p1:match("([^\\]+)$")
  end
elseif this_sigattrlog[13].matched then
  l_0_2 = true
  l_0_1 = this_sigattrlog[13].utf8p1:match("([^\\]+)$")
elseif this_sigattrlog[14].matched then
  l_0_1 = this_sigattrlog[14].utf8p1:match("([^\\]+)$")
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_3
if l_0_2 then
  l_0_3 = GetPidFromParentImagePath(l_0_1)
else
  local l_0_4 = bm.get_current_process_startup_info()
  if l_0_4 and l_0_4.ppid then
    l_0_3 = l_0_4.ppid
  end
end
if not l_0_3 then
  return mp.CLEAN
end
local l_0_5 = {}
l_0_5.AppName = l_0_1
l_0_5.Pid = l_0_3
l_0_5.AppCategory = "PFServers"
l_0_5.WebAppName = getWebApplicationType(l_0_3)
l_0_5.Score = 0
if not MpCommon.DoesProcessHaveAttribute(l_0_3, "PFApp_Parent") then
  local l_0_6, l_0_7 = pcall(MpCommon.AddProcessAttribute, l_0_3, "PFApp_Parent", safeJsonSerialize(l_0_5), true)
  if not l_0_6 then
    local l_0_8 = {}
    l_0_8.err = l_0_7
    l_0_8.AttributeValue = l_0_5
    l_0_8.SignatureName = "PFA_Parent.A"
    l_0_8.ProcessName = l_0_0
    bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_8))
    return mp.CLEAN
  end
end
return mp.CLEAN
