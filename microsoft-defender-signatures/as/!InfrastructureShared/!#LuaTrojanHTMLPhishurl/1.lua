-- Threat: !InfrastructureShared
-- Name: !#Lua:Trojan:HTML/Phish.url
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: SCRIPT:HTML/Redirect & (Html_file | Lua:HTMLExt) & InEmail

local l_0_0 = mp.GetNormalizedScript(true)
local l_0_1 = {}
for l_0_2 in string.gmatch(l_0_0, "([Hh][Tt][Tt][Pp][Ss]?://%w.-)['\"]") do
  if l_0_1[l_0_2] == nil then
    table.insert(l_0_1, l_0_2)
  end
end
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3.SIG_CONTEXT = "LuaGen"
l_0_3.CONTENT_SOURCE = "HTML"
l_0_3.FILELESS = "false"
l_0_3.CMDLINE_URL = "false"
l_0_3.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_3.BREAK_AT_FIRST_HIT_PHISH = "60"
l_0_3.BREAK_AT_FIRST_HIT_CLEAN = "60"
l_0_3.TAG = "Email"
local l_0_4 = CheckUrlReputationSimple(l_0_1, l_0_3, 60)
if l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
