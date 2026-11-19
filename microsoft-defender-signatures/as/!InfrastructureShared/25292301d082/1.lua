-- Threat: !InfrastructureShared
-- Name: 25292301d082
-- Type: 21

if mp.getfilesize() <= 47 then
  return mp.CLEAN
end
local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset + 26
local l_0_2 = 16
local l_0_3 = ""
if l_0_0.is_header then
  l_0_3 = tostring(headerpage):sub(l_0_1, l_0_1 + l_0_2)
else
  l_0_3 = tostring(footerpage):sub(l_0_1, l_0_1 + l_0_2)
end
local l_0_4, l_0_5, l_0_6 = string.find(l_0_3, "(%d+)")
if l_0_6 ~= nil and tonumber(l_0_6) >= 5 then
  return mp.INFECTED
end
return mp.CLEAN
