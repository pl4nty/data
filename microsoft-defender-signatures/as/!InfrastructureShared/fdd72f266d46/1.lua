-- Threat: !InfrastructureShared
-- Name: fdd72f266d46
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "echo", 1, true)
local l_0_3 = string.find(l_0_1, "|%s*base64%s+%-d")
l_0_3 = l_0_3 or string.find(l_0_1, "|%s*base64%s+%-%-decode")
local l_0_4 = string.find(l_0_1, "|%s*[bkdz]?a?sh")
if not (l_0_2 and l_0_3) or not l_0_4 then
  return mp.CLEAN
end
if l_0_2 >= l_0_3 or l_0_3 >= l_0_4 then
  return mp.CLEAN
end
local l_0_5 = string.match(l_0_1, "echo%s+(.-)%s*|%s*base64")
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = string.gsub(l_0_5, "^['\"]", "")
l_0_5 = string.gsub(l_0_5, "['\"]$", "")
local l_0_6 = string.gsub(l_0_5, "[^A-Za-z0-9+/=]", "")
local l_0_7 = #l_0_6
if l_0_7 < 10 or 131072 < l_0_7 then
  return mp.CLEAN
end
local l_0_8 = l_0_7 % 4
if l_0_8 == 1 then
  return mp.CLEAN
end
local l_0_9 = MpCommon.Base64Decode(l_0_6)
if l_0_9 and 0 < #l_0_9 then
  if string.match(l_0_9, "^sudo%s+lsof%s+%-a%s+%-p%s+%d+%s+%-d%s+cwd%s+%-Fn%s+2>/dev/null%s*|%s*sed%s+%-n%s+'s/%^n//p'%s*|%s*head%s+%-1%s*$") then
    return mp.CLEAN
  end
  local l_0_10 = math_min(#l_0_9, 1024)
  local l_0_11 = string.sub(l_0_9, 1, l_0_10)
  set_research_data("DecodedPayload", l_0_11, false)
  set_research_data("PayloadSize", tostring(#l_0_9), false)
end
return mp.INFECTED
