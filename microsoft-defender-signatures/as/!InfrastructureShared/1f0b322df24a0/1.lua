-- Threat: !InfrastructureShared
-- Name: 1f0b322df24a0
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = string.sub(l_0_0, -4)
  local l_0_2 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_2, l_0_1, 1, true) == nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
