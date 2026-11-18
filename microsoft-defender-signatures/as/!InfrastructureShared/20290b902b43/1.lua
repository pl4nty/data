-- Threat: !InfrastructureShared
-- Name: 20290b902b43
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset
local l_0_2 = 128
local l_0_3 = ""
if l_0_0.is_header then
  l_0_3 = tostring(headerpage):sub(l_0_1, l_0_1 + l_0_2)
else
  l_0_3 = tostring(footerpage):sub(l_0_1, l_0_1 + l_0_2)
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.gsub(l_0_3, "[%d+%-*%/()]+", "")
if l_0_4 ~= nil and 40 < #l_0_3 - #l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
