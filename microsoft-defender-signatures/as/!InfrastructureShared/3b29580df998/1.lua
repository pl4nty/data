-- Threat: !InfrastructureShared
-- Name: 3b29580df998
-- Type: 21

local l_0_0 = string.lower(tostring(headerpage))
local l_0_1 = l_0_0:match("==(%w+)msscriptcontrol.scriptcontrol")
local l_0_2 = mp.GetBruteMatchData()
local l_0_3 = l_0_2.match_offset + 1
local l_0_4 = 95
local l_0_5 = ""
if l_0_2.is_header then
  l_0_5 = l_0_0:sub(l_0_3, l_0_3 + l_0_4)
else
  l_0_5 = string.lower(tostring(footerpage):sub(l_0_3, l_0_3 + l_0_4))
end
if l_0_1 ~= nil and l_0_5:match(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
