-- Threat: !InfrastructureShared
-- Name: 39b3f7860e76
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
l_0_0 = string.lower(l_0_0)
if string.len(l_0_0) < 100 then
  return mp.CLEAN
end
if string.find(l_0_0, "%.ps1") then
  return mp.CLEAN
end
if not string.find(l_0_0, "{%d%d?}{%d%d?}") then
  return mp.CLEAN
end
l_0_0 = string.gsub(l_0_0, " ", "")
local l_0_1 = 0
for l_0_2 in string.gmatch(l_0_0, "[\"']%-f[\"']") do
  l_0_1 = l_0_1 + 1
end
if l_0_1 < 2 then
  return mp.CLEAN
end
local l_0_3 = 0
for l_0_4 in string.gmatch(l_0_0, "{%d%d?}{%d%d?}") do
  l_0_3 = l_0_3 + 1
end
if l_0_3 < 2 then
  return mp.CLEAN
end
if 3 < l_0_1 and 3 < l_0_3 or 2 <= l_0_1 and 2 <= l_0_3 and string.find(l_0_0, "`", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
