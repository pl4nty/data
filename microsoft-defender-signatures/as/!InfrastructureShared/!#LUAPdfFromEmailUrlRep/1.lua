-- Threat: !InfrastructureShared
-- Name: !#LUA:PdfFromEmail/UrlRep
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: InEmail & SCPT:LNK/http

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->(PdfUriList)", -15, true) == nil then
  return mp.CLEAN
end
local l_0_1 = split(tostring(headerpage), "\r\n")
local l_0_2 = {}
for l_0_3, l_0_4 in ipairs(l_0_1) do
  local l_0_5, l_0_6 = MpCommon.StringRegExpSearch("^(?:(?:https?|ftp):\\/\\/)?[\\w\\-]+(?:\\.[\\w\\-]+)+", string.lower(l_0_4))
  if l_0_5 == true and 5 < #l_0_4 then
    table.insert(l_0_2, l_0_4)
  end
end
local l_0_7 = {}
l_0_7.SIG_CONTEXT = "LuaGen"
l_0_7.CONTENT_SOURCE = "PDF"
l_0_7.FILELESS = "false"
l_0_7.CMDLINE_URL = "false"
l_0_7.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_7.BREAK_AT_FIRST_HIT_PHISH = "60"
l_0_7.BREAK_AT_FIRST_HIT_CLEAN = "60"
l_0_7.TAG = "Email"
local l_0_8 = CheckUrlReputationSimple(l_0_2, l_0_7, 60)
if l_0_8 == true then
  return mp.INFECTED
end
return mp.CLEAN
