-- Threat: !InfrastructureShared
-- Name: 8d4112cfa93f
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
  l_0_1 = this_sigattrlog[5].utf8p1
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = "PFApp_Parent"
local l_0_3 = MpCommon.GetProcessAttributeValue(l_0_0, "PFApp_Parent") or MpCommon.GetProcessAttributeValue(l_0_0, "inherit:PFApp_Parent")
if not l_0_3 then
  l_0_2 = "PFAppTracked"
  l_0_3 = MpCommon.GetProcessAttributeValue(l_0_0, "PFAppTracked") or MpCommon.GetProcessAttributeValue(l_0_0, "inherit:PFAppTracked")
end
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4, l_0_5
if this_sigattrlog[4].matched then
  l_0_4 = this_sigattrlog[4].utf8p2
  l_0_5 = this_sigattrlog[4].utf8p1
end
if not l_0_4 then
  return mp.CLEAN
end
local l_0_6 = nri.GetHttpRequestHeader("User-Agent")
if l_0_0 then
  local l_0_7 = {}
  l_0_7.UserAgent = l_0_6 or ""
  l_0_7.HostName = string.match(l_0_4, ".(.*)")
  l_0_7.Url = l_0_5
  l_0_7.AttributeValue = l_0_3
  l_0_7.AttributeName = l_0_2
  l_0_7.ProcessName = l_0_1
  l_0_7.HttpCommand = nri.GetHttpCommand()
  MpCommon.BmTriggerSig(l_0_0, "NRI:AppomalyTracked_OutboundHttp", safeJsonSerialize(l_0_7))
end
return mp.CLEAN
