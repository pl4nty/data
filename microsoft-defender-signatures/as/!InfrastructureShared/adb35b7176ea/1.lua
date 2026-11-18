-- Threat: !InfrastructureShared
-- Name: adb35b7176ea
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
  l_0_1 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
  l_0_1 = this_sigattrlog[4].utf8p1
else
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.match(l_0_0, "^(%d+);regionsize:(%d+)")
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = tonumber(l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
if l_0_4 <= 4096 then
  return mp.CLEAN
end
local l_0_5 = string.format("%s;%s", string.lower(l_0_0), l_0_1)
if string.find(l_0_5, "user32.dll", 1, true) then
  return mp.CLEAN
end
bm.add_related_string("ProtectVmInfo", l_0_5, bm.RelatedStringBMReport)
return mp.INFECTED
