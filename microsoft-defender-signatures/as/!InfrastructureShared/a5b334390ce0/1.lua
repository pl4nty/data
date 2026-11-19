-- Threat: !InfrastructureShared
-- Name: a5b334390ce0
-- Type: 21

local l_0_0 = "\\([^\\]+%.exe)"
local l_0_1 = string.match(string.lower(this_sigattrlog[1].utf8p1), l_0_0)
local l_0_2, l_0_3
local l_0_4 = bm.get_imagepath()
if l_0_4 ~= nil then
  l_0_3 = string.match(l_0_4, l_0_0)
end
if this_sigattrlog[2].matched then
  l_0_2 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_2 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_2 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_2 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_2 = this_sigattrlog[8].utf8p1
end
if l_0_1 ~= nil then
  if l_0_1 == l_0_2 == l_0_1 and l_0_1 ~= l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
