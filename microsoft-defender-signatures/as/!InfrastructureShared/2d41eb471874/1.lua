-- Threat: !InfrastructureShared
-- Name: 2d41eb471874
-- Type: 21
-- Includes: LuaFuncHelper

if not mp.get_mpattribute("InEmail") then
  return mp.CLEAN
end
local l_0_0 = ""
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].p2
elseif this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].p2
else
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "^[Hh][Tt][Tt][Pp][Ss]?:[^'\"]+")
if l_0_1 ~= nil then
  local l_0_2 = {}
  l_0_2.SIG_CONTEXT = "LuaGen"
  l_0_2.CONTENT_SOURCE = "HTML"
  l_0_2.FILELESS = "false"
  l_0_2.CMDLINE_URL = "false"
  l_0_2.BREAK_AT_FIRST_HIT_MALWARE = "60"
  l_0_2.BREAK_AT_FIRST_HIT_PHISH = "60"
  l_0_2.BREAK_AT_FIRST_HIT_CLEAN = "60"
  l_0_2.TAG = "Email"
  local l_0_3 = CheckUrlReputationSimple({l_0_1}, l_0_2, 60)
  if l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
