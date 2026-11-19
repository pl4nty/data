-- Threat: !InfrastructureShared
-- Name: 1c29bf7ff35c
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset
local l_0_2 = ""
local l_0_3 = ""
if l_0_0.is_header then
  l_0_2 = tostring(headerpage):sub(l_0_1 - 6, l_0_1 + 5)
  l_0_3 = tostring(headerpage)
else
  l_0_2 = tostring(footerpage):sub(l_0_1 - 6, l_0_1 + 5)
  l_0_3 = tostring(footerpage)
end
l_0_3 = string.lower(l_0_3)
if string.find(l_0_3, "sentinel", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_2, "{%d%d?}{%d%d?}\"%-f'$") then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
l_0_2 = string.gsub(l_0_2, " ", "")
if string.find(l_0_2, "{%d%d?}{%d%d?}\"%-f$") then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
