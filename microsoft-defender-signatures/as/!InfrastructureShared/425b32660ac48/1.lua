-- Threat: !InfrastructureShared
-- Name: 425b32660ac48
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_imagepath():lower()
if contains(l_0_0, {
  "conhost.exe",
  "WerFault.exe"
}) then
  return mp.CLEAN
end
local l_0_1
local l_0_2 = false
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].utf8p2
  if not MpCommon.StringRegExpSearch("exec\\s+(puma|thin|rails|mongrel) ", l_0_1) then
    return mp.CLEAN
  end
  l_0_2 = true
elseif this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p2
  l_0_2 = true
elseif this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p2
  l_0_2 = true
elseif this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p2
  l_0_2 = true
elseif this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p2
  l_0_2 = true
elseif this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p2
  l_0_2 = true
elseif this_sigattrlog[8].matched then
  l_0_1 = this_sigattrlog[8].utf8p2
  l_0_2 = true
elseif this_sigattrlog[9].matched then
  l_0_1 = this_sigattrlog[9].utf8p2
  l_0_2 = true
elseif this_sigattrlog[10].matched then
  l_0_1 = this_sigattrlog[10].utf8p2
  l_0_2 = true
elseif this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p2
  if not MpCommon.StringRegExpSearch("exec\\s+(puma|thin|rails|mongrel) ", l_0_1) then
    return mp.CLEAN
  end
elseif this_sigattrlog[11].matched then
  l_0_1 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched then
  l_0_1 = this_sigattrlog[12].utf8p2
elseif this_sigattrlog[13].matched then
  l_0_1 = this_sigattrlog[13].utf8p2
elseif this_sigattrlog[14].matched then
  l_0_1 = this_sigattrlog[14].utf8p2
elseif this_sigattrlog[15].matched then
  l_0_1 = this_sigattrlog[15].utf8p2
elseif this_sigattrlog[16].matched then
  l_0_1 = this_sigattrlog[16].utf8p2
elseif this_sigattrlog[17].matched then
  l_0_1 = this_sigattrlog[17].utf8p2
elseif this_sigattrlog[18].matched then
  l_0_1 = this_sigattrlog[18].utf8p2
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_3 = l_0_1:match("-a%s+([%d%.]+)")
local l_0_4 = l_0_1:match("-p%s+([%d]+)")
if not l_0_3 then
  return mp.CLEAN
end
if l_0_3 and (l_0_3 == "127.0.0.1" or l_0_4 == "0.0.0.0") then
  return mp.CLEAN
end
local l_0_5 = l_0_3 .. ":" .. l_0_4 or "default"
local l_0_6 = "ruby_webservers_config"
local l_0_7 = 31536000
local l_0_8 = 50
AppendToRollingQueue(l_0_6, "IP/PORT", l_0_5, l_0_7, l_0_8)
local l_0_9
if l_0_2 then
  l_0_9 = GetPidFromParentImagePath("ruby.exe")
else
  local l_0_10 = bm.get_current_process_startup_info()
  if l_0_10 and l_0_10.ppid then
    l_0_9 = l_0_10.ppid
  end
end
if not l_0_9 then
  return mp.CLEAN
end
local l_0_11 = {}
l_0_11.AppName = "ruby.exe"
l_0_11.WebAppName = getWebApplicationType(l_0_9)
l_0_11.Pid = l_0_9
l_0_11.AppCategory = "PFServers"
l_0_11.Score = 0
if not MpCommon.DoesProcessHaveAttribute(l_0_9, "PFApp_Parent") then
  local l_0_12, l_0_13 = pcall(MpCommon.AddProcessAttribute, l_0_9, "PFApp_Parent", safeJsonSerialize(l_0_11), true)
  if not l_0_12 then
    local l_0_14 = {}
    l_0_14.err = l_0_13
    l_0_14.AttributeValue = l_0_11
    l_0_14.SignatureName = "SetProcAttribRBY.A"
    l_0_14.ProcessName = l_0_0
    bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_14))
  end
  if not l_0_2 then
    local l_0_15 = {}
    l_0_15.AttributeValue = l_0_11
    l_0_15.SignatureName = "SetProcAttribRBY.A"
    l_0_15.ProcessName = l_0_0
    bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(l_0_15))
  end
end
bm.trigger_sig("SetProcessAttrib_RubyServr", safeJsonSerialize(l_0_11))
return mp.CLEAN
