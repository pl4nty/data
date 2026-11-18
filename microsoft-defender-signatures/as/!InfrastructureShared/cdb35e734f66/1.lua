-- Threat: !InfrastructureShared
-- Name: cdb35e734f66
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p1
end
local l_0_1
if l_0_0 ~= nil then
  l_0_1 = string.lower(string.sub(l_0_0, -7))
  if l_0_1 == "log.log" or l_0_1 == "nds.txt" or l_0_1 == "b_e.log" then
    return mp.INFECTED
  end
end
return mp.CLEAN
