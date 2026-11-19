-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:JS/Qakbot.SC
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:JsExt

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1, l_0_2 = MpCommon.StringRegExpSearch("^https?:\\/\\/\\w+.\\w+\\/\\w+\\/\\?\\d+$", string.lower(l_0_0))
if l_0_1 == true then
  return mp.INFECTED
end
return mp.CLEAN
