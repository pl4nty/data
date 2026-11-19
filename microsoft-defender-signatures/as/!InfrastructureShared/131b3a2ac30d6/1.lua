-- Threat: !InfrastructureShared
-- Name: 131b3a2ac30d6
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].wp1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].wp1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].wp1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].wp1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].wp1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].wp1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].wp1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched and this_sigattrlog[10].wp1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched and this_sigattrlog[11].wp1 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p1
elseif this_sigattrlog[12].matched and this_sigattrlog[12].wp1 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p1
elseif this_sigattrlog[13].matched and this_sigattrlog[13].wp1 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p1
elseif this_sigattrlog[14].matched and this_sigattrlog[14].wp1 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p1
elseif this_sigattrlog[15].matched and this_sigattrlog[15].wp1 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p1
end
if this_sigattrlog[1].matched then
  local l_0_1 = this_sigattrlog[1].utf8p1
  if l_0_1 ~= nil and l_0_0 ~= nil then
    local l_0_2 = string.match(l_0_1, "(.*\\)")
    local l_0_3 = string.match(l_0_0, "(.*\\)")
    if l_0_3 ~= nil and l_0_3 == l_0_2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
