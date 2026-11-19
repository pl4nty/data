-- Threat: !InfrastructureShared
-- Name: 126d7ed936305
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
mp.set_mpattribute("ClickFix_PS_Explorer_parent")
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
if #l_0_3 < 50 then
  return mp.CLEAN
end
if 450 < #l_0_3 then
  return mp.CLEAN
end
mp.set_mpattribute("ClickFix_PS_cmdline_lt450")
local l_0_4, l_0_5 = MpCommon.StringRegExpSearch("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
mp.set_mpattribute("ClickFix_PS_found_hidden")
local l_0_6 = {
  "iwr",
  "iex",
  "irm",
  "curl",
  "bitsadmin",
  "e%:jscript",
  "downloadstring",
  "invoke%-restmethod",
  "invoke%-webrequest",
  "invoke%-expression",
  "start%-process",
  "%[scriptblock%]%:%:create",
  "new%-object",
  "web%.client",
  "-usebasicparsing"
}
local l_0_7 = 0
local l_0_8 = 0
local l_0_9 = 0
local l_0_10 = 0
local l_0_11 = 0
local l_0_12 = 0
l_0_3:gsub("\"(.-)\"", function()
  l_0_7 = l_0_7 + 1
end)
l_0_3:gsub("'(.-)'", function()
  l_0_8 = l_0_8 + 1
end)
l_0_9 = select(2, l_0_3:gsub("`", ""))
l_0_12 = select(2, l_0_3:gsub("%^", ""))
l_0_10 = select(2, l_0_3:gsub("([\"'][^\"']-[\"'])[\"']", ""))
l_0_11 = select(2, l_0_3:gsub("[\"'].-[\"']%s*%+%s*[\"']", ""))
local l_0_13 = l_0_7 * 1 + l_0_8 * 1 + l_0_9 * 2 + l_0_10 * 2 + l_0_11 * 2 + l_0_12 * 2
local l_0_14 = 10
if not (l_0_13 >= l_0_14) then
  return mp.CLEAN
end
mp.set_mpattribute("ClickFix_PS_total_obfuscation_signals_gt10")
local l_0_15 = string.gsub(l_0_3, "[\"'`^()+#&]", "")
l_0_15 = string.gsub(l_0_15, "%s", "")
l_0_15 = string.lower(l_0_15)
local l_0_16 = str_count_match(l_0_15, l_0_6)
if 2 <= l_0_16 then
  mp.set_mpattribute("ClickFix_PS_susp_string_gt2")
  return mp.INFECTED
end
return mp.CLEAN
