-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/Pikabot.SB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & RPF:AnyFileHasIOAVURL

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1, l_0_2 = MpCommon.StringRegExpSearch("^file:\\/\\/\\w+.com\\/\\w+\\/\\w+\\.zip$", string.lower(l_0_0))
if l_0_1 == true then
  return mp.INFECTED
end
return mp.CLEAN
