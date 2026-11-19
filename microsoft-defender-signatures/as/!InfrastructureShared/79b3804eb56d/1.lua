-- Threat: !InfrastructureShared
-- Name: 79b3804eb56d
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
local l_0_1, l_0_2, l_0_3 = string.find(l_0_0, "%.downloadstring%(%'?\"?https?%://(%d+%.%d+%.%d+%.%d+)%:%d+/%w+")
if not l_0_3 then
  return mp.CLEAN
end
if not isPublicIP(l_0_3) then
  return mp.CLEAN
end
if not isIEXfound(l_0_0) then
  return mp.CLEAN
end
local l_0_4, l_0_5, l_0_6 = string.find(l_0_0, "%.downloadstring%(%'?\"?(https?%://%d+%.%d+%.%d+%.%d+%:%d+)/%w+")
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = {}
l_0_7.SIG_CONTEXT = "PSHELL"
l_0_7.CONTENT_SOURCE = "POWERSHELL"
l_0_7.PROCESS_CONTEXT = "POWERSHELL.EXE"
l_0_7.FILELESS = "true"
l_0_7.CMDLINE_URL = "true"
l_0_7.BREAK_AT_FIRST_HIT_MALWARE = "40"
l_0_7.TAG = "INTERFLOW"
local l_0_8 = SafeGetUrlReputation({l_0_6}, l_0_7, false, 2000)
if l_0_8.urls[l_0_6] and l_0_8.urls[l_0_6].determination == 2 and l_0_8.urls[l_0_6].confidence >= 60 then
  return mp.INFECTED
end
return mp.CLEAN
