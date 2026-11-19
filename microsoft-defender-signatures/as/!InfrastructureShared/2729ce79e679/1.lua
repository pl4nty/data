-- Threat: !InfrastructureShared
-- Name: 2729ce79e679
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset
local l_0_2 = ""
if l_0_0.is_header then
  l_0_2 = tostring(headerpage):sub(l_0_1 - 256, l_0_1 + 1)
  l_0_2 = string.gsub(l_0_2, "(.)(.)", "%2")
else
  l_0_2 = tostring(footerpage):sub(l_0_1 - 256, l_0_1 + 1)
  l_0_2 = string.gsub(l_0_2, "(.)(.)", "%2")
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, ".connected -or $", 1, true) then
  return mp.INFECTED
end
return mp.LOWFI
