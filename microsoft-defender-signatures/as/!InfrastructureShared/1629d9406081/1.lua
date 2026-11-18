-- Threat: !InfrastructureShared
-- Name: 1629d9406081
-- Type: 21

local l_0_0 = ""
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = l_0_1.match_offset + 1
local l_0_3 = l_0_1.match_offset + 1 + 512
if l_0_1.is_header then
  l_0_0 = tostring(headerpage):sub(l_0_2, l_0_3):lower()
else
  l_0_0 = tostring(footerpage):sub(l_0_2, l_0_3):lower()
end
local l_0_4 = l_0_0:match("([^:]+:)")
if not l_0_4 then
  return mp.CLEAN
end
if not (string.len(l_0_4) < string.len(l_0_0)) then
  return mp.CLEAN
end
if l_0_4:find("post/owa/", 1, true) and l_0_4:find("powershell", 1, true) and l_0_0:find("x-owa-explicitlogonuser:", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
